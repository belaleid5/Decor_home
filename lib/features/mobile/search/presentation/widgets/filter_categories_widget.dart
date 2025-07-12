import 'package:decor_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class FilterSelectedItemWidget extends StatefulWidget {
  final List<String> categories;
  final Function(String?) onSelectionChanged;

  const FilterSelectedItemWidget({
    super.key,
    required this.categories,
    required this.onSelectionChanged,
  });

  @override
  State<FilterSelectedItemWidget> createState() => _FilterSelectedItemWidgetState();
}

class _FilterSelectedItemWidgetState extends State<FilterSelectedItemWidget> {
  String? selectedCategory;

  void _toggleCategory(String category) {
    setState(() {
      selectedCategory = selectedCategory == category ? null : category;
      widget.onSelectionChanged(selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      alignment: WrapAlignment.start,
      runSpacing: 8,
      children: widget.categories.map((category) {
        final isSelected = selectedCategory == category;
        return GestureDetector(
          onTap: () => _toggleCategory(category),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColor.primaryColor : AppColor.containerColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isSelected ? AppColor.primaryColor : AppColor.containerColor),
            ),
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? AppColor.textColorButton : AppColor.insideColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}