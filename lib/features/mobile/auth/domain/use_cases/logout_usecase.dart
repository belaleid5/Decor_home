import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/auth/domain/repositories/auth_repo.dart';

class LogoutUsecase implements BaseUseCase<void, NoParams> {
  final AuthRepository repo;

  LogoutUsecase({required this.repo});

  @override
  Future<Either<Failure, void>> call(NoParams params)async {
     return await repo.logout();
  }
}
