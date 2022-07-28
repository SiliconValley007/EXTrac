import 'package:flutter/material.dart';

import '../core/core.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.radius,
    this.filled = false,
  }) : super(key: key);

  final double radius;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.grey,
        ),
      ),
      child: filled
          ? Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.green,
              ),
            )
          : null,
    );
  }
}