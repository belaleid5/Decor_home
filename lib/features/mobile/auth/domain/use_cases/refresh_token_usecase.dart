import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/auth_token_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/repositories/auth_repo.dart';

class RefreshTokenUseCase implements BaseUseCase<AuthTokenEntity, NoParams> {
  final AuthRepository authRepository;

  RefreshTokenUseCase({required this.authRepository});

  @override
  Future<Either<Failure, AuthTokenEntity>> call(NoParams params)async {
     
      return await authRepository.refreshToken();
  }
}
