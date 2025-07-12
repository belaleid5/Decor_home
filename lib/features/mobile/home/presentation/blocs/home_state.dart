part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.sliderItems = const [],
    this.sliderState = RequestState.loading,
    this.sliderMessage = "",

    this.categories = const [],
    this.categoriesState = RequestState.loading,
    this.categoriesMessage = "",

    this.bestSellerItems = const [],
    this.bestSellerState = RequestState.loading,
    this.bestSellerMessage = "",
    this.collectionItems = const [],
    this.collectionState = RequestState.loading,
    this.collectionMessage = "",
  });
  final List<SliderEntity> sliderItems;
  final RequestState sliderState;
  final String sliderMessage;

  final List<CategoriesEntity> categories;
  final RequestState categoriesState;
  final String categoriesMessage;

  final List<BestSellerEntity> bestSellerItems;
  final RequestState bestSellerState;
  final String bestSellerMessage;

  final List<ProductEntity> collectionItems;
  final RequestState collectionState;
  final String collectionMessage;

  HomeState copyWith({
    List<SliderEntity>? sliderItems,
    RequestState? sliderState,
    String? sliderMessage,

    List<CategoriesEntity>? categories,
    RequestState? categoriesState,
    String? categoriesMessage,

    List<BestSellerEntity>? bestSellerItems,
    RequestState? bestSellerState,
    String? bestSellerMessage,

    List<ProductEntity>? collectionItems,
    RequestState? collectionState,
    String? collectionMessage,
  }) {
    return HomeState(
      sliderItems: sliderItems ?? this.sliderItems,
      sliderState: sliderState ?? this.sliderState,
      sliderMessage: sliderMessage ?? this.sliderMessage,

      categories: categories ?? this.categories,
      categoriesState: categoriesState ?? this.categoriesState,
      categoriesMessage: categoriesMessage ?? this.categoriesMessage,

      bestSellerItems: bestSellerItems ?? this.bestSellerItems,
      bestSellerState: bestSellerState ?? this.bestSellerState,
      bestSellerMessage: bestSellerMessage ?? this.bestSellerMessage,

      collectionItems: collectionItems ?? this.collectionItems,
      collectionState: collectionState ?? this.collectionState,
      collectionMessage: collectionMessage ?? this.collectionMessage,
    );
  }

  @override
  List<Object> get props => [
    bestSellerItems,
    bestSellerState,
    bestSellerMessage,
    categories,
    categoriesState,
    categoriesMessage,
    sliderItems,
    sliderMessage,
    sliderMessage,
    collectionItems,
    collectionState,
    collectionMessage,
  ];
}
