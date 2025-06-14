import 'package:decor_app/core/functions/build_outline_border.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class TextFormForgetPassword extends StatelessWidget {
  const TextFormForgetPassword({
    super.key,
    required this.res,
  });

  final ResponsiveHelper res;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: res.isDesktop ? res.wp(40) : res.wp(330),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.whiteColor,
              enabledBorder: buildOutlineBorder(),
              focusedBorder: buildOutlineBorder(),
              border: buildOutlineBorder(),
              hintText: "Forget Password",
              hintStyle:
    res.isDesktop
        ? AppTextStyles.poppins14(
          context,
        ).copyWith(color: AppColor.insideColor)
        : AppTextStyles.poppins14(
          context,
        ).copyWith(color: AppColor.insideColor),
            ),
          ),
        );
  }
}