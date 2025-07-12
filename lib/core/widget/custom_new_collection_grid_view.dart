import 'package:decor_app/core/entity/product_entity.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/item_collection.dart';
import 'package:flutter/material.dart';

class CustomNewCollectionGridView extends StatelessWidget {
  const CustomNewCollectionGridView({
    super.key,
    required this.res,
    required this.collectionItems,
  });

  final ResponsiveHelper res;
  final List<ProductEntity> collectionItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: res.screenWidth / (res.screenHeight * 0.55),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: collectionItems.length,
      itemBuilder: (context, index) {
        final item = collectionItems[index];

        return ItemCollection(
          image: item.image,
          name: item.name,
          description: item.description,
          price: item.price,
        );
      },
    );
  }
}
