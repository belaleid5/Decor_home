// responsive_helper.dart
import 'package:flutter/widgets.dart';

class ResponsiveHelper {
  final BuildContext context;
  final double screenWidth;
  final double screenHeight;

  ResponsiveHelper(this.context)
      : screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height;

  // Breakpoints
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 900;
  bool get isDesktop => screenWidth >= 900;

  // Width and height as percentage
  double wp(double percent) => screenWidth * percent / 100;
  double hp(double percent) => screenHeight * percent / 100;

  // Scaled font size based on screen width
  double sp(double fontSize) {
  if (isDesktop) return fontSize * 1.6;
  if (isTablet) return fontSize * 1.3;
  return fontSize * screenWidth / 394; // mobile baseline
}
}
