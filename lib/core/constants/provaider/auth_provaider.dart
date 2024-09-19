
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnection/core/constants/services/authenticator/firebase_auth.dart';

import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/home_screen.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/onbording_screen/onboarding_slides_screen.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  bool isLoading = false;
  late UserCredential userCredential;

  // Set loading state
  void setLoading(bool value) {
    isLoading = value;
  }

//Create_Account_Provider

  Future<void> createAccountScreen({
    required String email,
    required String password,
  }) async {
    setLoading(true);
    try {
      userCredential = await AuthService.createAccountScreen(
          email: email, password: password);
    } finally {
      setLoading(false);
    }
    notifyListeners();
  }

//Login_Account_Provider

  Future<void> loginScree({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setLoading(true);
    try {
      userCredential =
          await AuthService.loginScreen(email: email, password: password);
    } finally {
      setLoading(false);
    }
    notifyListeners();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }

//SignOut_Login
  Future<void> homeScreen(BuildContext context) async {
    AuthService.homeScreen();

await Navigator.pushAndRemoveUntil(
  context, MaterialPageRoute(builder: (context) => const OnboardindScreen(),), (_) => false);

  }

//Forget_password
  Future<void> forgetPassword(
      {required String email, required BuildContext context}) async {
    setLoading(true);
    try {
      AuthService.forgetPassword(email: email);
    } finally {
      setLoading(false);
    }
    notifyListeners();
    Navigator.pop(context);
  }

  //Cart_data_in_api(Store cart data in firebase Database)
  // Future<dynamic> addProductToCart(Product productDate) async {
  //   final fireStore = FirebaseFirestore.instance;
  //   final userRef = fireStore.collection('user').doc();
  //   try {
  //     await fireStore
  //         .collection('cart')
  //         .doc(userRef.id)
  //         .set(productDate.toJson());
  //   } catch (e) {
  //     // Handle error (e.g., show error message to the user)
  //     // ignore: avoid_print
  //     print('Error adding product to cart: $e');
  //   }
  // }
}
