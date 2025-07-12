import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/auth/domain/entities/login_entity.dart';
import 'package:decor_app/features/mobile/auth/domain/repositories/auth_repo.dart';

class GetCurrentUserUseCase implements BaseUseCase<LoginEntity?, NoParams> {
  final AuthRepository authRepository;
  GetCurrentUserUseCase(this.authRepository);
  @override
  Future<Either<Failure, LoginEntity?>> call(NoParams params) async {
    return await authRepository.getCurrentUser();
  }
}
