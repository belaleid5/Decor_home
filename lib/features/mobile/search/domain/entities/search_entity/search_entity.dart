import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_items_entity.dart';
import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final List<SearchItemsEntity> items;

  const SearchEntity({
    required this.items,
  });

  @override
  List<Object?> get props => [
    items,
  ];
}
