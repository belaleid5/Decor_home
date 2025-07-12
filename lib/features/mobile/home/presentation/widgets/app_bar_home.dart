import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      floating: true,
      title: Column(
        children: [
          Text(
            "Hi, Welcome Back",
            style: AppTextStyles.inter20(
              context,
            ).copyWith(color: AppColor.primaryColor),
          ),
          Text(
            "Create spaces that bring joy",
            style: AppTextStyles.poppins14(
              context,
            ).copyWith(fontSize: 14.0, color: AppColor.iconColor),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: CircleAvatar(
            radius: 15,
            backgroundColor: AppColor.primaryColor,
            child: Icon(size: 22, Icons.search_sharp),
          ),
        ),
      ],
    );
  }
}