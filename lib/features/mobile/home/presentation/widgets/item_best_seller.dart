import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_app/core/extention/color_from_hex.dart';
import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/custom_data_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemBestSeller extends StatelessWidget {
  const ItemBestSeller({super.key, required this.res, required this.name,
   required this.color, required this.description, required this.rate, required this.image});

  final ResponsiveHelper res;
  final String name, color,image, description;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: res.screenWidth,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: res.screenHeight * 0.18,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                
                color: MyHexColor(color),
                borderRadius: BorderRadius.circular(16),
              ),
              child: CustomDataCard(
                res: res,
                name: name,
                desc: description,
                rating: rate,
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 0,
            bottom: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: image,
                width: res.screenWidth * 0.30,
                height: res.screenHeight * 0.15,
                fit: BoxFit.fill,
                placeholder:
                    (context, url) => Container(
                      width: res.screenWidth * 0.30,
                      height: res.screenHeight * 0.15,
                      child: Shimmer.fromColors(
                        baseColor: MyHexColor(color),
                        highlightColor: MyHexColor(color).withOpacity(0.5),
                        child: Container(
                          color: MyHexColor(color),
                          width: res.screenWidth * 0.30,
                          height: res.screenHeight * 0.15,
                        ),
                      ),
                    ),

                errorWidget:
                    (context, url, error) => Container(
                      color: MyHexColor(color),
                      width: res.screenWidth * 0.30,
                      height: res.screenHeight * 0.15,
                      child:  Center(),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
