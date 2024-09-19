import 'package:firebaseconnection/domain/onboarding_slide_model.dart';


class AppConstants {
  static const onboardingSlides = <OnboardingSlideModel>[
    OnboardingSlideModel(
        image:
            'https://images.unsplash.com/photo-1547887537-6158d64c35b3?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        label: 'Perfumes',
        subTitle: 'Unleash your essence; let your fragrance tell your story.'),
    OnboardingSlideModel(
        image:
            'https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?q=80&w=1530&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        label: 'Beauty',
        subTitle:
            "Unlock your beauty's full potential with our organic secrets."),
    OnboardingSlideModel(
        image:
            'https://images.unsplash.com/photo-1561060511-78b14b799fe1?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        label: 'Jewellery',
        subTitle: 'Adorn yourself with a touch of luxury.'),
  ];
}

class HomesceenOnbordingSlideData {
  static const homeonbordingSlide = <HomesceenOnbordingSlideModel>[
    HomesceenOnbordingSlideModel(
      //1
        image: 'assets/bag.png', label: "20% Off On Bag"),
      //2
    HomesceenOnbordingSlideModel(
        image: 'assets/elactronic.png', label: '10% Off On Elactronic'),
      //3
    HomesceenOnbordingSlideModel(
        image: 'assets/cosmetic_products.png', label: '10% Off On Cosmetic'),
      //4
    HomesceenOnbordingSlideModel(
        image: 'assets/crocarise.png', label: '10% Off On Crocarise'),
      //5
    HomesceenOnbordingSlideModel(
        image: 'assets/leather_shoes.png', label: '10% Off On Leather_Shoes'),
      //6
    HomesceenOnbordingSlideModel(
        image: 'assets/perfume.png', label: '10% Off On Perfume'),
      //7
    HomesceenOnbordingSlideModel(
        image: 'assets/sneakers_shoes.png', label: '10% Off On sneakers'),
      //8
    HomesceenOnbordingSlideModel(
        image: 'assets/sound.png', label: '10% Off On Sound'),
  ];
}
