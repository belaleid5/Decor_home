
import 'package:decor_app/features/mobile/search/data/models/search_model/search_items_model.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_entity.dart';

class SearchModel extends SearchEntity {
  const SearchModel({required super.items});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      items: List<SearchItemsModel>.from(
        json['items'].map((e) => SearchItemsModel.fromJson(e)),
      ),
    );
  }
}
