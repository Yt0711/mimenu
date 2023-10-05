import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_restaurant/Login/login.dart';
import 'package:home_restaurant/responsive/desktop_body.dart';
import 'package:home_restaurant/responsive/mobile_body.dart';
import 'package:home_restaurant/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ResponsiveLayout(
            desktopBody: MyDesktopBody(),
            mobileBody: MyMobileBody(),
          );
        }
        return LoginPage();
      },
    ));
  }
}
