import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/features/mobile/auth/data/data_sources/auth_data_source.dart';
import 'package:decor_app/features/mobile/auth/data/data_sources/auth_local_data_source.dart';
import 'package:decor_app/features/mobile/auth/data/models/credenatial_model.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_credentail_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_token_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/login_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/repositories/auth_repo.dart';

import '../../../../../core/error/server_exceprion.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepositoryImpl(this.remote, this.local);

  @override
  Future<Either<Failure, AuthTokenEntity>> createUserWithEmailAndPassword(
    AuthCredentialEntity credential,
  ) async {
    try {
      final model = CredentialModel.formEntity(credential);
      final result = await remote.signUp(
        model.email,
        model.password,
        model.userName,
        model.fullName,
        model.confirmPassword,
        model.mobilePhone,
        model.dateOfBirth,
      );
      await local.cacheToken(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthTokenEntity>> loginUserWithEmailAndPassword(
    LoginEntity credential,
  ) async {
    try {
      final result = await remote.login(
        credential.username,
        credential.password,
      );
      await local.cacheToken(result);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthTokenEntity>> refreshToken() async {
    try {
      final refresh = await local.getRefreshToken();
      if (refresh == null) {
        return Left(ServerFailure("No refresh token found"));
      }
      final result = await remote.refreshToken(refresh);
      await local.cacheToken(result);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure("Refresh token failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, bool>> validateToken() async {
    try {
      final token = await local.getAccessToken();
      return Right(token != null && token.isNotEmpty);
    } catch (e) {
      return Left(ServerFailure("Validate token failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await local.clearAuthData();
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure("Logout failed: ${e.toString()}"));
    }
  }

  @override
  Future<Either<Failure, LoginEntity?>> getCurrentUser() async {
    try {
      final user = await local.getCachedUser();
      return Right(user);
    } catch (e) {
      return Left(ServerFailure("Get user failed: ${e.toString()}"));
    }
  }
}
