import 'package:firebaseconnection/core/constants/provaider/category_provider.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/cetagary_product/catagary_product_gridview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCategary extends StatefulWidget {
  const ProductCategary({super.key, required this.iD});

  final String iD;

  @override
  State<ProductCategary> createState() => _ProductCategaryState();
}

class _ProductCategaryState extends State<ProductCategary> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false)
        .productAllCategaryProvider(id: widget.iD);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenHeight = MediaQuery.of(context).size.height;

    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cetagary"),
      ),
      body: Column(
        children: [
          Expanded(
            // Wrap GridView with Expanded
            child: Consumer<CategoryProvider>(
                builder: (context, allCatagory, child) {
              return CatagaryProductGridview(allCatagory: allCatagory);
            }),
          )
        ],
      ),
    );
  }
}
