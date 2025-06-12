import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GoToSignUp extends StatelessWidget {
  const GoToSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Don't have an account? ",
              style: AppTextStyles.poppins14(context),
            ),
            TextSpan(
              text: "Sign up",
              style: AppTextStyles.poppins14(
                context,
              ).copyWith(color: AppColor.primaryColor),
              recognizer:
                  TapGestureRecognizer()
                    ..onTap = () {
                      // Handle sign up tap
                    },
            ),
          ],
        ),
      ),
    );
  }
}
