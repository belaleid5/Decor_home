import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/services/service_locator.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/core/widget/custom_toast_show.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_cubit.dart';
import 'package:decor_app/features/mobile/auth/presentation/blocs/auth_state.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/login_screen_body_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
           CustomSliverAppBar(title: "Login"),
            SliverFillRemaining(
              hasScrollBody: false,
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.status == RequestState.error) {
                    CustomToast.showError(
                      " ${state.message} An unexpected error occurred. Please try again.",
                    );

                  }
                  if (state.status == RequestState.loaded) {
                    CustomToast.showSuccess("Login successful");
                    Navigator.pushReplacementNamed(context, AppRouter.mainRoute);
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall:state.status == RequestState.loading,
                    color: AppColor.primaryColor,
                    progressIndicator: const CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                    child: LoginScreenBodyMobile());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
