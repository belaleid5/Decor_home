import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CustomTitleTextForm extends StatelessWidget {
  const CustomTitleTextForm({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Align(
      alignment: res.isDesktop ? Alignment(-0.3, 0) : Alignment.centerLeft,

      child: Text(title, style: AppTextStyles.inter20(context)),
    );
  }
}
