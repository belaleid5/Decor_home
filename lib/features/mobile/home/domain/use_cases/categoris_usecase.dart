import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/home/domain/entities/categories_entitry.dart';
import 'package:decor_app/features/mobile/home/domain/repositories/base_home_repository.dart';

class CategoriesUsecase extends BaseUseCase<List<CategoriesEntity>, NoParams> {
  final BaseHomeRepository repository;

  CategoriesUsecase(this.repository);

  @override
  Future<Either<Failure, List<CategoriesEntity>>> call(
     NoParams params,
  ) async {
    return await repository.getCategories();
  }
}
