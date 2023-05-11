import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/domain/entities/marker.dart';
import 'package:flutter_map/flutter_map.dart' as map;

class MarkerModel extends Marker {
  MarkerModel({
    required super.width,
    required super.height,
    required super.position,
    required super.iconSize,
    required super.iconColor,
    super.onPressed,
  });

  void creatingMarker() {
    map.Marker(
      width: width,
      height: height,
      point: position!,
      builder: ((context) {
        return IconButton(
          icon: Icon(
            Icons.circle,
            size: iconSize,
            color: iconColor,
          ),
          onPressed: onPressed,
        );
      }),
    );
  }

  @override
  String toString() {
    return 'MarkerModel(width: $width, height: $height, position: $position, iconSize: $iconSize, iconColor: $iconColor, onPressed: $onPressed)';
  }
}
