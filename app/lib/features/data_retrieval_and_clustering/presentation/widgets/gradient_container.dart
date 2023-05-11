import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF88B9F5),
            Color(0xFF4D78AD),
            Color(0xFF335D92),
            Color(0xFF244771),
            // Color(0xFF1F3A5C),
            //Color(0xFF1D2126),
          ],
        ),
      ),
    );
  }
}
