import 'dart:convert';

import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/features/mobile/auth/data/models/auth_token_model.dart';
import 'package:decor_app/features/mobile/auth/data/models/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(AuthTokenModel tokens);
  Future<AuthTokenModel> getCachedToken();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();

  Future<void> cacheUser(LoginModel user);
  Future<LoginModel?> getCachedUser();

  Future<void> clearAuthData();
  Future<bool> hasToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl({required this.secureStorage});

  static const String tokenKey = 'auth_tokens';
  static const String userKey = 'user_key';

  @override
  Future<void> cacheToken(AuthTokenModel tokens) async {
    try {
      await secureStorage.write(
        key: tokenKey,
        value: jsonEncode(tokens.toJson()),
      );
    } catch (e) {
      throw ServerFailure("Error while caching token: ${e.toString()}");
    }
  }

  @override
  Future<void> cacheUser(LoginModel user) async {
    try {
      await secureStorage.write(key: userKey, value: jsonEncode(user.toJson()));
    } catch (e) {
      throw ServerFailure("Error while caching user: ${e.toString()}");
    }
  }

  @override
  Future<void> clearAuthData() async {
    try {
      await secureStorage.delete(key: tokenKey);
      await secureStorage.delete(key: userKey);
    } catch (e) {
      throw ServerFailure("Error while clearing auth data: ${e.toString()}");
    }
  }

  @override
  Future<AuthTokenModel> getCachedToken() async {
    try {
      final tokenJson = await secureStorage.read(key: tokenKey);
      if (tokenJson == null) {
        throw ServerFailure("Token not found");
      }
      return AuthTokenModel.fromJson(jsonDecode(tokenJson));
    } catch (e) {
      throw ServerFailure("Error while getting token: ${e.toString()}");
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      final tokenJson = await secureStorage.read(key: tokenKey);
      if (tokenJson == null) return null;
      final decoded = jsonDecode(tokenJson);
      return decoded.containsKey('access') ? decoded['access'] : null;
    } catch (e) {
      throw ServerFailure("Error while getting access token: ${e.toString()}");
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      final tokenJson = await secureStorage.read(key: tokenKey);
      if (tokenJson == null) return null;
      final decoded = jsonDecode(tokenJson);
      return decoded.containsKey('refresh') ? decoded['refresh'] : null;
    } catch (e) {
      throw ServerFailure("Error while getting refresh token: ${e.toString()}");
    }
  }

  @override
  Future<LoginModel?> getCachedUser() async {
    try {
      final userJson = await secureStorage.read(key: userKey);
      if (userJson == null) return null;
      return LoginModel.fromJson(jsonDecode(userJson));
    } catch (e) {
      throw ServerFailure("Error while getting user: ${e.toString()}");
    }
  }

  @override
  Future<bool> hasToken() async {
    try {
      final token = await secureStorage.read(key: tokenKey);
      return token != null;
    } catch (e) {
      return false;
    }
  }
}
