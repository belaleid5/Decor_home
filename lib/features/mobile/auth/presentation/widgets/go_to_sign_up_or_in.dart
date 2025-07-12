import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GoToSignUpOrIn extends StatelessWidget {
  const GoToSignUpOrIn({
    super.key,
    required this.onTap,
    required this.firstMessage,
    required this.goToScreen,
  });

  final void Function() onTap;
  final String firstMessage;
  final String goToScreen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: firstMessage,
              style: AppTextStyles.poppins14(context),
            ),
            TextSpan(
              text: goToScreen,
              style: AppTextStyles.poppins14(
                context,
              ).copyWith(color: AppColor.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
