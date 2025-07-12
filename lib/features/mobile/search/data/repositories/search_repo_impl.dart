import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/features/mobile/search/data/data_sources/base_remote_data_source/base_search_remote_data_source.dart';
import 'package:decor_app/features/mobile/search/data/models/search_model/search_params_model.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_entity.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:decor_app/features/mobile/search/domain/repositories/base_search_repo.dart';

class SearchRepoImpl extends BaseSearchRepo {
  final BaseSearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl(Object object, {required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, SearchEntity>> fetchSearchData({
    required SearchParamsEntity searchParams,
  }) async {
    try {
      final result = await searchRemoteDataSource.fetchSearchData(
        searchParams: SearchParamsModel.fromObject(searchParams),
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure( e.toString()));
    }
  }
}
