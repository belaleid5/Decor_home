
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_entity.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  final RequestState searchStatus;
  final SearchEntity? searchEntity;
  final String searchErrorMessage;

  final RequestState apiSettingStatus;
  final Map<String, dynamic>? settings; // رجعنا settings كـ Map
  final String apiSettingErrorMessage;

  final double priceValue;
  final int? selectedSubCategoriesIndex;
  final int? selectedSubCategoriesId;

  final int? selectedColorIndex;
  final int? selectedColorId;

  final String? searchQuery;

  const SearchState({
    this.searchStatus = RequestState.loading,
    this.searchEntity,
    this.searchErrorMessage = '',
    this.apiSettingStatus = RequestState.loading,
    this.settings,
    this.apiSettingErrorMessage = '',
    this.priceValue = 700,
    this.selectedSubCategoriesIndex,
    this.selectedSubCategoriesId,
    this.selectedColorIndex,
    this.selectedColorId,
    this.searchQuery,
  });

  SearchState copyWith({
    RequestState? searchStatus,
    SearchEntity? searchEntity,
    String? searchErrorMessage,
    RequestState? apiSettingStatus,
    Map<String, dynamic>? settings,
    String? apiSettingErrorMessage,
    double? priceValue,
    int? selectedSubCategoriesIndex,
    int? selectedSubCategoriesId,
    int? selectedColorIndex,
    int? selectedColorId,
    String? searchQuery,
  }) {
    return SearchState(
      searchStatus: searchStatus ?? this.searchStatus,
      searchEntity: searchEntity ?? this.searchEntity,
      searchErrorMessage: searchErrorMessage ?? this.searchErrorMessage,
      apiSettingStatus: apiSettingStatus ?? this.apiSettingStatus,
      settings: settings ?? this.settings,
      apiSettingErrorMessage: apiSettingErrorMessage ?? this.apiSettingErrorMessage,
      priceValue: priceValue ?? this.priceValue,
      selectedSubCategoriesIndex: selectedSubCategoriesIndex ?? this.selectedSubCategoriesIndex,
      selectedSubCategoriesId: selectedSubCategoriesId ?? this.selectedSubCategoriesId,
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      selectedColorId: selectedColorId ?? this.selectedColorId,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
        searchStatus,
        searchEntity,
        searchErrorMessage,
        apiSettingStatus,
        settings,
        apiSettingErrorMessage,
        priceValue,
        selectedSubCategoriesIndex,
        selectedSubCategoriesId,
        selectedColorIndex,
        selectedColorId,
        searchQuery,
      ];
}