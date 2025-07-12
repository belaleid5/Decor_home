import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CustomTitleSectionProduct extends StatelessWidget {
  const CustomTitleSectionProduct({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.poppins15(
        context,
      ).copyWith(color: AppColor.primaryColor),
    );
  }
}
