import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_elevated_butto.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_title_text_form.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/text_form_forget_password.dart';
import 'package:flutter/material.dart';

class CustomContainerFieldForgetPassword extends StatelessWidget {
  const CustomContainerFieldForgetPassword({super.key, required this.res});

  final ResponsiveHelper res;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.containerColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
      ),
    
      height:res.screenWidth > 400 ?res.screenHeight *0.590: res.screenHeight * 0.670,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: res.wp(res.isMobile ? 8.5 : 5),
          vertical: res.hp(res.isMobile ? 8.5 : 5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [
            CustomTitleTextForm(title: "Enter your email address"),
            TextFormForgetPassword(res: res),
            SizedBox(height: res.hp(res.isMobile ? 3.5 : 3)),
            CustomElevatedButton(title: "Next"),
          ],
        ),
      ),
    );
  }
}
