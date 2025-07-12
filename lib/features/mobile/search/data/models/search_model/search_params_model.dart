
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_params_entity.dart';

class SearchParamsModel extends SearchParamsEntity {
  const SearchParamsModel({
    required super.searchQuery,
    required super.minPrice,
    required super.maxPrice,
    required super.colorId,
    required super.subCategoryId,
  });

  factory SearchParamsModel.fromObject(SearchParamsEntity object) {
    return SearchParamsModel(
      searchQuery: object.searchQuery,
      minPrice: object.minPrice,
      maxPrice: object.maxPrice,
      colorId: object.colorId,
      subCategoryId: object.subCategoryId,
    );
  }

  Map<String, dynamic> toJson() => {
    'search_query': searchQuery ,
    'min_price': minPrice ,
    'max_price': maxPrice ,
    'color_id': colorId ,
    'sub_category_id': subCategoryId ,
  };
}
