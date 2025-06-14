import 'package:decor_app/core/functions/build_outline_border.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.hint,
    this.style,
    this.suffixIcon,
  });

  final String hint;
  final TextStyle? style;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return SizedBox(
      width: res.isDesktop ? res.wp(40) : res.wp(330),
      child: TextFormField(
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: AppColor.secondary,
          enabledBorder: buildOutlineBorder(),
          focusedBorder: buildOutlineBorder(),
          border: buildOutlineBorder(),
          hintText: hint,
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
