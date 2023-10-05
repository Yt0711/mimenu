import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AjustesPage extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;

  AjustesPage({super.key});

  signOut() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(height: 20),
          Container(),
          Flexible(
            child: ElevatedButton(
                onPressed: () {
                  signOut();
                },
                child: const Text("Logout")),
          ),
        ],
      ),
    ));
  }
}
