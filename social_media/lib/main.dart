import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'widgets/loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SocialApp());
}

class SocialApp extends StatelessWidget {
  SocialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocialApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
          body: Center(
        child: Text("Good to Go"),
      )),
    );
  }
}
