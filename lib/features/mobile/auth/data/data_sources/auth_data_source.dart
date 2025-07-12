import 'package:decor_app/core/error/dio_excaeption.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/error/server_exceprion.dart';
import 'package:decor_app/core/network/api_constant.dart';
import 'package:decor_app/core/network/dio_client.dart';
import 'package:decor_app/core/services/service_locator.dart';
import 'package:decor_app/features/mobile/auth/data/models/auth_token_model.dart';

import '../../../../../core/network/error_message_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> signUp(
    String email,
    String password,
    String userName,
    String fullName,
    String conFirmPassword,
    String mobilePhone,
    String dateOfBirth,
  );

  Future<AuthTokenModel> login(String email, String password);
  Future<AuthTokenModel> refreshToken(String refreshToken);
}



class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dio = sl<DioClient>();

  @override
  Future<AuthTokenModel> login(String email, String password) async {
    try {
      final response = await dio.post(
        ApiConstant.login,
        data: {'username': email, 'password': password},
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(errorMessageModel: response.data["errors"] ?? "Login failed");
      }

      return AuthTokenModel.fromJson(response.data);
    } catch (error) {
      final errorMessage = ErrorHandler.handle(error);
      throw ServerException(
        errorMessageModel: ErrorMessageModel(message:errorMessage),
      );
    }

  }

  @override
  Future<AuthTokenModel> signUp(
    String email,
    String password,
    String userName,
    String fullName,
    String conFirmPassword,
    String mobilePhone,
    String dateOfBirth,
  ) async {
    try {
      final response = await dio.post(
        ApiConstant.register,
        data: {
          'email': email,
          'password': password,
          'username': userName,
          'full_name': fullName,
          'confirm_password': conFirmPassword,
          'mobile_number': mobilePhone,
          'date_of_birth': dateOfBirth,
        },
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
          errorMessageModel: response.data["errors"]["username"] ?? "Register failed",
        );
      }

      return AuthTokenModel.fromJson(response.data);
    } catch (error) {
      final errorMessage = ErrorHandler.handle(error);
      throw ServerFailure(errorMessage);
    }
  }
  
  @override
  Future<AuthTokenModel> refreshToken(String refreshToken) {
    throw UnimplementedError();
  }
}
