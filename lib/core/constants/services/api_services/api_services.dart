import 'package:dio/dio.dart';
// import 'package:firebaseconnection/domain/category_model.dart';
import 'package:firebaseconnection/domain/prodact_models/category_model.dart';

class ApiService {
  static final _dio = Dio();

  static Future<List<CategoryModel>> getAllCategories() async {
    List<CategoryModel> categories = [];
    final response =
        await _dio.get("https://fakestoreapi.com/products/categories");
    // final categoryList = response.data as List<String>;
    final categoryList = response.data;

    for (int i = 0; i < categoryList.length; i++) {
      categories.add(
        CategoryModel(
          id: categoryList[i],
          name: categoryList[i].toUpperCase(),
        ),
      );
    }
    
    return categories;
  }
}
