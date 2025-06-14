import 'package:decor_app/core/functions/build_outline_border.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled({
    super.key,
    required this.hint,
    this.style,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
  });

  final String hint;
  final TextStyle? style;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _typewriterAnimation;
  late Animation<Color?> _borderColorAnimation;
  final FocusNode _focusNode = FocusNode();
  String _displayedHint = '';
  int _charIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200), // مدة ظهور الأحرف
    );

    _typewriterAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _borderColorAnimation = ColorTween(
      begin: AppColor.insideColor.withOpacity(0.5),
      end: AppColor.secondary.withOpacity(0.8),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _displayedHint = widget.hint;
      } else {
        _typewriterEffect();
      }
    });

    _controller.forward();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.reset();
        _controller.forward(); // إعادة تشغيل الأنيميشن عند التركيز
      }
    });
  }

  void _typewriterEffect() {
    if (_charIndex < widget.hint.length) {
      _displayedHint = widget.hint.substring(0, _charIndex + 1);
      _charIndex++;
      setState(() {});
      Future.delayed(const Duration(milliseconds: 100), _typewriterEffect);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return SizedBox(
      width: res.isDesktop ? res.wp(40) : res.wp(330),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return TextFormField(
            focusNode: _focusNode,
            obscureText: widget.obscureText,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              filled: true,
              fillColor: AppColor.secondary,
              enabledBorder: buildOutlineBorder().copyWith(borderSide: BorderSide(color: AppColor.insideColor.withOpacity(0.5))),
              focusedBorder: buildOutlineBorder().copyWith(borderSide: BorderSide(color: _borderColorAnimation.value ?? AppColor.secondary)),
              border: buildOutlineBorder().copyWith(borderSide: BorderSide(color: AppColor.insideColor.withOpacity(0.5))),
              hintText: _displayedHint,
              hintStyle: res.isDesktop
                  ? AppTextStyles.poppins14(context).copyWith(color: AppColor.insideColor)
                  : AppTextStyles.poppins14(context).copyWith(color: AppColor.insideColor),
            ),
          );
        },
      ),
    );
  }
}