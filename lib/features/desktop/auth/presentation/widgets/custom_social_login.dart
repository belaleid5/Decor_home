import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialLogin extends StatelessWidget {
  const CustomSocialLogin({super.key, required this.res, required this.image, required this.name});

  final ResponsiveHelper res;
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: res.wp((220 / res.screenWidth) * 100),
      height: res.hp((48 / res.screenHeight) * 100),
      decoration: BoxDecoration(
        color: AppColor.containerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          SizedBox(
            width: res.wp((18 / res.screenWidth) * 100),
            height: res.wp((18 / res.screenHeight) * 100),
            child: SvgPicture.asset(
              image,
              height: 5,
              width: 5,
            ),
          ),
          Text(
            name,
            style: AppTextStyles.poppins14(context).copyWith(
              color: AppColor.primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
