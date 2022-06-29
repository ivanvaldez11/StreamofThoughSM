import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/loading.dart';

class Authentication extends StatefulWidget {
  Authentication({Key? key}) : super(key: key);
  @override
  State<Authentication> createState() => _AuthState();
}

class _AuthState extends State<Authentication> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Authentication"),
        ),
        body: loading
            ? Loading()
            : Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!value.contains('@')) {
                          return "Email in wrong format";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 7) {
                          return "Password is too short";
                        }
                        return null;
                      },
                    ),
                    OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text("Login in")),
                    OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _auth
                                .createUserWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text)
                                .whenComplete(() => setState(() {
                                      loading = false;
                                      _email.clear();
                                      _password.clear();
                                    }));
                            setState(() {
                              loading = true;
                            });
                          }
                        },
                        child: Text("Register")),
                    OutlinedButton(
                        onPressed: () {}, child: Text("Forgot Password")),
                  ],
                )));
  }
}
