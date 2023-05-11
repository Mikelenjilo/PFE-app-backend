import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class Marker extends Equatable {
  final double width;
  final double height;
  final LatLng? position;
  final double iconSize;
  final Color iconColor;
  final VoidCallback? onPressed;

  Marker({
    required this.width,
    required this.height,
    required this.position,
    required this.iconSize,
    required this.iconColor,
    this.onPressed,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        width,
        height,
        position,
        iconSize,
        iconColor,
        onPressed,
      ];
}
