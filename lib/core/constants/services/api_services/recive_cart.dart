import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnection/core/constants/services/firbase_firestore_collection.dart';
import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';

class ReciveToCart {
  List<Product> cartProducts = [];

  Future<List<Product>> getCartProducts() async {
    final firestore = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    cartProducts = [];
    final data = await firestore
        .collection(FirbaseFirestoreCollection.cart)
        .doc(uid)
        .get();
    final productList = await data.data()?['products'];
    for (var product in productList) {
      cartProducts.add(Product.fromJson(product));
    }
    return cartProducts;
  }
}
