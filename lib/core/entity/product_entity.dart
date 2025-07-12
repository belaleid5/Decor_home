// domain/entities/product_entity.dart


import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String image;
  final double price;
  final String description;
  final String subCategoryId; // ✅ كان int، خليه String
  final String color;
  final bool isSale;
  final double? salePrice;
  final double rate;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.subCategoryId,
    required this.color,
    required this.isSale,
    this.salePrice,
    required this.rate,
  });
  
  @override
  List<Object?> get props => [
    id,
    name,
    image,
    price,
    description,
    subCategoryId,
    color,
    isSale,
    salePrice,
    rate,
  ];
}
