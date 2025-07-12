import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/core/widget/custom_cached_image.dart';
import 'package:decor_app/features/mobile/home/domain/entities/categories_entitry.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/cttegory_item.dart';
import 'package:flutter/material.dart';

class CustomListCategories extends StatelessWidget {
  const CustomListCategories({
    super.key,
    required this.res,
    required this.categories,
  });

  final ResponsiveHelper res;
  final List<CategoriesEntity> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: res.screenHeight * 0.125,
      width: res.screenWidth * 0.85,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem( res: res, index: index, icon: category.icon, name: category.name,);
        },
      ),
    );
  }
}

