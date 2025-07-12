import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/home/presentation/blocs/home_cubit.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/custom_Slider_and_indicator.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/custom_shimer_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSliderSection extends StatefulWidget {
  const CustomSliderSection({super.key});

  @override
  State<CustomSliderSection> createState() => _CustomSliderSectionState();
}

class _CustomSliderSectionState extends State<CustomSliderSection> {
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.sliderState) {
          case RequestState.loading:
            return CustomShimmerSlider(res: res, controller: controller);
          case RequestState.loaded:
            final sliders = state.sliderItems;
            return CustomSliderIndicator(
              res: res,
              controller: controller,
              sliders: sliders,
            );
          case RequestState.error:
            return const Text("Failed to load data");
          case RequestState.initial:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
