import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/entity/product_entity.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/item_collection.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomNewCollectionShimmer extends StatelessWidget {
  const CustomNewCollectionShimmer({super.key, required this.res});

  final ResponsiveHelper res;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.primaryColor,
      highlightColor: AppColor.primaryColor,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: res.screenWidth / (res.screenHeight * 0.55),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return ItemCollection(
          image: ("$index"),
          name:("$index"),
          description: ("$index"),
          price:index.toDouble(),
        );
        },
      ),
    );
  }
}
