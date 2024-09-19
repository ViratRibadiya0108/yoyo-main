import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnection/core/constants/services/firbase_firestore_collection.dart';

class AuthService {
  static final firStore = FirebaseFirestore.instance;
  // ignore: non_constant_identifier_names
  static Future<UserCredential> createAccountScreen(
      {required String email, required String password}) async {
    final firebase = FirebaseAuth.instance;
    final userCredential = await firebase.createUserWithEmailAndPassword(
        email: email, password: password);
        final userData = {
          'email' : userCredential.user?.email,
          'password':password,
          'uid' : userCredential.user?.uid
        };
        await firStore 
        .collection(FirbaseFirestoreCollection.user)
        .doc(userCredential.user?.uid)
        .set(userData);
        await firStore 
        .collection(FirbaseFirestoreCollection.cart)
        .doc(userCredential.user?.uid)
        .set({}); 
    return userCredential;
  }

  // ignore: non_constant_identifier_names
  static Future<UserCredential> loginScreen({
    required String email,
    required String password,
  }) async {
    final firbase = FirebaseAuth.instance;
    final userCredential = await firbase.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential;
  }
  // ignore: non_constant_identifier_names
  static Future<void> homeScreen()
  async{
   final firbase = FirebaseAuth.instance;
   await firbase.signOut();
  }

  static Future<void> forgetPassword({
    required String email,
  })
  async{
    final firebase = FirebaseAuth.instance;
   await firebase.sendPasswordResetEmail(email: email);
  
  }



  

}

