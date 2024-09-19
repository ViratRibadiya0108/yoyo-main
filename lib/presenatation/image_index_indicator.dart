import 'package:flutter/material.dart';

class ImageIndexIndicator extends StatelessWidget {
  const ImageIndexIndicator({super.key, required this.isActive});
 final bool isActive;

  @override
  Widget build(BuildContext context) {
    // int _currentIndex = 0;

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
          width: isActive ? 15.0 : 10.0, // Expands if active
          height: isActive ? 15.0 : 10.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.blueAccent : Colors.grey,
            boxShadow: [
              if (isActive)
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.6),
                  spreadRadius: 3,
                  blurRadius: 6,
                ),
            ],
          ),
        )
      ],
    );
  }
}
