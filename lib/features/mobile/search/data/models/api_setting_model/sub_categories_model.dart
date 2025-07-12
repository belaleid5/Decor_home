
import 'package:decor_app/features/mobile/search/domain/entities/api_setting/sub_categories_entity.dart';

class SubCategoriesModel extends SubCategoriesEntity {
  const SubCategoriesModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.mainCategoryId,
  });

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      mainCategoryId: json['main_category_id'],
    );
  }
}
