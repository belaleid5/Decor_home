import 'dart:developer';

import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_credentail_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_token_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/login_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/use_cases/create_user_usecase.dart';
import 'package:decor_app/features/mobile/auth/domain/use_cases/login_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FlutterSecureStorage storage;
  final SignUpUseCase signUpUseCase;
  final LoginUseCase loginUseCase;

  AuthCubit(
      this.storage, {
        required this.signUpUseCase,
        required this.loginUseCase,
      }) : super(const AuthState());



 Future<void> signUp(AuthCredentialEntity entity) async {
  log('SignUp called with entity: $entity');
  if (!isClosed) {
    emit(state.copyWith(status: RequestState.loading));
    log('Emitted loading state');
  }

  final result = await signUpUseCase(entity);
  log('SignUp result: $result');

  result.fold(
    (failure) {
      log('SignUp failed: ${failure.message}');
      if (!isClosed) {
        emit(state.copyWith(
          status: RequestState.error,
          message: failure.message,
          isLoading: false,
        ));
      }
    },
    (token) async {
      if (token.accessToken.isEmpty || token.refreshToken.isEmpty) {
        log('❌ Invalid tokens received');
        if (!isClosed) {
          emit(state.copyWith(
            status: RequestState.error,
            message: 'Registration succeeded but token is invalid.',
            isLoading: false,
          ));
        }
        return;
      }

     log('✅ SignUp succeeded with valid tokens');
      await _cacheToken(token);
      if (!isClosed) {
        emit(state.copyWith(
          status: RequestState.loaded,
          isLoading: false,
          accessToken: token.accessToken,
          refreshToken: token.refreshToken,
        ));
      }
    },
  );
}








  Future<void> login(LoginEntity entity) async {
  if (!isClosed) emit(state.copyWith(status: RequestState.loading));

  final result = await loginUseCase(entity);
  log('Login result: $result');

  result.fold(
    (failure) {
      log('Login failed: ${failure.message}');
      if (!isClosed) {
        emit(state.copyWith(
          status: RequestState.error,
          message: failure.message,
          isLoading: false,
        ));
      }
    },
    (token) async {
      if (token.accessToken.isEmpty || token.refreshToken.isEmpty) {
        log('❌ Invalid tokens received on login');
        if (!isClosed) {
          emit(state.copyWith(
            status: RequestState.error,
            message: 'Login succeeded but token is invalid.',
            isLoading: false,
          ));
        }
        return;
      }

      log('✅ Login succeeded with valid tokens');
      await _cacheToken(token);
      if (!isClosed) {
        emit(state.copyWith(
          status: RequestState.loaded,
          isLoading: false,
          accessToken: token.accessToken,
          refreshToken: token.refreshToken,
        ));
      }
    },
  );
}


  Future<void> logout() async {
    await storage.deleteAll();
    if (!isClosed) emit(const AuthState());
  }

  Future<void> _cacheToken(AuthTokenEntity token) async {
    await storage.write(key: 'access_token', value: token.accessToken);
    await storage.write(key: 'refresh_token', value: token.refreshToken);
  }

  Future<bool> checkIfLoggedIn() async {
    final token = await storage.read(key: 'access_token');
    return token != null && token.isNotEmpty;
  }

  Future<String?> getAccessToken() => storage.read(key: 'access_token');
  Future<String?> getRefreshToken() => storage.read(key: 'refresh_token');
}


