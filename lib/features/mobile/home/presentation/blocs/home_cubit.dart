import 'package:bloc/bloc.dart';
import 'package:decor_app/core/entity/product_entity.dart';
import 'package:decor_app/core/usecase/base_usecase.dart';
import 'package:decor_app/core/usecase/get_product.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/home/domain/entities/bestseller_entity.dart';
import 'package:decor_app/features/mobile/home/domain/entities/categories_entitry.dart';
import 'package:decor_app/features/mobile/home/domain/entities/slider_entity.dart';
import 'package:decor_app/features/mobile/home/domain/use_cases/categoris_usecase.dart';
import 'package:decor_app/features/mobile/home/domain/use_cases/get_bestseller_usecase.dart';
import 'package:decor_app/features/mobile/home/domain/use_cases/slider_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSliderUseCase getSliderUseCase;
  final CategoriesUsecase categoriesUsecase;
  final BestSellerUsecase getBestSellerUseCase;
  final ProductUsecase collectionUsecase;
  HomeCubit(
    this.getSliderUseCase,
    this.categoriesUsecase,
    this.getBestSellerUseCase,
    this.collectionUsecase,
  ) : super(const HomeState());

  Future<void> getSlider() async {
    final result = await getSliderUseCase( NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          sliderState: RequestState.error,
          sliderMessage: failure.message,
        ),
      ),
      (slider) => emit(
        state.copyWith(sliderState: RequestState.loaded, sliderItems: slider),
      ),
    );
  }

  Future<void> getCategories() async {
    final result = await categoriesUsecase( NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          categoriesState: RequestState.error,
          categoriesMessage: failure.message,
        ),
      ),
      (category) => emit(
        state.copyWith(
          categoriesState: RequestState.loaded,
          categories: category,
        ),
      ),
    );
  }

  Future<void> getBestSeller() async {
    final result = await getBestSellerUseCase( NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          bestSellerState: RequestState.error,
          bestSellerMessage: failure.message,
        ),
      ),
      (category) => emit(
        state.copyWith(
          bestSellerState: RequestState.loaded,
          bestSellerItems: category,
        ),
      ),
    );
  }

  Future<void> getCollection() async {
    final result = await collectionUsecase( NoParams());
    result.fold(
      (failure) => emit(
        state.copyWith(
          collectionState: RequestState.error,
          categoriesMessage: failure.message,
        ),
      ),
      (category) => emit(
        state.copyWith(
          collectionState: RequestState.loaded,
          collectionItems: category,
        ),
      ),
    );
  }
}
