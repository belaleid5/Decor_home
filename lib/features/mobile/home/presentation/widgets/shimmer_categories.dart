import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/cttegory_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategories extends StatelessWidget {
  const ShimmerCategories({
    super.key,
    required this.res,
  });

  final ResponsiveHelper res;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Shimmer.fromColors(
        baseColor: AppColor.primaryColor,
        highlightColor: AppColor.primaryColor,
        child:ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(
              res: res,
              index: index,
              icon: "$index",
              name: "Category $index",
            );
          },
        ),
      ),
    );
  }
}
