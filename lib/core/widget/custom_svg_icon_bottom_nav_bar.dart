import 'package:decor_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgIConBottomNavBar extends StatelessWidget {
  const CustomSvgIConBottomNavBar({
    super.key,
    required int selectedIndex,
    required this.image, required this.indexNum,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;
  final String image;
  final int indexNum;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: 24,
      height: 24,
      color: _selectedIndex == indexNum ? AppColor.iconColor : AppColor.primaryColor,
    );
  }
}
