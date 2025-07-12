import 'package:dartz/dartz.dart';
import 'package:decor_app/core/entity/product_entity.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/error/server_exceprion.dart';
import 'package:decor_app/features/mobile/home/data/data_sources/remote_home_data_source.dart';
import 'package:decor_app/features/mobile/home/domain/entities/bestseller_entity.dart';
import 'package:decor_app/features/mobile/home/domain/entities/categories_entitry.dart';
import 'package:decor_app/features/mobile/home/domain/entities/slider_entity.dart';
import 'package:decor_app/features/mobile/home/domain/repositories/base_home_repository.dart';

class HomeRepositoryImp extends BaseHomeRepository {
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepositoryImp({required this.baseHomeRemoteDataSource});
  @override
  Future<Either<Failure, List<SliderEntity>>> getSlider() async {
    try {
      final sliderModels = await baseHomeRemoteDataSource.getSlider();
      return Right(sliderModels.map((model) => model as SliderEntity).toList());
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() async {
    try {
      final homeModels = await baseHomeRemoteDataSource.getCategories();
      return Right(
        homeModels.map((model) => model as CategoriesEntity).toList(),
      );
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<BestSellerEntity>>> getBestseller() async {
    try {
      final homeModels = await baseHomeRemoteDataSource.getBestSeller();
      return Right(
        homeModels.map((model) => model as BestSellerEntity).toList(),
      );
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }




  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      final collectionModel = await baseHomeRemoteDataSource.getCollection();
      return Right(
        collectionModel.map((model) => model as ProductEntity).toList(),
      );
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }




  
}
