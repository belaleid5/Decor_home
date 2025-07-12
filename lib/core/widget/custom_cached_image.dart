import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.height, required this.width, required this.image});

  final double height, width;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: height,
      width:width,
      decoration: BoxDecoration(
        color: AppColor.containerColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: CachedNetworkImage(
        color: AppColor.insideColor,
        imageUrl: image,
      ),
    );
  }
}
