import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/widget/custom_sup_title_sections.dart';
import 'package:decor_app/core/widget/custom_title_section.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_elevated_butto.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_title_text_form.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';

class SetPasswordBody extends StatelessWidget {
  const SetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "Set Password"),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: res.screenWidth * 0.0812 ),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleSection(title: "Change The Password"),
                CustomSupTitleSection(
                  supTitle:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                ),
                SizedBox(height: res.hp(1.5)),
                CustomTitleTextForm(title: "Password"),
                PasswordField(),
                SizedBox(height: res.hp(0.5)),
                CustomTitleTextForm(title: "Confirm  Password"),
                PasswordField(),
                SizedBox(height: res.hp(1.5)),
                CustomElevatedButton(title: "Reset Password"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

