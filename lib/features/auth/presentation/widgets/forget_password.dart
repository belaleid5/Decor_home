import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
        final r = ResponsiveHelper(context);
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        child: Text("Forgot Password?",style: r.isDesktop? AppTextStyles.poppinsDes14(context):AppTextStyles.poppins14(context),)),
    );
  }
}