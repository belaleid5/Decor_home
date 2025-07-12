import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/home/domain/entities/bestseller_entity.dart';
import 'package:decor_app/features/mobile/home/domain/repositories/base_home_repository.dart';

class BestSellerUsecase extends BaseUseCase<List<BestSellerEntity>, NoParams> {
  final BaseHomeRepository baseHomeRepository;

  BestSellerUsecase({required this.baseHomeRepository});
  @override
  Future<Either<Failure, List<BestSellerEntity>>> call( NoParams params,) async {
    return await baseHomeRepository.getBestseller();
  }
}
