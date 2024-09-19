import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebaseconnection/core/constants/app_colors.dart';
import 'package:firebaseconnection/core/constants/app_constants.dart';
import 'package:firebaseconnection/presenatation/image_index_indicator.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/login_screen/login_screen.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/onbording_screen/carousel_component.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/login_screen/create_account.dart';
import 'package:flutter/material.dart';

class OnboardindScreen extends StatefulWidget {
  const OnboardindScreen({super.key,});

  @override
  State<OnboardindScreen> createState() => _OnboardindScreenState();
}

class _OnboardindScreenState extends State<OnboardindScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              CarouselSlider.builder(
                itemCount: 3,
                options: CarouselOptions(
                  height: screenHeight * 0.67,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1100),
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index; // Update the current index
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) => CarouselComponent(
                  onboardingSlide: AppConstants.onboardingSlides[index],
                ),
              ),
              SizedBox(height: screenHeight*0.02,),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                bool isActive = _currentIndex == index;
                return ImageIndexIndicator(isActive: isActive);
                
              }).toList(),
            ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ));
                },
                child: Container(
                  height: screenHeight * 0.08,
                  width: screenWidth * 0.85,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 2, 44, 255),
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  child: const Center(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
              },
                child: Text(
                  "Already Have an Account",
                  style: TextStyle(color: AppColors.blue, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
