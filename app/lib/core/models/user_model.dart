import 'package:projet_de_fin_d_etude/core/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.prenom,
    required super.nom,
    required super.dateDeNaissance,
    required super.email,
    required super.motDePasse,
    required super.maladieChronique,
    required super.gender,
    required super.latitude,
    required super.longitude,
    required super.dateDeContamination,
    required super.siInfecte,
    super.clusterId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_utilisateur': id,
      'prenom': prenom,
      'nom': nom,
      'date_de_naissance': dateDeNaissance,
      'email': email,
      'mot_de_passe': motDePasse,
      'maladie_chronique': maladieChronique.toString().split('.').last,
      'latitude': latitude,
      'longitude': longitude,
      'gender': gender,
      'date_de_contamination': dateDeContamination,
      'si_infect': siInfecte,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, prenom: $prenom, nom: $nom, dateDeNaissance: $dateDeNaissance, email: $email, motDePasse: $motDePasse, maladieChronique: $maladieChronique, latitude: $latitude, longitude: $longitude, sexe: $gender, dateDeContamination: $dateDeContamination, siInfecte: $siInfecte, clusterId: $clusterId)';
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final UserModel user = UserModel(
      id: map['id_utilisateur'],
      prenom: map['prenom'],
      nom: map['nom'],
      dateDeNaissance: map['date_de_naissance'],
      email: map['email'],
      motDePasse: map['mot_de_passe'],
      maladieChronique: map['maladie_chronique'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      gender: map['gender'],
      dateDeContamination: map['date_de_contamination'],
      siInfecte: map['si_infecte'],
      clusterId: map['id_cluster'],
    );

    return user;
  }
}
