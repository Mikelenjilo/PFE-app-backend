import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/core/services/sql_helper.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/datasource/clusters_local_datasource.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/datasource/users_local_datasource.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/models/cluster_model.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/repositories/cluster_repository_impl.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/data/repositories/user_repository_impl.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/cluster.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/usecases/calculate_cluster_rayon.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/usecases/calculate_taux_de_propagation.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/usecases/comit_user_changes_to_database.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/usecases/format_users.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/usecases/get_sick_users.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/usecases/groupe_users_by_location.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/usecases/update_sick_users.dart';
import 'features/data_retrieval_and_clustering/presentation/screens/home_screen.dart';

void main() {
  runApp(const EpidemicZone());
}

class EpidemicZone extends StatefulWidget {
  const EpidemicZone({super.key});

  @override
  State<EpidemicZone> createState() => _EpidemicZoneState();
}

class _EpidemicZoneState extends State<EpidemicZone> {
  Future<void> test() async {
    List<User> users = [];
    List<Map<String, dynamic>> usersMap = await LocalDatabaseHelper.getUsers();

    users = await FormatUsers(UserRepositoryImpl(UsersLocalDataSourceImpl()))
        .run(usersMap);

    await UpdateSickUsers(UserRepositoryImpl(UsersLocalDataSourceImpl()))
        .run(users);

    List<Cluster> clusters = await GroupUsersByLocation(
            ClusterRepositoryImpl(ClustersLocalDataSourceImpl()))
        .run(users);

    await CommitUserChangesToDatabase(
            UserRepositoryImpl(UsersLocalDataSourceImpl()))
        .run(users);

    CalculateClusterRayon(ClusterRepositoryImpl(ClustersLocalDataSourceImpl()))
        .run(clusters);
    CalculateTauxDePropagation(
            ClusterRepositoryImpl(ClustersLocalDataSourceImpl()))
        .run(clusters);

    for (var cluster in clusters) {
      print(cluster.tauxDePropagation);
    }
  }

  @override
  void initState() {
    super.initState();
    test();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('test')),
      body: const Center(child: Text('center')),
    );
  }
}
