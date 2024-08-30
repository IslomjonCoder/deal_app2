import 'dart:ui';

import 'package:flutter/material.dart';

import '../gradients.dart';

class BackgroundGradientOverlay extends StatelessWidget {
  final Widget child;

  const BackgroundGradientOverlay({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: CustomGradients.backgroundGradient,
            // image: DecorationImage(
            //     image: AssetImage(
            //       "assets/images/background_image.png",
            //     ),
            //     fit: BoxFit.cover),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 100,
              sigmaY:
                  100), // Adjust the sigma values to increase or decrease the blur
          child: Container(
            color: Colors.transparent,
          ),
        ),
        child
      ],
    );
  }
}
