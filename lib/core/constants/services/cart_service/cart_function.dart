// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebaseconnection/core/constants/services/firbase_firestore_collection.dart';
// import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';

// class AddProductToCart {
//  static Future<dynamic> addToCart(Product product) async {
// final fireStore = FirebaseFirestore.instance;
// final userId = FirebaseAuth.instance.currentUser?.uid;

// final cartRef = fireStore.collection(FirbaseFirestoreCollection.cart).doc(userId);

// final currentProducts = await cartRef.get();
// List<dynamic> currentProductList =
// currentProducts.data()?['products'] ?? [];


// //-------  add  first item -----------------
// if(currentProductList.isEmpty) {
// currentProductList.add(product.toJson());
// final productData = {'products': currentProductList};
// await cartRef.update(productData);
// return ;
// }

// // ------- add existing product in cart (increase Quantity)-----------------
// for(var element in currentProductList){
// if(element['id'] == product.id){
// element['quantity']++;
// final productData = {'products': currentProductList};

// await cartRef.update(productData);
// return;
// }
// }
// // ------- add new product in cart -----------------
// currentProductList.add(product.toJson());
// final productData = {'products': currentProductList};

// await cartRef.update(productData);
// }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebaseconnection/core/constants/services/firbase_firestore_collection.dart';
// import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';

// class AddProductToCart {
//   static Future<void> addToCart(Product product) async {
//     final fireStore = FirebaseFirestore.instance;
//     final userId = FirebaseAuth.instance.currentUser?.uid;

//     if (userId == null) return;  // Ensure the user is authenticated

//     final cartRef = fireStore.collection(FirbaseFirestoreCollection.cart).doc(userId);

//     final currentProducts = await cartRef.get();
//     List<dynamic> currentProductList = currentProducts.data()?['products'] ?? [];

//     // ------- Add the first item -----------------
//     if (currentProductList.isEmpty) {
//       currentProductList.add(product.toJson());
//       final productData = {'products': currentProductList};
//       await cartRef.set(productData);  // Use set() instead of update() to create a new document
//       return;
//     }

//     // ------- Add existing product in cart (increase quantity) -----------------
//     bool productFound = false;
//     for (var element in currentProductList) {
//       if (element['id'] == product.id) {
//         element['quantity']++;
//         productFound = true;
//         break;
//       }
//     }

//     // ------- If product was not found, add a new product to the cart -----------------
//     if (!productFound) {
//       currentProductList.add(product.toJson());
//     }

//     final productData = {'products': currentProductList};
//     await cartRef.update(productData);  // Use update() here to modify an existing document
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnection/core/constants/services/firbase_firestore_collection.dart';
import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';

class AddProductToCart {
  static Future<void> addToCart(Product product) async {
    final fireStore = FirebaseFirestore.instance;
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final cartRef = fireStore.collection(FirbaseFirestoreCollection.cart).doc(userId);

    final currentProducts = await cartRef.get();
    List<dynamic> currentProductList = currentProducts.data()?['products'] ?? [];

    // ------- Check if this is the first item in the cart -------
    if (currentProductList.isEmpty) {
      product.quantity = 1; // Initialize quantity
      currentProductList.add(product.toJson());
      final productData = {'products': currentProductList};
      await cartRef.set(productData); // Use set instead of update for a new document
      return;
    }

    // ------- Check if product already exists in the cart -------
    for (var element in currentProductList) {
      if (element['id'] == product.id) {
        element['quantity'] = (element['quantity'] ?? 0) + 1; // Ensure quantity is not null
        final productData = {'products': currentProductList};
        await cartRef.update(productData);
        return;
      }
    }

    // ------- Add new product to cart -------
    product.quantity = 1; // Initialize quantity for the new product
    currentProductList.add(product.toJson());
    final productData = {'products': currentProductList};
    await cartRef.update(productData);
  }
}
