

import 'package:decor_app/features/mobile/search/data/models/api_setting_model/colors_model.dart';
import 'package:decor_app/features/mobile/search/data/models/api_setting_model/price_range_model.dart';
import 'package:decor_app/features/mobile/search/data/models/api_setting_model/sub_categories_model.dart';
import 'package:decor_app/features/mobile/search/domain/entities/api_setting/api_setting_entity.dart';

class ApiSettingModel extends ApiSettingEntity {
  const ApiSettingModel({
    required super.priceRange,
    required super.subCategories,
    required super.colors,
  });

  factory ApiSettingModel.fromJson(Map<String, dynamic> json) {
    return ApiSettingModel(
      priceRange: PriceRangeModel.fromJson(json['price_range']),
      subCategories: List<SubCategoriesModel>.from(
        json['sub_categories'].map((e) => SubCategoriesModel.fromJson(e)),
      ),
      colors: List<ColorsModel>.from(
        json['colors'].map((e) => ColorsModel.fromJson(e)),
      ),
    );
  }
}
