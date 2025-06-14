import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          CustomSliverAppBar(title: "Forget Password"),
          SliverFillRemaining(
        hasScrollBody: false,
        child: ForgetPasswordBody(),
          ),
        ],
      ),
    );
  }
}
