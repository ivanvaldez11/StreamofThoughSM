import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/authentication.dart';

import 'widgets/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SocialApp());
}

class SocialApp extends StatelessWidget {
  SocialApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initFirebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SocialApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FutureBuilder(
          initialData: _initFirebase,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Ooops and Error is here"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return const Loading();
            }
            return Authentication();
          },
        ),
      ),
    );
  }
}
