import 'package:firebaseconnection/core/constants/provaider/category_provider.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/product_cart.dart';
import 'package:flutter/material.dart';

class HomeProductGridview extends StatelessWidget {
  const HomeProductGridview({super.key, required this.allCatagory});
  final CategoryProvider allCatagory;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenHeight = MediaQuery.of(context).size.height;

    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;

    return GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 8.0,
    crossAxisSpacing: 8.0,
    childAspectRatio: 0.8,
  ),
  padding: const EdgeInsets.only(top: 15),
  itemCount: allCatagory.productAllDataList.length,
  itemBuilder: (context, index) {
    final product = allCatagory.productAllDataList[index];

    return ProductCart(
      productData: product,
      addToCartIcon: IconButton(
        icon: Icon(Icons.add_shopping_cart),
        onPressed: () {
          // Handle adding to cart here
        },
      ),
    );
  },
);

    // return GridView.builder(
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2, // number of items in each row
    //     mainAxisSpacing: 8.0, // spacing between rows
    //     crossAxisSpacing: 8.0,
    //     childAspectRatio: 0.8, // spacing between columns
    //   ),
    //   padding: const EdgeInsets.only(top: 15), // padding around the grid
    //   itemCount: allCatagory.productAllDataList.length, // total number of items
    //   itemBuilder: (
    //     context,
    //     index,
    //   ) {
    //     return ProductCart(
    //         productData: allCatagory.productAllDataList[index], addToCartIcon: null,);
    //   },
    // );
  }
}
