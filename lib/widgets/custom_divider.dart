import 'package:flutter/material.dart';

import '../core/core.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width * 0.02,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.all(Radius.circular(width)),
      ),
    );
  }
}