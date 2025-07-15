import 'package:decor_app/core/extention/main_carousel_slider.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_cubit.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTabBarScrollingItems extends StatelessWidget {
  const CustomTabBarScrollingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.searchStatus != RequestState.loaded ||
            state.searchEntity == null) {
          return SizedBox.shrink();
        }
        final products = state.searchEntity!.items;
        if (products.isEmpty) {
          return SizedBox.shrink();
        }
        return MainCarouselSlider(
          items:
              products
                  .map(
                    (item) => Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.name,
                          style: AppTextStyles.poppins14(context).copyWith(
                            color: AppColor.insideColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: VerticalDivider(
                            thickness: 1,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
          options: CarouselOptions(viewportFraction: 1 / 2.7, height: 50),
        );
      },
    );
  }
}
