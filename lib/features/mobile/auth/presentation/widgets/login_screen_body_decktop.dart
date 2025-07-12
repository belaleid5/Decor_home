import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/widget/adaptive_input_field.dart';
import 'package:decor_app/core/widget/custom_sup_title_sections.dart';
import 'package:decor_app/core/widget/custom_title_section.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_elevated_butto.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_title_text_form.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/forget_password.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';

class LoginDesktopView extends StatelessWidget {
  const LoginDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveHelper(context);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        height: r.screenHeight * 0.60,
        width: r.screenWidth * 0.50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.secondary),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: r.hp(3)),
            CustomTitleSection(title: 'Welcome'),
            CustomSupTitleSection(
              supTitle: "Please enter your details to proceed.",
            ),
            SizedBox(height: r.hp(2.5)),
            CustomTitleTextForm(title: "Username or email"),

            AdaptiveInputField(
              context: context,
              controller: emailController,
              hintText: "Enter Your Email",
            ),
            SizedBox(height: r.hp(1.5)),

            CustomTitleTextForm(title: "Password"),

            PasswordField(controller: passwordController),
            SizedBox(height: r.hp(4)),

            CustomElevatedButton(title: "LogIn"),
            ForgetPassword(),
            // Add login button or anything else
          ],
        ),
      ),
    );
  }
}
