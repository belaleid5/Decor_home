import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColor.primaryColor),
          minimumSize: WidgetStateProperty.all(
            res.isDesktop
                ? Size(res.wp(22), res.hp(6))
                : Size(res.wp(40), res.hp(6)),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style:
              res.isDesktop
                  ? AppTextStyles.inter20(
                    context,
                  ).copyWith(color: AppColor.textColorButton)
                  : AppTextStyles.inter20(
                    context,
                  ).copyWith(color: AppColor.textColorButton),
        ),
      ),
    );
  }
}
