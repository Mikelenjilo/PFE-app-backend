import 'package:flutter/material.dart';
import 'package:projet_de_fin_d_etude/core/entities/user.dart';
import 'package:projet_de_fin_d_etude/core/services/sql_helper.dart';

void main() {
  runApp(const EpidemicZone());
}

class EpidemicZone extends StatefulWidget {
  const EpidemicZone({super.key});

  @override
  State<EpidemicZone> createState() => _EpidemicZoneState();
}

class _EpidemicZoneState extends State<EpidemicZone> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('test')),
      body: const Center(child: Text('center')),
    );
  }
}
