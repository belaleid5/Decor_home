import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/bottom_sheeet_search.dart';
import 'package:flutter/material.dart';

class CustomAppBarSearch extends StatelessWidget {
  const CustomAppBarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 0.0,
      actionsPadding: EdgeInsets.only(right: 10),
      snap: true,
      centerTitle: true,
      title: Text(
        'Auxiliary furniture',
        style: AppTextStyles.inter20(
          context,
        ).copyWith(color: AppColor.primaryColor),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      actions: [
        GestureDetector(
          onTap: () => openFilterBottomSheet(context, ""),
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
