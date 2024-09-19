
import 'dart:convert';


import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';
import 'package:http/http.dart' as http;

//All_Product_Api_Using...(http)
class ProductAllApi {
  Future<List<Product>> getApiProduct()async{
    List<Product>productAllDataList = [];
    http.Response res = 
    await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var d = jsonDecode(res.body);
    for(var e in d){
      productAllDataList.add(Product.fromJson(e));
    }
    return productAllDataList;
  }
}