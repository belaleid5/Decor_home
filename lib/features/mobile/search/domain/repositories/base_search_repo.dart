
import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_entity.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_params_entity.dart';

abstract class BaseSearchRepo{
  Future<Either<Failure,SearchEntity>> fetchSearchData({required SearchParamsEntity searchParams});

}