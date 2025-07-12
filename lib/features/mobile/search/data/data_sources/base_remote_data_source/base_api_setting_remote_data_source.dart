

import 'package:decor_app/features/mobile/search/data/models/api_setting_model/api_setting_model.dart';

abstract class BaseApiSettingRemoteDataSource {
  Future<ApiSettingModel> fetchApiSettingData();
}