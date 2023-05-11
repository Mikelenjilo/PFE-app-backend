import 'dart:math';

import 'package:path/path.dart';
import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/core/utils/constants.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/cluster.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDatabaseHelper {
  static Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final fullPath = join(path, AppConstants.databaseName);

    return await openDatabase(
      fullPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE clusters (
          id_cluster INTEGER PRIMARY KEY,
          nombre_de_personnes_totale INTEGER,
          nombre_de_personnes_malades INTEGER,
          centroid_latitude REAL,
          centroid_longitude REAL,
          rayon REAL,
          taux_de_propagation REAL
        )
      ''');

        await db.execute('''
        CREATE TABLE utilisateurs (
          id_utilisateur INTEGER PRIMARY KEY,
          prenom TEXT,
          nom TEXT,
          date_de_naissance TEXT,
          email TEXT,
          mot_de_passe TEXT,
          maladie_chronique TEXT,
          latitude REAL,
          longitude REAL,
          gender TEXT,
          date_de_contamination TEXT,
          si_infecte INTEGER,
          id_cluster INTEGER,
          FOREIGN KEY (id_cluster) REFERENCES clusters (id_cluster)
        )
      ''');
      },
    );
  }

  static Future<void> insertingValuesToDatabase(int numberOfUsers) async {
    Database database = await initDatabase();

    final Batch batch = database.batch();

    final Map<String, Map<String, List<double>>> regions = {
      'South-East Algeria': {
        'lat_range': [19.30761, 24.32125],
        'lon_range': [7.532, 11.99872]
      },
      'Sahara region': {
        'lat_range': [22.64684, 31.6316],
        'lon_range': [-7.621, 11.7487]
      },
      'North-East Algeria': {
        'lat_range': [34.33387, 36.98466],
        'lon_range': [5.83333, 8.82256]
      },
      'North-Central Algeria': {
        'lat_range': [35.02261, 36.85661],
        'lon_range': [2.07988, 5.50536]
      },
      'North-West Algeria': {
        'lat_range': [34.2089, 35.13814],
        'lon_range': [-1.20544, 1.79107]
      }
    };

    final Random random = Random();

    await database.insert(
      'clusters',
      {
        'id_cluster': 0,
        'nombre_de_personnes_totale': 0,
        'nombre_de_personnes_malades': 0,
        'centroid_latitude': 0,
        'centroid_longitude': 0,
        'rayon': 0,
        'taux_de_propagation': 0,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (int i = 0; i < numberOfUsers; i++) {
      final String prenom =
          List.generate(5, (_) => String.fromCharCode(random.nextInt(26) + 97))
              .join();
      final String nom =
          List.generate(5, (_) => String.fromCharCode(random.nextInt(26) + 97))
              .join();
      final String dateDeNaissance = DateTime.now()
          .subtract(Duration(days: random.nextInt(15000)))
          .toIso8601String()
          .split("T")[0];
      final String email = '$prenom.$nom@example.com';
      const String motDePasse = 'password123';
      final String maladieChronique = [
        'Maladies rénales',
        'Cancer',
        'Diabète',
        'Maladies respiratoires',
        'Maladies cardiaques',
        'none',
      ][random.nextInt(6)];

      final String gender = ['Homme', 'Femme'][random.nextInt(2)];

      final String region = regions.keys.toList()[random.nextInt(5)];
      final List<double> latRange =
          regions[region]!['lat_range'] as List<double>;
      final List<double> lonRange =
          regions[region]!['lon_range'] as List<double>;
      final double latitude =
          latRange[0] + random.nextDouble() * (latRange[1] - latRange[0]);
      final double longitude =
          lonRange[0] + random.nextDouble() * (lonRange[1] - lonRange[0]);

      final dateDeContamination = DateTime.now()
          .subtract(Duration(days: random.nextInt(60)))
          .toIso8601String()
          .split("T")[0];

      batch.insert('utilisateurs', {
        'id_utilisateur': i + 1,
        'prenom': prenom,
        'nom': nom,
        'date_de_naissance': dateDeNaissance,
        'email': email,
        'mot_de_passe': motDePasse,
        'maladie_chronique': maladieChronique,
        'latitude': latitude,
        'longitude': longitude,
        'gender': gender,
        'date_de_contamination': dateDeContamination,
        'si_infecte': 0,
        'id_cluster': 0,
      });
    }

    await batch.commit();
    await database.close();
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    Database database = await initDatabase();

    List<Map<String, dynamic>> users = await database.query('utilisateurs');

    if (users.isEmpty) {
      await insertingValuesToDatabase(100);
      users = await database.query('utilisateurs');
    }

    await database.close();

    return users;
  }

  static Future<List<Map<String, Object?>>> getSickUsers() async {
    Database database = await initDatabase();

    var usersToBeUpdated = await database.query(
      'utilisateurs',
      where: 'date_de_contamination >= ?',
      whereArgs: [
        DateTime.now()
            .subtract(const Duration(days: 6))
            .toIso8601String()
            .split("T")[0]
      ],
    );

    await database.close();

    return usersToBeUpdated;
  }

  static Future<void> updateSickUsers(List<User> users) async {
    List<int> ids = [];

    final List<Map<String, Object?>> usersToBeUpdated = await getSickUsers();

    for (var userToBeUpdated in usersToBeUpdated) {
      ids.add(userToBeUpdated['id_utilisateur'] as int);
    }

    for (var user in users) {
      if (ids.contains(user.id)) {
        user.siInfecte = 1;
      }
    }
  }

  static Future<void> registerNewUser(String email, String password) async {
    Database database = await initDatabase();
    await database.insert(
      'utilisateurs',
      {
        'email': email,
        'password': password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    await database.close();
  }

  static Future<List<Map<String, Object?>>> getUserByEmail(String email) async {
    Database database = await initDatabase();
    final result = await database.rawQuery(
      'SELECT * FROM utilisateurs WHERE email = ?',
      [email],
    );

    await database.close();
    return result;
  }

  static Future<List<Map<String, Object?>>> getUserByEmailAndPassword(
      String email, String password) async {
    Database database = await initDatabase();
    final List<Map<String, Object?>> result = await database.rawQuery(
      'SELECT * FROM utilisateurs WHERE email = ? AND mot_de_passe = ?',
      [email, password],
    );

    await database.close();
    return result;
  }

  static Future<void> commitUserChangesToDatabase(List<User> users) async {
    Database database = await initDatabase();

    for (User user in users) {
      await database.update(
        'utilisateurs',
        {
          'si_infecte': user.siInfecte,
          'id_cluster': user.clusterId,
        },
        where: 'id_utilisateur = ?',
        whereArgs: [user.id],
      );
    }

    await database.close();
  }

  static Future<void> commitClusterChangesToDatabase(
      List<Cluster> clusters) async {
    Database database = await initDatabase();

    for (Cluster cluster in clusters) {
      await database.update(
        'clusters',
        {
          'nombre_de_personnes_totale': cluster.numberOfPersons,
          'nombre_de_personnes_malades': cluster.numberOfSickPersons,
          'centroid_latitude': cluster.centroidPosition!.latitude,
          'centroid_longitude': cluster.centroidPosition!.longitude,
          'rayon': cluster.rayon,
          'taux_de_propagation': cluster.tauxDePropagation,
        },
        where: 'id_cluster = ?',
        whereArgs: [cluster.id],
      );
    }

    await database.close();
  }
}
