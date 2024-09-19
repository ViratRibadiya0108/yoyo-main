import 'package:firebaseconnection/core/constants/provaider/category_provider.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/cetagary_product/product_cetagary.dart';
import 'package:flutter/material.dart';

class CategoryListview extends StatelessWidget {
  const CategoryListview({super.key, required this.cetegariDate});
  final CategoryProvider cetegariDate;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: cetegariDate.categories.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ProductCategary(iD: cetegariDate.categories[index].id),
            ));
          },
          child: Card(
            color: Colors.yellow,
            margin: const EdgeInsets.all(10),
            child: SizedBox(
                height: screenHeight * 0.1,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(cetegariDate.categories[index].name.toString())
                  ],
                )),
          ),
        );
      },
    );
  }
}
