
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_items_entity.dart';

class SearchItemsModel extends SearchItemsEntity {
  const SearchItemsModel({
    required super.id,
    required super.subCategoryId,
    required super.color,
    required super.name,
    required super.description,
    required super.price,
    required super.isSale,
    required super.salePrice,
    required super.image,
    required super.rate,
  });

  factory SearchItemsModel.fromJson(Map<String,dynamic> json){
    return SearchItemsModel(
      id: json['id'],
      subCategoryId: json['sub_category_id'],
      color: json['color'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      isSale: json['is_sale'],
      salePrice: json['sale_price'],
      image: json['image'],
      rate: json['rate'],
    );
  }

}
