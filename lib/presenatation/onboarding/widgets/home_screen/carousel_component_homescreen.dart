import 'package:firebaseconnection/domain/onboarding_slide_model.dart';
import 'package:flutter/material.dart';

class CarouselComponentHomescreen extends StatelessWidget {
  const CarouselComponentHomescreen({super.key, required this.homeOnbording});
  final HomesceenOnbordingSlideModel homeOnbording;
  

  @override
  Widget build(BuildContext context) {
         final screenHeight = MediaQuery.of(context).size.height;
     // ignore: unused_local_variable
     final screenWidth = MediaQuery.of(context).size.width;
    return  Column(
      children: [

        //  SizedBox(height: screenHeight * 0.03,),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: Container(
                      height: screenHeight * 0.2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(homeOnbording.image),
                            fit: BoxFit.cover),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                   homeOnbording.label,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
       

      ],
    );
  }
}





