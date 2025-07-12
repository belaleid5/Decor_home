
import 'package:decor_app/features/mobile/search/data/models/search_model/search_model.dart';
import 'package:decor_app/features/mobile/search/data/models/search_model/search_params_model.dart';

abstract class BaseSearchRemoteDataSource {
  Future<SearchModel> fetchSearchData({required SearchParamsModel searchParams});
}