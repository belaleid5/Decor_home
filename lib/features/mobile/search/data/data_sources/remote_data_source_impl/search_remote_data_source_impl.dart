
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/network/api_constant.dart';
import 'package:decor_app/core/network/dio_client.dart';
import 'package:decor_app/core/services/service_locator.dart';
import 'package:decor_app/features/mobile/search/data/data_sources/base_remote_data_source/base_search_remote_data_source.dart';
import 'package:decor_app/features/mobile/search/data/models/search_model/search_model.dart';
import 'package:decor_app/features/mobile/search/data/models/search_model/search_params_model.dart';

class SearchRemoteDataSourceImpl extends BaseSearchRemoteDataSource {


  SearchRemoteDataSourceImpl();

  @override
  Future<SearchModel> fetchSearchData({required SearchParamsModel searchParams}) async {
   try{

     final response = await sl<DioClient>().post(
        ApiConstant.applySearch,
       data: searchParams.toJson(),
     );
     return SearchModel.fromJson(response.data);

   }catch(e){
     throw ServerFailure( e.toString());
   }

  }


}
