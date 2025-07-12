import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/widget/main_carousel_slider.dart';
import 'package:decor_app/features/mobile/home/domain/entities/slider_entity.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/slider_item.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.res,
    required this.controller,
    required this.sliders,
  });

  final ResponsiveHelper res;
  final PageController controller;
  final List<SliderEntity> sliders;

  @override
  Widget build(BuildContext context) {
    return MainCarouselSlider(
      options: CarouselOptions(
        height: res.screenHeight * 0.23,
        autoPlay: true,
        viewportFraction: 0.98,
        autoPlayCurve: Curves.linearToEaseOut,
      ),
      items: sliders.map((item) => SliderItem(item: item.image)).toList(),
    );
  }
}
