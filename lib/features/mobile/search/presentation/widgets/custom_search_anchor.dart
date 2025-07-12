import 'package:decor_app/core/routing/app_router.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_images.dart';
import 'package:decor_app/core/widget/adaptive_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchAnchor extends StatefulWidget {
  const CustomSearchAnchor({super.key});

  @override
  State<CustomSearchAnchor> createState() => _CustomSearchAnchorState();
}

class _CustomSearchAnchorState extends State<CustomSearchAnchor> {
 

  List<String> filterItems = [];
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, searchController) {
        return AdaptiveInputField(
          filledColor: AppColor.whiteColor,
          borderColor: AppColor.primaryColor,
          textCapitalization: TextCapitalization.none,
          textAlign: TextAlign.start,
          textStyle: const TextStyle(fontSize: 16),
          constraints: const BoxConstraints(maxHeight: 50),
          suffix: GestureDetector(
            onTap: () {
                    Navigator.pushNamed(context, AppRouter.filterSearchRoute);
            },
            child: CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              radius: 14,
              child: SvgPicture.asset(AppImages.searchIcon),
            ),
          ),

          enabled: true,
          autofocus: true,
          context: context,
          controller: searchController,
          hintText: 'search',
          onChange: (query) {},
          onSubmit: (query) {},
        );
      },
      suggestionsBuilder: (context, searchController) {
        return filterItems.map((item) {
          return ListTile(
            title: Text(item),
            onTap: () {
              searchController.closeView(item);
            },
          );
        }).toList();
      },
    );
  }
}