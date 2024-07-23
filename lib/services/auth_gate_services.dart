// purpose checked user login or not?

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fooddeliveryapp/pages/home_page.dart';
// import 'package:fooddeliveryapp/services/auth_loginorregistertoggle_services.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           //user is logged in
//           if (snapshot.hasData) {
//             return const HomePage();
//           }

//           //user is not logged in
//           else {
//             return const LoginOrRegisterPage();
//           }
//         },
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';
import 'package:fooddeliveryapp/pages/onboard_page.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user == null) {
      // User is not logged in, navigate to OnboardingScreen
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        ),
      );
    } else {
      // User is logged in, navigate to HomePage
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ),
      );
    }
  }
}

