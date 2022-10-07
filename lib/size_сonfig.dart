import 'package:flutter/widgets.dart';

class SizeConfig {
  double screenWidth = 0.0;
  double screenHeight = 0.0;

  SizeConfig(BuildContext context) {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
  }
}
