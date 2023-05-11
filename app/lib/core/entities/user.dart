import 'package:equatable/equatable.dart';

class User extends Equatable {
  int id;
  String prenom;
  String nom;
  String dateDeNaissance;
  String email;
  String motDePasse;
  String maladieChronique;
  String gender;
  double latitude;
  double longitude;
  int? clusterId;
  int? siInfecte = 0;
  String? dateDeContamination;
  bool online = false;

  User({
    required this.id,
    required this.prenom,
    required this.nom,
    required this.dateDeNaissance,
    required this.email,
    required this.motDePasse,
    required this.maladieChronique,
    required this.gender,
    required this.latitude,
    required this.longitude,
    this.clusterId,
    this.siInfecte,
    this.dateDeContamination,
  });

  @override
  List<Object?> get props => [
        id,
        prenom,
        nom,
        dateDeNaissance,
        email,
        motDePasse,
        maladieChronique,
        gender,
        latitude,
        longitude,
        clusterId,
        siInfecte,
        dateDeContamination,
      ];
}
