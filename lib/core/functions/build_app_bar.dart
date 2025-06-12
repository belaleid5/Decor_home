import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context,String title) {
  final res = ResponsiveHelper(context);

  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
     elevation: 0.0,
    title: Text(
     title ,
      style: AppTextStyles.inter20(context).copyWith(
        fontSize: res.isDesktop ? res.sp(15) : res.sp(20),
        color: AppColor.primaryColor,
      ),
    ),
  );
}
