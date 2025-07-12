import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/core/widget/custom_title_section.dart';
import 'package:decor_app/features/desktop/auth/presentation/widgets/animated_text_form_field.dart';
import 'package:decor_app/features/desktop/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:decor_app/features/desktop/auth/presentation/widgets/go_to_sign_up_or_in_desktop.dart';
import 'package:decor_app/features/desktop/auth/presentation/widgets/login_with_social.dart';
import 'package:flutter/material.dart';

class LoginScreenDesktopBody extends StatelessWidget {
  const LoginScreenDesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: SizedBox(
          height: res.hp((564 / res.screenHeight) * 100),
          width: res.wp((540 / res.screenWidth) * 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 3,
            children: [
              SizedBox(height: 20),
              CustomTitleSection(title: "Login to your account"),
              SizedBox(height: 20),
              LoginWithSocial(res: res),
              Center(
                child: Text(
                  "Or",
                  style: AppTextStyles.semiBold16.copyWith(
                    color: AppColor.iconColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0),

                child: Text("Email", style: AppTextStyles.regular16),
              ),
              AnimatedHintTextField(hint: "belaleid@gmail.com"),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Password", style: AppTextStyles.regular16),
                    Text(
                      "Forget?",
                      style: AppTextStyles.regular16.copyWith(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedHintTextField(
                hint: "Enter your password",
                suffixIcon: Icon(
                  Icons.visibility_off_outlined,
                  color: AppColor.iconColor.withOpacity(0.5),
                ),
              ),

              SizedBox(height: 20),
              CustomElevatedButtonDekTop(),
              SizedBox(height: 32),
              GoToSignUpOrInDesktop(
                onTap: () {},
                firstMessage: 'Already have an account ?',
                goToScreen: 'LogIn',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
