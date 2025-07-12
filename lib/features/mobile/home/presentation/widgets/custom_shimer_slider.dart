import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/widget/main_carousel_slider.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/slider_item.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerSlider extends StatelessWidget {
  const CustomShimmerSlider({
    super.key,
    required this.res,
    required this.controller,
  });

  final ResponsiveHelper res;
  final PageController controller;

  List<Widget> get shimmerItems => List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.primaryColor,
      highlightColor: AppColor.insideColor.withOpacity(0.7),
      child: SizedBox(
        height: res.screenHeight * 0.23,
        child: MainCarouselSlider(
          options: CarouselOptions(
            height: res.screenHeight * 0.23,
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayCurve: Curves.linearToEaseOut,
          ),
          items: shimmerItems.map((item) => SliderItem(item: item.toString())).toList(),
        ),
      ),
    );
  }
}
