import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: const Color(0xFF1273EB),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
          key: _formKey,
          child: Stack(
            children: [
              //GradientContainer(),
              const Positioned(
                top: 30,
                left: 45,
                width: 300,
                height: 80,
                child: Text(
                  'EpidemicZone',
                  style: TextStyle(
                    color: Color(0xFF1273EB),
                    fontSize: 47,
                    fontFamily: 'Mada',
                  ),
                ),
              ),
              const Positioned(
                top: 130,
                left: 129,
                width: 120,
                height: 120,
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.black,
                  size: 100,
                ),
              ),
              Positioned(
                top: 320,
                left: 40,
                right: 40,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ce champ ne peut pas être vide';
                      } else if (!value.contains('@') ||
                          !value.contains('.com') ||
                          !value.contains('gmail')) {
                        return 'L\'adresse email n\'est pas valide';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.mail, color: Colors.black),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 390,
                left: 40,
                right: 40,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ce champ ne peut pas être vide';
                      } else if (value.length < 8) {
                        return 'Le mot de passe doit contenir au moins 8 caractères';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Mot de passe',
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 480,
                left: 40,
                right: 40,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Soumettre les données ici
                        print('Email: $_email');
                        print('Mot de passe: $_password');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Averia Libre',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 570,
                left: 0,
                right: 0,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Mot de passe oublié ?',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
