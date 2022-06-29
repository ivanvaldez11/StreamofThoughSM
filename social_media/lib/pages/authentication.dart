import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  Authentication({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext Context) {
    return Column(children: [
      Image.asset("images/Mexico.png"),
      Form(
          child: Column(
        children: [
          TextFormField(
            controller: _email,
          ),
          TextFormField(
            controller: _password,
          )
        ],
      ))
    ]);
  }
}
