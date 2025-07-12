import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_credentail_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_token_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthTokenEntity>> createUserWithEmailAndPassword(
    AuthCredentialEntity credential,
  );

  Future<Either<Failure, AuthTokenEntity>> loginUserWithEmailAndPassword(
    LoginEntity credential,
  );

  Future<Either<Failure, AuthTokenEntity>> refreshToken();

  Future<Either<Failure, bool>> validateToken();

  Future<Either<Failure, LoginEntity?>> getCurrentUser();

  Future<Either<Failure, void>> logout();
}
