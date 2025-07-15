import 'package:cached_network_image/cached_network_image.dart';
import 'package:decor_app/core/functions/shimer_loading.dart';
import 'package:decor_app/core/network/api_constant.dart';
import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/utils/app_text.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_cubit.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliverGridView extends StatelessWidget {
  const CustomSliverGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state.searchStatus == RequestState.loading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: CircularProgressIndicator(color: AppColor.primaryColor,),
              ),
            ),
          );
        } else if (state.searchStatus == RequestState.error) {
          return SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Icon(Icons.error, size: 60, color: Colors.red),
                    SizedBox(height: 12),
                    Text(
                      "Error: ${state.searchErrorMessage}",
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final products = state.searchEntity?.items ?? [];
        if (products.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Text("No products found."),
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final item = products[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 119,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColor.containerColor,
                        ),
                      ),

                      AspectRatio(
                        aspectRatio: 3 / 2,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: "${ApiConstant.baseUrl}${item.image}",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => shimmerLoading(),
                            errorWidget:
                                (context, url, error) =>
                                    const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppins15(
                      context,
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.leagueSpartan(fontSize: 12),
                  ),
                  Divider(endIndent: 10, color: AppColor.insideColor),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${item.price.floor()}",
                          style: AppTextStyles.poppins15(context).copyWith(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                             Icon(
                                Icons.favorite_border,
                                size: 18,
                                color: AppColor.primaryColor,
                              ),
                            Icon(
                                Icons.shopping_cart_outlined,
                                size: 18,
                                color: AppColor.primaryColor,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }, childCount: products.length),
          ),
        );
      },
    );
  }
}
