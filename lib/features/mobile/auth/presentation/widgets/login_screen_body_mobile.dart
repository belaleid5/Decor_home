import 'package:decor_app/core/functions/form_validators.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_images.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/core/widget/adaptive_input_field.dart';
import 'package:decor_app/core/widget/custom_sup_title_sections.dart';
import 'package:decor_app/core/widget/custom_title_section.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/login_entity.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_cubit.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_circule_avatr_icon.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_elevated_butto.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_title_text_form.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/forget_password.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/go_to_sign_up_or_in.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ... your other imports

class LoginScreenBodyMobile extends StatefulWidget {
  const LoginScreenBodyMobile({super.key});

  @override
  State<LoginScreenBodyMobile> createState() => _LoginScreenBodyMobileState();
}

class _LoginScreenBodyMobileState extends State<LoginScreenBodyMobile> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (formKey.currentState!.validate()) {
      final loginEntity = LoginEntity(
        username: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      context.read<AuthCubit>().login(loginEntity);
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = ResponsiveHelper(context);
    return SizedBox(
      width: r.isTablet ? r.wp(60) : double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: r.wp(r.isMobile ? 8.5 : 5)),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: r.hp(8)),
              CustomTitleSection(title: 'Welcome'),
              CustomSupTitleSection(
                supTitle: "Please enter your details to proceed.",
              ),
              SizedBox(height: r.hp(2.5)),
              CustomTitleTextForm(title: "Email"),
              SizedBox(height: r.hp(0.5)),
              AdaptiveInputField(
                context: context,
                controller: emailController,
                hintText: "Enter Your Email",
                validate: FormValidators.validateEmail,
              ),
              SizedBox(height: r.hp(1.5)),
              CustomTitleTextForm(title: "Password"),
              SizedBox(height: r.hp(0.5)),
              PasswordField(
                validate: FormValidators.validatePassword,
                controller: passwordController,
              ),
              SizedBox(height: r.hp(4)),
              CustomElevatedButton(onPressed: _onLoginPressed, title: "Log In"),
              SizedBox(height: r.hp(2.5)),
              ForgetPassword(),
              SizedBox(height: r.hp(15)),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "or sign up with",
                  style: AppTextStyles.poppins14(context),
                ),
              ),
              SizedBox(height: r.hp(2.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                onTap:
                    () => Navigator.pushReplacementNamed(
                      context,
                      AppRouter.signUpRoute,
                    ),
              ),
              SizedBox(height: r.hp(4)),
            ],
          ),
        ),
      ),
    );
  }
}
