import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class TermCondition extends StatelessWidget {
  const TermCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          text: "  By signing up, you agree to \n",
          style: AppTextStyles.poppins14(context),
          children: [
            TextSpan(
              text: "Terms of Use",
              style: AppTextStyles.inter20(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: " and ",
    
              style: AppTextStyles.poppins14(context),
            ),
            TextSpan(
              text: "Privacy Policy.",
              style: AppTextStyles.inter20(
                context,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}