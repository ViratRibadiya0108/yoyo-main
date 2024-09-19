import 'package:firebaseconnection/domain/onboarding_slide_model.dart';
import 'package:flutter/widgets.dart';

class CarouselComponent extends StatelessWidget {
  const CarouselComponent({
    super.key,
    required this.onboardingSlide,
  });

  final OnboardingSlideModel onboardingSlide;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: screenHeight * 0.5,
          width: screenWidth * 0.9,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(60)),
            image: DecorationImage(
              image: NetworkImage(
                onboardingSlide.image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        Text(
          onboardingSlide.label,
          style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: screenHeight * 0.01,
        ),
        Text(
          onboardingSlide.subTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
