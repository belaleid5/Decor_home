import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_images.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/core/widget/custom_sup_title_sections.dart';
import 'package:decor_app/core/widget/custom_title_section.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_circule_avatr_icon.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_elevated_butto.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_title_text_form.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/forget_password.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/go_to_sign_up_or_in.dart';
import 'package:flutter/material.dart';

class LoginScreenBodyMobile extends StatelessWidget {
  const LoginScreenBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveHelper(context);

    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: r.isTablet ? r.wp(60) : double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: r.wp(r.isMobile ? 8.5 : 5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: r.hp(8)),
                CustomTitleSection(title: 'Welcome'),
                CustomSupTitleSection(
                  supTitle: "Please enter your details to proceed.",
                ),
                SizedBox(height: r.hp(2.5)),
                CustomTitleTextForm(title: "Username or email"),
                SizedBox(height: r.hp(0.5)),
                CustomTextFormFiled(hint: "Enter Your Email"),
                SizedBox(height: r.hp(1.5)),
                CustomTitleTextForm(title: "Password"),
                SizedBox(height: r.hp(0.5)),

                CustomTextFormFiled(
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: AppColor.primaryColor,
                  ),

                  hint: "● ● ● ● ● ● ● ●",
                ),
                SizedBox(height: r.hp(4)),
                CustomElevatedButton(title: "LogIn",),
                SizedBox(height: r.hp(2.5)),

                ForgetPassword(),
                SizedBox(height: r.hp(15)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "or sign up with",
                    style:
                        r.isDesktop
                            ? AppTextStyles.poppins14(context)
                            : AppTextStyles.poppins14(context),
                  ),
                ),
                SizedBox(height: r.hp(2.5)),
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

                SizedBox(height: r.hp(4)),
                GoToSignUpOrIn(
                  goToScreen: "Sign Up",
                  firstMessage: "Don't have an account? ",
                  onTap: () {},
                ),
                SizedBox(height: r.hp(4)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
