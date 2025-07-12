import 'dart:async';

import 'package:decor_app/core/extention/main_carousel_slider.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/core/widget/custom_title_section_product.dart';
import 'package:decor_app/features/mobile/home/presentation/blocs/home_cubit.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/item_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerSection extends StatefulWidget {
  const BestSellerSection({super.key});

  @override
  State<BestSellerSection> createState() => _BestSellerSectionState();
}

class _BestSellerSectionState extends State<BestSellerSection> {
  late PageController _pageController;
  Timer? _autoScrollTimer;
  int _currentPage = 0;

  final Duration autoScrollDuration = const Duration(seconds: 5);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(autoScrollDuration, (timer) {
      final cubit = context.read<HomeCubit>();
      final totalPages = cubit.state.bestSellerItems.length;

      if (totalPages <= 1) return;

      _currentPage++;
      if (_currentPage >= totalPages) _currentPage = 0;

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _stopAutoScrollTemporarily() {
    _autoScrollTimer?.cancel();
    Future.delayed(const Duration(seconds: 8), () {
      if (mounted) _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.bestSellerState) {
          case RequestState.loading:
            return Column(
              children: [
                CustomTitleSectionProduct(title: "Best Seller"),
                SizedBox(
                  height: res.screenHeight * 0.22,
                  width: double.infinity,
                  child: MainCarouselSlider.builder(
                    itemCount: state.bestSellerItems.length,
                    itemBuilder: (context, index, realIndex) {
                      return ItemBestSeller(
                        res: res,
                        name: "",
                        color: "#5a8f0d",
                        description: "",
                        rate: index.toDouble(),
                        image: "",
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      viewportFraction: 0.98,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),
              ],
            );
          case RequestState.loaded:
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleSectionProduct(title: "Best Seller"),
                GestureDetector(
                  onTapDown: (_) => _stopAutoScrollTemporarily(),
                  onPanDown: (_) => _stopAutoScrollTemporarily(),
                  child: SizedBox(
                    height: res.screenHeight * 0.22,
                    width: double.infinity,
                    child: MainCarouselSlider.builder(
                      itemCount: state.bestSellerItems.length,
                      itemBuilder: (context, index, realIndex) {
                        final item = state.bestSellerItems[index];
                        return ItemBestSeller(
                          res: res,
                          name: item.name,
                          color: item.color,
                          description: item.description,
                          rate: item.rate,
                          image: item.image,
                        );
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 800,
                        ),
                        viewportFraction: 0.98,
                        enlargeCenterPage: true,
                      ),
                    ),
                  ),
                ),
              ],
            );
          case RequestState.error:
            return const Center(child: Text("Failed to load data"));
          case RequestState.initial:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

//ItemBestSeller(res: res, item: item);
