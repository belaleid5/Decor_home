import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/widget/custom_sup_title_sections.dart';
import 'package:decor_app/core/widget/custom_title_section.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_container_form_forget_password.dart';
import 'package:flutter/material.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        SizedBox(height: res.hp(res.isMobile ? 4.5 : 3)),
    
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: res.wp(res.isMobile ? 8.5 : 5),
          ),
          child: CustomTitleSection(title: "Reset Password?"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: res.wp(res.isMobile ? 8.5 : 5),
          ),
          child: CustomSupTitleSection(
            supTitle:res.isDesktop? "Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut labore et dolore\n magna aliqua. "

              :  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
          ),
        ),
        Spacer(),
        CustomContainerFieldForgetPassword(res: res),
      ],
    );
  }
}

