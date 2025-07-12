import 'package:dartz/dartz.dart';
import 'package:decor_app/core/entity/product_entity.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/features/mobile/home/domain/entities/bestseller_entity.dart';
import 'package:decor_app/features/mobile/home/domain/entities/categories_entitry.dart';
import 'package:decor_app/features/mobile/home/domain/entities/slider_entity.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<SliderEntity>>> getSlider();
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
  Future<Either<Failure, List<BestSellerEntity>>> getBestseller();
  Future<Either<Failure, List<ProductEntity>>> getProduct();
}
