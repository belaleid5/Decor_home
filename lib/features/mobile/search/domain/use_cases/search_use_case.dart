import 'package:dartz/dartz.dart';
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_entity.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:decor_app/features/mobile/search/domain/repositories/base_search_repo.dart';

class SearchUseCase extends BaseUseCase<SearchEntity, SearchParamsEntity> {
  final BaseSearchRepo searchRepo;
  SearchUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, SearchEntity>> call(
     SearchParamsEntity params,
  ) async {
    return await searchRepo.fetchSearchData(searchParams: params);
  }
}
