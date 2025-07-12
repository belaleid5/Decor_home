import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/core/widget/custom_toast_show.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_cubit.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_state.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == RequestState.error) {
          CustomToast.showError(
            "${state.message} An unexpected error occurred. Please try again.",
          );
        }
    
        if (state.status == RequestState.loaded) {
          CustomToast.showSuccess("Account created successfully");
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, AppRouter.loginRoute);
          });
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.status == RequestState.loading,
          color: AppColor.primaryColor,
          progressIndicator: const CircularProgressIndicator(
            color: AppColor.primaryColor,
          ),
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                CustomSliverAppBar(title: "Create Account"),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: const SignUpScreenBody(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
