import 'package:decor_app/features/mobile/home/domain/entities/categories_entitry.dart';

class CategoriesModel extends CategoriesEntity {
  const CategoriesModel({
    required super.id,
    required super.name,
    required super.icon,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(icon: json["icon"], id: json["id"] as int, name:json["name"]);
  }


  


}
