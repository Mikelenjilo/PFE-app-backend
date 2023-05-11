import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/config/utils/UIConstants.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/widgets/bottom_widget.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/widgets/gradient_container.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientContainer(),
          Positioned(
            top: 5,
            right: -15,
            child: Container(
              width: 428,
              height: 315,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(99),
                  bottomRight: Radius.circular(99),
                ),
                image: DecorationImage(
                  image: AssetImage('images/image1.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 376,
            left: 15,
            child: Container(
              width: 351,
              height: 76,
              child: Center(
                child: Opacity(
                  opacity: 1,
                  child: Text(
                    'EpidemicZone',
                    style: GoogleFonts.marcellus(
                      color: const Color(0xFFD9D9D9),
                      fontSize: 52,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 460,
            left: 55,
            child: Container(
              width: 272,
              height: 112,
              child: Center(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 1,
                      child: Text(
                        'Notre application peut vous \n aider à prendre les\n précautions nécessaires pour\n prévenir la propagation d\'une \n épidémie.',
                        style: GoogleFonts.karla(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 633,
            left: 150,
            child: Center(
              child: Container(
                width: 81,
                height: 41,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const BottomWidgets(currentPage: Pages.HomePage1),
        ],
      ),
    );
  }
}
