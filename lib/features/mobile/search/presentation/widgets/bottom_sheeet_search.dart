import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/core/widget/custom_title_section_product.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_elevated_butto.dart';
import 'package:decor_app/features/mobile/search/domain/entities/search_entity/search_params_entity.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_cubit.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_state.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/custom_range_slider.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/filter_categories_widget.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/filter_color_widget.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/menu_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decor_app/features/mobile/search/domain/entities/api_setting/colors_entity.dart';
import 'package:decor_app/features/mobile/search/domain/entities/api_setting/sub_categories_entity.dart';
import 'package:decor_app/features/mobile/search/domain/entities/api_setting/price_range_entity.dart';

class BottomSheetSearch extends StatefulWidget {
  final String searchQuery;
  final SearchCubit searchCubit;
  const BottomSheetSearch({
    super.key,
    required this.searchQuery,
    required this.searchCubit,
  });

  @override
  State<BottomSheetSearch> createState() => _BottomSheetSearchState();
}

class _BottomSheetSearchState extends State<BottomSheetSearch> {
  String maxPrice = '';
  String? selectedCategoryName;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.searchCubit,
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state.apiSettingStatus == RequestState.loading || state.settings == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.apiSettingStatus == RequestState.error) {
            return Center(child: Text(state.apiSettingErrorMessage));
          }

          final settings = state.settings!;
          final subCategories = settings['sub_categories'] as List<SubCategoriesEntity>?;
          final colors = settings['colors'] as List<ColorEntity>?;
          final priceRange = settings['price_range'] as PriceRangeEntity?;

          if (subCategories == null || colors == null || priceRange == null) {
            return const Center(child: Text('Data not available'));
          }

          final double minApiPrice = priceRange.minPrice;
          final double maxApiPrice = priceRange.maxPrice;

          if (maxPrice.isEmpty) {
            maxPrice = state.priceValue.toString();
          }

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Filter',
                      style: AppTextStyles.inter20(context).copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomTitleSectionProduct(title: 'Range Price'),
                  CustomRangeSlider(
                    initialRangeValues: RangeValues(minApiPrice, maxApiPrice),
                    onPriceChanged: (values) {
                      setState(() {
                        maxPrice = values.end.toString();
                      });
                      widget.searchCubit.changePriceValue(double.parse(maxPrice));
                    },
                    minValue: minApiPrice,
                    maxValue: maxApiPrice,
                  ),
                  const MenuPrice(),
                  const SizedBox(height: 20),
                  const CustomTitleSectionProduct(title: 'Categories'),
                  FilterSelectedItemWidget(
                    categories: subCategories.map((e) => e.name).toList(),
                    onSelectionChanged: (category) {
                      setState(() {
                        selectedCategoryName = category;
                      });
                      if (category != null) {
                        final subCategory = subCategories.firstWhere((e) => e.name == category);
                        widget.searchCubit.selectSubCategory(subCategory.id, subCategories.indexOf(subCategory));
                      } else {
                        widget.searchCubit.selectSubCategory(0, null);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const CustomTitleSectionProduct(title: 'Colors'),
                  FilterColorPicker(
                    colors: colors
                        .map((e) => Color(int.parse(e.hexColor.replaceAll('#', '0xff'))))
                        .toList(),
                    onSelectionChanged: (color) {
                      setState(() {
                        selectedColor = color;
                      });
                      if (color != null) {
                        final colorData = colors.firstWhere(
                          (e) => Color(int.parse(e.hexColor.replaceAll('#', '0xff'))) == color,
                        );
                        widget.searchCubit.selectColor(colorData.id, colors.indexOf(colorData));
                      } else {
                        widget.searchCubit.selectColor(0, null);
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomElevatedButton(
                    onPressed: () {
                      widget.searchCubit.fetchSearchData(
                        SearchParamsEntity(
                          searchQuery: widget.searchQuery,
                          minPrice: minApiPrice.toString(),
                          maxPrice: maxPrice,
                          subCategoryId: selectedCategoryName != null
                              ? subCategories.firstWhere((e) => e.name == selectedCategoryName).id.toString()
                              : null,
                          colorId: selectedColor != null
                              ? colors
                                  .firstWhere(
                                    (e) => Color(int.parse(e.hexColor.replaceAll('#', '0xff'))) == selectedColor,
                                  )
                                  .id
                                  .toString()
                              : null,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    title: "Apply",
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void openFilterBottomSheet(BuildContext context, String searchQuery) {
  final searchCubit = context.read<SearchCubit>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => BottomSheetSearch(
      searchQuery: searchQuery,
      searchCubit: searchCubit,
    ),
  );
}
