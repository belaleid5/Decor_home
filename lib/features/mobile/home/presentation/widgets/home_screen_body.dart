import 'package:decor_app/features/mobile/home/presentation/widgets/app_bar_home.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/best_seller_section.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/categories_section.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/custom_slider_section.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/new_collection.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          AppBarHome(),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: CustomSliderSection()),
          SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(child: CategoriesSection()),
          SliverToBoxAdapter(child: BestSellerSection()),
          SliverToBoxAdapter(child: NewCollection()),
        ],
      ),
    );
  }
}
