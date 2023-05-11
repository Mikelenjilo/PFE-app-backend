import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/config/utils/UIConstants.dart';

class BottomWidgets extends StatelessWidget {
  final Pages currentPage;

  const BottomWidgets({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    double opacity1 = 0.5;
    double opacity2 = 0.5;
    double opacity3 = 0.5;

    switch (currentPage) {
      case Pages.HomePage1:
        opacity1 = 1.0;
        break;
      case Pages.HomePage2:
        opacity2 = 1.0;
        break;
      case Pages.HomePage3:
        opacity3 = 1.0;
        break;
    }

    return Stack(
      children: [
        Positioned(
          top: 745,
          left: 150,
          child: Opacity(
            opacity: opacity1,
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
        Positioned(
          top: 745,
          left: 180,
          child: Opacity(
            opacity: opacity2,
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
        Positioned(
          top: 745,
          left: 210,
          child: Opacity(
            opacity: opacity3,
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
