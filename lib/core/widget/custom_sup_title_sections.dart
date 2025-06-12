import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CustomSupTitleSection extends StatelessWidget {
  const CustomSupTitleSection({super.key, required this.supTitle,});
  final String supTitle;
  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Text(supTitle, style: res.isDesktop ? AppTextStyles.poppinsDes14(context):  AppTextStyles.poppins14(context));
  }
}
