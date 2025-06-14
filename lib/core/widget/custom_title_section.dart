import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CustomTitleSection extends StatelessWidget {
  const CustomTitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Align(
      alignment: res.isDesktop ? Alignment(-0.3, 0) : Alignment.centerLeft,

      child: Text(
        title,
        style:
            res.isDesktop
                ? AppTextStyles.inter20(
                  context,
                ).copyWith(fontWeight: FontWeight.bold)
                : AppTextStyles.inter20(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
