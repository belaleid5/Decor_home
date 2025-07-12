import 'dart:async';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:decor_app/features/mobile/search/domain/use_cases/api_setting_use_case.dart';
import 'package:decor_app/features/mobile/search/domain/use_cases/search_use_case.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;
  final ApiSettingUseCase apiSettingUseCase;

  SearchCubit({required this.searchUseCase, required this.apiSettingUseCase})
    : super(const SearchState());

  static SearchCubit get(context) => BlocProvider.of(context);

  Future<void> fetchSearchData(SearchParamsEntity searchParamEntity) async {
    emit(state.copyWith(searchStatus: RequestState.loading));

    final result = await searchUseCase.call( searchParamEntity);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            searchStatus: RequestState.error,
            searchErrorMessage: failure.message,
          ),
        );
      },
      (data) {
        emit(
          state.copyWith(
            searchStatus: RequestState.loaded,
            searchEntity: data,
            selectedSubCategoriesIndex: null,
            selectedColorIndex: null,
            searchQuery: '',
          ),
        );
      },
    );
  }

  Future<void> fetchApiSettings() async {
    emit(state.copyWith(apiSettingStatus: RequestState.loading));

    final result = await apiSettingUseCase.call( NoParams());
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            apiSettingStatus: RequestState.error,
            apiSettingErrorMessage: failure.message,
          ),
        );
      },
      (data) {
        final settingsMap = {
          'sub_categories': data.subCategories.map((e) => e).toList(),
          'colors': data.colors.map((e) => e).toList(),
          'price_range': data.priceRange,
        };
        emit(
          state.copyWith(
            apiSettingStatus: RequestState.loaded,
            settings: settingsMap,
          ),
        );
      },
    );
  }

  void changeSearchQuery(String searchQuery) {
    emit(state.copyWith(searchQuery: searchQuery));
  }

  void changePriceValue(double priceValue) {
    emit(state.copyWith(priceValue: priceValue));
  }

  void selectSubCategory(int subCategoryId, int? subCategoryIndex) {
    emit(
      state.copyWith(
        selectedSubCategoriesId: subCategoryId,
        selectedSubCategoriesIndex: subCategoryIndex,
      ),
    );
  }

  void selectColor(int colorId, int? colorIndex) {
    emit(
      state.copyWith(selectedColorId: colorId, selectedColorIndex: colorIndex),
    );
  }
}
