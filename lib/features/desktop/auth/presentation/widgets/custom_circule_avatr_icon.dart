import 'package:decor_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCircleSocialIcon extends StatelessWidget {
  const CustomCircleSocialIcon({
    super.key,
    required this.onTap,
    required this.imageIcon,
  });

  final void Function() onTap;
  final String imageIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColor.whiteColor,
        child: SvgPicture.asset(imageIcon),
      ),
    );
  }
}
