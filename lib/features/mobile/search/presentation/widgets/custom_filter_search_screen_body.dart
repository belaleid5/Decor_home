
import 'package:decor_app/features/mobile/search/presentation/widgets/custom_app_bar_search.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/custom_sliver_grid_view.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/custom_tab_bar_scrolling_items.dart';
import 'package:flutter/material.dart';


class CustomFilterSearchScreenBody extends StatelessWidget {
  const CustomFilterSearchScreenBody({super.key});

 

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBarSearch(),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: CustomTabBarScrollingItems()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        CustomSliverGridView(),
        
      ],
    );
  }
}







