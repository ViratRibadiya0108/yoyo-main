





import 'package:firebaseconnection/core/constants/provaider/provaider_cart.dart';
import 'package:firebaseconnection/domain/prodact_models/product_modelclass.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({
    super.key,
    required this.productData, required IconButton addToCartIcon,
  });

  final Product productData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display product image
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                productData.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.error), // Handle image load failure
              ),
            ),
            // Product price
            Text(
              "Price: ${productData.price.toString()}",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            // Quantity handling with Provider
            Consumer<ProvaiderCart>(
              builder: (context, cart, child) {
                return IconButton(
                  onPressed: () {
                    cart.cartProvider(productData); // Handle adding to cart
                  },
                  icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
