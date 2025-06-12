import 'package:decor_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';

class TextRevealAnimation extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Duration delay;
  final Duration duration;

  const TextRevealAnimation({
    super.key,
    required this.text,
    required this.textStyle,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  // ignore: library_private_types_in_public_api
  _TextRevealAnimationState createState() => _TextRevealAnimationState();
}

class _TextRevealAnimationState extends State<TextRevealAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Starts slightly below
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Text(widget.text, style: widget.textStyle),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
