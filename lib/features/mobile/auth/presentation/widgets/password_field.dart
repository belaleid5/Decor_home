import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/widget/adaptive_input_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller, this.validate});
  final TextEditingController controller;
// Validate function is not provided in the original code snippet, so it needs to be defined. 
final String? Function(String?)? validate ;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  _PasswordFieldState();
  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveInputField(
      validate: widget.validate,
      context: context,
      suffixPressed: _toggleVisibility,
      suffix:
          _obscureText ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
      suffixColor: AppColor.primaryColor,
      controller: widget.controller,
      hintText: "● ● ● ● ● ● ● ●",
      isPassword: _obscureText,
    );
  }
}
