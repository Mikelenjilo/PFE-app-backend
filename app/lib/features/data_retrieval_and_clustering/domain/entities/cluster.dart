import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:projet_de_fin_d_etude/core/entities/user.dart';

class Cluster extends Equatable {
  int id;
  int numberOfPersons;
  int numberOfSickPersons;
  List<User> users;
  LatLng? centroidPosition;
  Color color;
  double rayon;
  double tauxDePropagation = 0;

  Cluster({
    required this.id,
    this.numberOfPersons = 0,
    this.numberOfSickPersons = 0,
    this.centroidPosition,
    this.color = Colors.black,
    required this.users,
    this.rayon = 0,
  });

  @override
  List<Object?> get props => [
        id,
        numberOfPersons,
        numberOfSickPersons,
        centroidPosition,
        color,
        users,
      ];
}
