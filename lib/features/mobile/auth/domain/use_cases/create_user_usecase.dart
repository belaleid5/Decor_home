import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_credentail_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_token_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/repositories/auth_repo.dart';

class SignUpUseCase extends BaseUseCase<AuthTokenEntity, AuthCredentialEntity> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, AuthTokenEntity>> call(AuthCredentialEntity params) async {
    return await repository.createUserWithEmailAndPassword(params);
  }
}

