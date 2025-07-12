
import 'package:decor_app/core/error/faliure.dart';
import 'package:decor_app/core/network/api_constant.dart';
import 'package:decor_app/core/network/dio_client.dart';
import 'package:decor_app/core/services/service_locator.dart';
import 'package:decor_app/features/mobile/search/data/data_sources/base_remote_data_source/base_api_setting_remote_data_source.dart';
import 'package:decor_app/features/mobile/search/data/models/api_setting_model/api_setting_model.dart';


class ApiSettingRemoteDataSourceImpl extends BaseApiSettingRemoteDataSource {
  @override
  Future<ApiSettingModel> fetchApiSettingData() async {
    try {
      final response = await sl<DioClient>().get(ApiConstant.getApiSettings);
      return ApiSettingModel.fromJson(response.data);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
