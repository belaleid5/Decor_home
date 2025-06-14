import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/set_passowrd_body.dart';
import 'package:flutter/material.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetPasswordBody());
  }
}


