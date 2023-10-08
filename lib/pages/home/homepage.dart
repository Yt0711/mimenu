import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_restaurant/pages/auth/Login/login.dart';
import 'package:home_restaurant/responsive/desktop_body.dart';
import 'package:home_restaurant/responsive/mobile_body.dart';
import 'package:home_restaurant/responsive/responsive_layout.dart';
import 'homepage_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePageWrapper(
            child: const ResponsiveLayout(
              desktopBody: MyDesktopBody(),
              mobileBody: MyMobileBody(),
            ),
          );
        }
        return const LoginPage();
      },
    ));
  }
}
