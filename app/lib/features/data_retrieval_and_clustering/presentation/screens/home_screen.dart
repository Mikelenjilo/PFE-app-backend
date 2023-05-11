import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/pages/home_page_1.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/pages/home_page_2.dart';
import 'package:projet_de_fin_d_etude/features/data_retrieval_and_clustering/presentation/pages/home_page_3.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          HomePage1(),
          HomePage2(),
          HomePage3(),
        ],
      ),
    );
  }
}
