import 'package:flutter/material.dart';

class MenuPrice extends StatelessWidget {
  const MenuPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('\$100'),
          Text("\$500"),
          Text("\$1000"),
          Text("\$1500"),
        ],
      ),
    );
  }
}