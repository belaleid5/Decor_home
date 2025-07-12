import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class ShopNow extends StatelessWidget {
  const ShopNow({
    super.key,
    required this.res,
  });

  final ResponsiveHelper res;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: res.screenWidth * 0.1300,
      height: res.screenHeight * 0.03000,
    
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.whiteColor,
      ),
      child: Text(
        "Shop Now",
        style: AppTextStyles.poppins14(
          context,
        ).copyWith(fontFamily: 'League Spartan', fontSize: 9),
      ),
    );
  }
}

