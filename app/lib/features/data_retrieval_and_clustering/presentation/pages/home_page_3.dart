import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/config/utils/UIConstants.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/screens/connexion_screen.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/widgets/bottom_widget.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/widgets/gradient_container.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GradientContainer(),
          const Positioned(
            top: 70,
            left: 60,
            width: 281,
            height: 66,
            child: Text(
              'EpidemicZone',
              style: TextStyle(
                color: Colors.white,
                fontSize: 46,
                fontFamily: 'Mada',
              ),
            ),
          ),
          const Positioned(
            top: 212,
            left: 48,
            width: 305,
            height: 163,
            child: Text(
              'Vous pouvez profiter de toutes les fonctionnalités précédentes en ouvrant un compte ou en vous connectant.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Averia Libre',
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 45,
            right: 45,
            child: ElevatedButton(
              onPressed: () {
                // action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffd9d9d9),
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Créer',
                style: TextStyle(
                  color: Color(0xff1273eb),
                  fontSize: 26,
                  fontFamily: 'Averia Libre',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: 45,
            right: 45,
            child: ElevatedButton(
              onPressed: () {
                // action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Connexion()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffd9d9d9),
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Connexion',
                style: TextStyle(
                  color: Color(0xff1273eb),
                  fontSize: 26,
                  fontFamily: 'Averia Libre',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const BottomWidgets(currentPage: Pages.HomePage3),
        ],
      ),
    );
  }
}
