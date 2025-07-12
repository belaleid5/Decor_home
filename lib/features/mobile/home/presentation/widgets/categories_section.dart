import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/core/widget/custom_title_section_product.dart';
import 'package:decor_app/features/mobile/home/presentation/blocs/home_cubit.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/custom_list_category_item.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/shimmer_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTitleSectionProduct(title: "Categories"),
            GestureDetector(
              onTap: () {},
              child: CustomTitleSectionProduct(title: "See All"),
            ),
          ],
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            switch (state.categoriesState) {
              case RequestState.loading:
                return SizedBox(
                  height: res.screenHeight * 0.2,
                  child: ShimmerCategories(res: res),
                );
              case RequestState.loaded:
                return Flexible(
                  child: CustomListCategories(
                    res: res,
                    categories: state.categories,
                  ),
                );
              case RequestState.error:
                return Center(
                  child: Text(
                    state.categoriesMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              case RequestState.initial:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
