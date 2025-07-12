import 'package:decor_app/core/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.image,
    required super.price,
    required super.description,
    required super.subCategoryId,
    required super.color,
    required super.isSale,
    required super.salePrice,
    required super.rate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      subCategoryId: json['sub_category_id'] ?? '',
      color: json['color'] ?? '',
      isSale: json['is_sale'] ?? false,
      salePrice: json['sale_price'] != null ? (json['sale_price'] as num).toDouble() : null,
      rate: (json['rate'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'sub_category_id': subCategoryId,
      'color': color,
      'is_sale': isSale,
      'sale_price': salePrice,
      'rate': rate,
    };
  }
}
