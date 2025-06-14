import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CustomTitleTextForm extends StatelessWidget {
  const CustomTitleTextForm({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Text(
      title,
      style:
          res.isDesktop
              ? AppTextStyles.inter20(context)
              : AppTextStyles.inter20(context),
    );
  }
}
