 import 'package:decor_app/core/utils/app_color.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';


Widget shimmerLoading() {
  return Shimmer.fromColors(
    baseColor: AppColor.primaryColor,
    highlightColor: AppColor.primaryColor.withOpacity(0.7),
    child: Container(
      height: 200,
      width: 200,
      color: AppColor.primaryColor,
    ),
  );
}