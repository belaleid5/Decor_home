import 'package:equatable/equatable.dart';

class SearchItemsEntity extends Equatable {
  final int id;
  final String subCategoryId;
  final String color;
  final String name;
  final String description;
  final dynamic price;
  final bool isSale;
  final dynamic salePrice;
  final String image;
  final dynamic rate;

  const SearchItemsEntity({
    required this.id,
    required this.subCategoryId,
    required this.color,
    required this.name,
    required this.description,
    required this.price,
    required this.isSale,
    required this.salePrice,
    required this.image,
    required this.rate,
  });

  @override
  List<Object?> get props => [
   id,
   subCategoryId,
   color,
   name,
   description,
   price,
   isSale,
   salePrice,
   image,
   rate,
  ];


}
