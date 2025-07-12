import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.res,
    required this.index,
    required this.icon,
    required this.name,
  });

  final String icon, name;
  final ResponsiveHelper res;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: Duration(milliseconds: 500 + index * 100),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Opacity(
          opacity: scale.clamp(0.0, 1.0),
          child: Transform.scale(scale: scale, child: child),
        );
      },
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: AppColor.containerColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CachedNetworkImage(
              height: res.screenHeight * 0.0775,
              width: res.screenWidth * 0.168,
              color: AppColor.primaryColor,
              imageUrl: icon,
              placeholder: (context, url) => Center(),
              errorWidget: (context, url, error) => const Center(),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: AppTextStyles.poppins14(context).copyWith(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
