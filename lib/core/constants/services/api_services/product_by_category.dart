
import 'dart:convert';


import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';
import 'package:http/http.dart' as http;


class ProductByCategory {
  Future<List<Product>> categaryOfProdact({required String id})async{
    List<Product>productByCategoryData = [];
    http.Response res = 
    await http.get(Uri.parse('https://fakestoreapi.com/products/category/$id'));
    var d = jsonDecode(res.body);
    for(var e in d){
      productByCategoryData.add(Product.fromJson(e));
    }
    return productByCategoryData;
  }
}