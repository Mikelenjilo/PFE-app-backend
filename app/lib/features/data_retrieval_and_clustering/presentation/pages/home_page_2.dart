import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/config/utils/UIConstants.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/widgets/bottom_widget.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/widgets/gradient_container.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GradientContainer(),
        const Positioned(
          top: 50,
          left: 35,
          width: 316,
          height: 64,
          child: Text(
            'Fonctionnalités:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'Jost',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const Positioned(
          top: 120,
          left: 10,
          width: 14,
          height: 1,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: 117,
          left: 33,
          width: 275,
          height: 24,
          child: Text(
            'Des mises à jour en temps réel.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Averia Libre',
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const Positioned(
          top: 161,
          left: 10,
          width: 14,
          height: 1,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: 159,
          left: 33,
          width: 207,
          height: 98,
          child: Text(
            'Détecter les zones les plus vulnérables à la propagation d\'une épidémie.',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Averia Libre',
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 170,
          left: 239,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              'images/image2.jpeg',
              width: 99,
              height: 99,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          top: 301,
          left: 10,
          width: 14,
          height: 1,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: 299,
          left: 33,
          width: 224,
          height: 68,
          child: Text(
            'Des notifications  et des recommendations  pour l\'utilisateur.',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Averia Libre',
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 302,
          left: 251,
          width: 99,
          height: 99,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              'images/image3.jpg',
              width: 99,
              height: 99,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Positioned(
          top: 415,
          left: 10,
          width: 14,
          height: 1,
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
        const Positioned(
          top: 413,
          left: 33,
          width: 262,
          height: 67,
          child: Text(
            'Aider les utilisateurs à protéger leur vie et celle des autres.',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Averia Libre',
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          top: 505,
          left: 90,
          width: 200,
          height: 170,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Image.asset(
              'images/image4.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const BottomWidgets(currentPage: Pages.HomePage2),
      ],
    ));
  }
}
