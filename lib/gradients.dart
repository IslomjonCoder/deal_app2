import 'package:flutter/material.dart';

import 'colors.dart';

class CustomGradients {
  static const backgroundGradient = LinearGradient(
    begin: Alignment(1.2, -0.7),
    end: Alignment(-0.5, 1),
    stops: [0, 0.22, 0.72, 1],
    colors: [
      CustomColors.cff8f8f,
      CustomColors.cff9593f0,
      CustomColors.cff8c8aff,
      CustomColors.cff4200ff,
    ],
  );
}
