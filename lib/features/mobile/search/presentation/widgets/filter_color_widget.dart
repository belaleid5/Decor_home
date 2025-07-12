import 'package:decor_app/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class FilterColorPicker extends StatefulWidget {
  final List<Color> colors;
  final Function(Color?) onSelectionChanged;

  const FilterColorPicker({
    super.key,
    required this.colors,
    required this.onSelectionChanged,
  });

  @override
  State<FilterColorPicker> createState() => _FilterColorPickerState();
}

class _FilterColorPickerState extends State<FilterColorPicker> {
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 35,
      children:
          widget.colors.map((color) {
            final isSelected = selectedColor == color;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = isSelected ? null : color;
                  widget.onSelectionChanged(selectedColor);
                });
              },
              child: Container(
                margin: EdgeInsets.all(3),
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColor.iconColor : Colors.transparent,
                    width: isSelected ? 1 : 0,
                  ),
                ),
                child:
                    isSelected
                        ? const Icon(
                          Icons.check,
                          color: AppColor.whiteColor,
                          size: 18,
                        )
                        : null,
              ),
            );
          }).toList(),
    );
  }
}
