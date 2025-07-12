import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/auth/domain/repositories/auth_repo.dart';

class CheckTokenValidityUseCase implements BaseUseCase<bool, NoParams> {
 final AuthRepository repository;

  CheckTokenValidityUseCase({required this.repository});


  @override
  Future<Either<Failure, bool>> call(NoParams params)async {
    return await repository.validateToken();
  }
}
