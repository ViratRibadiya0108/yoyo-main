import 'package:firebaseconnection/core/constants/provaider/category_provider.dart';
import 'package:flutter/material.dart';

class CatagaryProductGridview extends StatelessWidget {
  const CatagaryProductGridview({super.key,required this.allCatagory});
final CategoryProvider allCatagory;
  @override
  Widget build(BuildContext context) {
     final screenHeight = MediaQuery.of(context).size.height;

    // ignore: unused_local_variable
    final screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.8, // spacing between columns
                ),
                padding:
                    const EdgeInsets.only(top: 15), // padding around the grid
                itemCount: allCatagory
                    .productByCategoryData.length, // total number of items
                itemBuilder: (
                  context,
                  index,
                ) {
                  return Card(
                      color: Colors.blue, // color of grid items
                      child: Column(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              height: screenHeight * 0.2,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.network(
                                      allCatagory
                                          .productByCategoryData[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  // Text(allCatagory.productAllDataList[index].category.toString()),
                                  const Text('peice'),
                                  Text(allCatagory
                                      .productByCategoryData[index].price
                                      .toString()),
                                  // Text(allCatagory
                                  //     .productByCategoryData[index].title),
                                ],
                              ))
                        ],
                      ));
                },
              );
  }
}