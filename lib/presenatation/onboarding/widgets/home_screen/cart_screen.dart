import 'package:firebaseconnection/core/constants/provaider/category_provider.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).getProductDataCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, value, child) {
          if (value.cartData.isEmpty) {
            return const Center(child: Text("Your cart is empty!"));
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: value.cartData.length,
              itemBuilder: (context, index) {
                return ProductCart(
                  productData: value.cartData[index],
                  addToCartIcon: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // Add product to cart or increase quantity
                      Provider.of<CategoryProvider>(context, listen: false)
                          .addProductToCart(value.cartData[index]);
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
