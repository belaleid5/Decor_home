import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title,bool ?leadingIcon) {
  final res = ResponsiveHelper(context);

  return AppBar(
    automaticallyImplyLeading: leadingIcon ??true,
    centerTitle: true,
    elevation: 0.0,
    title: Text(
      title,
      style: AppTextStyles.inter20(context).copyWith(
        fontSize: res.sp(20),
        color: AppColor.primaryColor,
      ),
    ),
  );
}
