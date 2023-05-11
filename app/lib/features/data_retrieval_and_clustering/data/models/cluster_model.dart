import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/cluster.dart';

class ClusterModel extends Cluster {
  ClusterModel({
    required super.id,
    required super.users,
    super.numberOfPersons = 0,
    super.numberOfSickPersons = 0,
    super.centroidPosition,
    super.color = Colors.black,
  });

  @override
  String toString() {
    return 'Cluster(id: $id, users: $users, nombrePersonnes: $numberOfPersons, nombrePersonnesMalades: $numberOfSickPersons, centroidPosition: $centroidPosition, color: $color,)';
  }
}
