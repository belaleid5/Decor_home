import 'package:dartz/dartz.dart';
import 'package:decor_app/core/entity/product_entity.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/home/domain/repositories/base_home_repository.dart';

class ProductUsecase extends BaseUseCase<List<ProductEntity>, NoParams> {
  final BaseHomeRepository baseHomeRepository;

  ProductUsecase({required this.baseHomeRepository});
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
     NoParams params,
  ) async {
    return await baseHomeRepository.getProduct();
  }
}
