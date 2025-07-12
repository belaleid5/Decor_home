import 'package:equatable/equatable.dart';

class SearchParamsEntity extends Equatable {
  final String? searchQuery;
  final String? minPrice;
  final String? maxPrice;
  final String? colorId;
  final String? subCategoryId;

  const SearchParamsEntity({
     this.searchQuery,
     this.minPrice,
     this.maxPrice,
     this.colorId,
     this.subCategoryId,
  });

  @override
  List<Object?> get props => [
    searchQuery,
    minPrice,
    maxPrice,
    colorId,
    subCategoryId,
  ];
}
