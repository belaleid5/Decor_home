import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_credentail_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_token_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/login_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/repositories/auth_repo.dart';

class LoginUseCase extends BaseUseCase<AuthTokenEntity, LoginEntity> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthTokenEntity>> call(LoginEntity params) async {
    return await repository.loginUserWithEmailAndPassword(params);
  }
}

