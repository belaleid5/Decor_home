import 'package:decor_app/core/utils/app_color.dart';
import 'package:decor_app/core/widget/adaptive_input_field.dart';
import 'package:decor_app/core/widget/custom_title_section.dart';
import 'package:decor_app/features/mobile/auth/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/custom_search_anchor.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> allItems = [
    "Bad",
    "Lamp",
    "Plastic",
    "Carpet",
    "Sofa",
    "Blue Chairs",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: 'Search'),
            SliverToBoxAdapter(child: CustomSearchAnchor()),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomTitleSection(title: 'Top Searches'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: AdaptiveInputField(
                    hintColor: Colors.black,
                    readOnly: true,
                    prefix: Container(
                      margin: EdgeInsets.all(14),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(
                          Icons.search,
                          size: 16,
                          color: AppColor.iconColor,
                        ),
                      ),
                    ),
                    context: context,
                    controller: SearchController(),

                    hintText: allItems[index],
                  ),
                ),
                childCount: allItems.length, // Example item count
              ),
            ),
          ],
        ),
      ),
    );
  }
}
