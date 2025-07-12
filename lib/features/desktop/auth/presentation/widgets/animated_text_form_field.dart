import 'dart:async';

import 'package:decor_app/core/functions/build_outline_border.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class AnimatedHintTextField extends StatefulWidget {
  const AnimatedHintTextField({
    super.key,
    required this.hint,
    this.suffixIcon,
    this.obscureText = false,
  });

  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  State<AnimatedHintTextField> createState() => _AnimatedHintTextFieldState();
}

class _AnimatedHintTextFieldState extends State<AnimatedHintTextField> {
  String _displayedHint = '';
  int _charIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypewriterEffect();
  }

  void _startTypewriterEffect() {
    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (_charIndex < widget.hint.length) {
        setState(() {
          _displayedHint += widget.hint[_charIndex];
          _charIndex++;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: SizedBox(
        height: res.hp((48 / res.screenHeight) * 100),
        child: Center(
          child: TextFormField(
            obscureText: widget.obscureText,
            style: AppTextStyles.poppins14(context),
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              hintText: _displayedHint,
              hintStyle: AppTextStyles.regular16.copyWith(
                color: AppColor.iconColor.withOpacity(0.5),
              ),
              enabledBorder: buildOutlineBorderDeskTop().copyWith(
                borderSide: BorderSide(
                  color: AppColor.insideColor.withOpacity(0.5),
                ),
              ),
              focusedBorder: buildOutlineBorderDeskTop().copyWith(
                borderSide: BorderSide(
                  color: AppColor.secondary.withOpacity(0.8),
                ),
              ),
              border: buildOutlineBorderDeskTop().copyWith(
                borderSide: BorderSide(
                  color: AppColor.insideColor.withOpacity(0.5),
                ),
              ),
              isCollapsed: false,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ),
      ),
    );
  }
}
