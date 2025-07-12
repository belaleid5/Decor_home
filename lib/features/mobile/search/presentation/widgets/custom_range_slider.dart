import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final RangeValues initialRangeValues;
  final Function(RangeValues) onPriceChanged;

  const CustomRangeSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialRangeValues,
    required this.onPriceChanged,
  });

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = widget.initialRangeValues;
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: const Color(0xFFF2B8A2),
        inactiveTrackColor: const Color(0xFFF8F1EA),
        thumbColor: const Color(0xFFE28B6B),
        overlayColor: Colors.transparent,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
        trackHeight: 5,
      ),
      child: RangeSlider(
        min: widget.minValue,
        max: widget.maxValue,
        values: _currentRangeValues,
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
            widget.onPriceChanged(values);
          });
        },
      ),
    );
  }
}
