import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/home_screen.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/onbording_screen/onboarding_slides_screen.dart';
import 'package:flutter/material.dart';
class Wrapper extends StatefulWidget {
  const Wrapper({
    super.key,
  });
  @override
  State<Wrapper> createState() => _WrapperState();
}
class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is logged in
            return const HomeScreen();
          } else {
            // Show splash or onboarding screen while waiting for auth state
            return const OnboardindScreen();
          }
        },
      ),
    );
  }
}
