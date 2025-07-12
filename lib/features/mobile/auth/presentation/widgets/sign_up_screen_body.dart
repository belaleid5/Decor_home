import 'package:decor_app/core/functions/form_validators.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_images.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/core/widget/adaptive_input_field.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_credentail_entity.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_cubit.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_circule_avatr_icon.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_elevated_butto.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_title_text_form.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/go_to_sign_up_or_in.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/password_field.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/terms_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: res.isDesktop ? 64 : 32.0),
      child: Form(
        key: formKey,
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleTextForm(title: "Full name"),
            AdaptiveInputField(
              validate: FormValidators.validateUsername,
              hintText: "Full name",
              controller: fullNameController,
              context: context,
            ),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Email"),
            AdaptiveInputField(
              validate: FormValidators.validateEmail,
              hintText: "example@example.com",
              controller: emailController,
              context: context,
            ),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Phone"),
            AdaptiveInputField(
              validate: FormValidators.validatePhone,
              hintText: "+ 123 456 789",
              controller: phoneController,
              context: context,
            ),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Date of birth"),
            AdaptiveInputField(
              validate: FormValidators.validateRequired,
              hintText: "DD / MM /YYY",
              controller: dateOfBirthController,
              context: context,
            ),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Password"),
            PasswordField(
              validate: FormValidators.validatePassword,
              controller: passwordController,
            ),
            SizedBox(height: res.hp(0.7)),
            CustomTitleTextForm(title: "Confirm Password"),
            PasswordField(
              validate:
                  (value) => FormValidators.validateConfirmPassword(
                    value,
                    passwordController.text,
                  ),
              controller: confirmPasswordController,
            ),
            SizedBox(height: res.hp(1.5)),
            TermCondition(),
            SizedBox(height: res.hp(0.7)),
            CustomElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final entity = AuthCredentialEntity(
                    fullName: fullNameController.text.trim(),
                    email: emailController.text.trim(),
                    mobilePhone: phoneController.text.trim(),
                    dateOfBirth: dateOfBirthController.text.trim(),
                    password: passwordController.text.trim(),
                    confirmPassword: confirmPasswordController.text.trim(),
                    userName: emailController.text.trim(),
                  );
                  context.read<AuthCubit>().signUp(entity);
                }
              },
              title: "SignUp",
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "or sign up with",
                style:
                    res.isDesktop
                        ? AppTextStyles.poppins14(context)
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
            SizedBox(height: res.hp(0.7)),
            GoToSignUpOrIn(
              firstMessage: "Already have an account?",
              goToScreen: "LogIn",
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRouter.loginRoute);
              },
            ),
            SizedBox(height: res.hp(0.7)),
          ],
        ),
      ),
    );
  }
}
