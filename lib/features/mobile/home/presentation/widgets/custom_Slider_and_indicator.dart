import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/features/mobile/home/domain/entities/slider_entity.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/custom_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSliderIndicator extends StatelessWidget {
  const CustomSliderIndicator({
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomCarouselSlider(
            res: res,
            controller: controller,
            sliders: sliders,
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: controller,
          count: sliders.length - 1,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColor.textColorButton,
            dotHeight: 4,
            dotWidth: 8,
            dotColor: AppColor.iconColor,
          ),
        ),
      ],
    );
  }
}
