import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_images.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/features/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:decor_app/features/auth/presentation/widgets/custom_circule_avatr_icon.dart';
import 'package:decor_app/features/auth/presentation/widgets/custom_elevated_butto.dart';
import 'package:decor_app/features/auth/presentation/widgets/custom_title_text_form.dart';
import 'package:decor_app/features/auth/presentation/widgets/go_to_sign_up_or_in.dart';
import 'package:decor_app/features/auth/presentation/widgets/terms_condition.dart';
import 'package:flutter/material.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: res.isDesktop ? 64 : 32.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleTextForm(title: "Full name"),
            CustomTextFormFiled(hint: "Full name"),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Email"),
            CustomTextFormFiled(hint: "example@example.com"),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Phone"),
            CustomTextFormFiled(hint: "+ 123 456 789"),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Date of birth"),
            CustomTextFormFiled(hint: "DD / MM /YYY"),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Password"),
            CustomTextFormFiled(hint: "● ● ● ● ● ●● ●"),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Confirm Password"),
            CustomTextFormFiled(hint: "● ● ● ● ● ●● ●"),
            SizedBox(height: res.hp(1.5)),
            TermCondition(),
            SizedBox(height: res.hp(0.7)),
            CustomElevatedButton(),
             Align(
                  alignment: Alignment.center,
                  child: Text(
                    "or sign up with",
                    style:
                        res.isDesktop
                            ? AppTextStyles.poppinsDes14(context)
                            : AppTextStyles.poppins14(context),
                  ),
                ),
                SizedBox(height: res.hp(1.5)),
            Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    CustomCircleSocialIcon(
                      onTap: () {},
                      imageIcon: AppImages.facebookIcon,
                    ),
                    CustomCircleSocialIcon(
                      onTap: () {},
                      imageIcon: AppImages.googleIcon,
                    ),
                  ],
                ),
                SizedBox(height: res.hp(1.0)),
            GoToSignUpOrIn(
              firstMessage: "Already have an account?",
              goToScreen: "LogIn",
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRouter.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}


