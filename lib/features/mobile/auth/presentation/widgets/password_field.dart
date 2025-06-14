import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/cusotm_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFiled(
      hint: "●●●●●●●●",
      obscureText: _obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColor.primaryColor,
        ),
        onPressed: _toggleVisibility,
      ),
    );
  }
}
