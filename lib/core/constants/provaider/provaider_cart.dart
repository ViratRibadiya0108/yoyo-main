
import 'package:firebaseconnection/core/constants/services/cart_service/cart_function.dart';
import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';

import 'package:flutter/material.dart';

class ProvaiderCart extends ChangeNotifier{

    
  // Future<void> productAllCategaryProvider({required String id}) async {
  //   productByCategoryData = await ProductByCategory().categaryOfProdact(id: id);
  //   notifyListeners();
  // }
  //cartProvidrt
  Future<void> cartProvider (Product productData)async{
   await AddProductToCart.addToCart(productData);
   notifyListeners();
  }

}