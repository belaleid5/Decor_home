import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/shop_now.dart';
import 'package:flutter/material.dart';

class CustomDataCard extends StatelessWidget {
  const CustomDataCard({
    super.key,
    required this.res,
    required this.name,
    required this.desc,
    required this.rating,
  });

  final ResponsiveHelper res;
  final String name, desc;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // تقليل الـ padding
      child: Column(
        mainAxisSize: MainAxisSize.min, // تقليل الحجم العمودي
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: AppTextStyles.poppins15(
              context,
            ).copyWith(color: AppColor.whiteColor),
          ),
          SizedBox(
            width: res.screenWidth * 0.350,
            child: Text(
              desc,
              textAlign: TextAlign.justify,
              style: AppTextStyles.poppins15(context).copyWith(
                fontFamily: 'League Spartan',
                overflow: TextOverflow.fade,

                wordSpacing: 0.0,
                fontSize: 13,
                height: 1.4,

                color: AppColor.whiteColor,
                fontWeight: FontWeight.w300,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Container(
                width: res.screenWidth * 0.1286,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.whiteColor,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 15),
                    Text(
                      rating.toStringAsFixed(1),
                      style: AppTextStyles.poppins14(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              ShopNow(res: res),
            ],
          ),
        ],
      ),
    );
  }
}
