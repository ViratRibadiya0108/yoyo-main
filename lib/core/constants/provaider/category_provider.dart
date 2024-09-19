import 'package:firebaseconnection/core/constants/services/api_services/api_services.dart';
import 'package:firebaseconnection/core/constants/services/api_services/product_all_api.dart';
import 'package:firebaseconnection/core/constants/services/api_services/product_by_category.dart';
import 'package:firebaseconnection/core/constants/services/api_services/recive_cart.dart';
import 'package:firebaseconnection/domain/prodact_models/category_model.dart';
import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> categories = [];
  List<Product> productByCategoryData = [];
  List<CategoryModel> catagoryAllDataList = [];
  List<Product> productAllDataList = [];
//Category_Provider_ using..(dio)
  Future<void> getAllCategories() async {
    categories = await ApiService.getAllCategories();
    notifyListeners();
  }

  //_Category_All_Product_Using(http)
  Future<void> productAllCategaryProvider({required String id}) async {
    productByCategoryData = await ProductByCategory().categaryOfProdact(id: id);
    notifyListeners();
  }

  productApi() async {
    productAllDataList = await ProductAllApi().getApiProduct();
    notifyListeners();
  }
   

   List<Product> cartData = [];

  Future<void> getProductDataCart() async {
    cartData = await ReciveToCart().getCartProducts();
    notifyListeners(); // Notify listeners to update the UI
  }

  void addProductToCart(Product product) {}
  // List<Product> cartData = [];

  
  // Future<dynamic> getProductDataCart() async{
  //   cartData =  await ReciveToCart().getCartProducts();
  // } 
}
