import 'package:flutter/material.dart';

import '../core/core.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    Key? key,
    required this.width,
    required this.percentage,
  })  : assert(percentage >= 0 && percentage <= 100),
        super(key: key);

  final double width;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: width * 0.005,
          decoration: BoxDecoration(
            color: AppColors.lightBlack,
            borderRadius: BorderRadius.all(Radius.circular(width)),
          ),
        ),
        AnimatedContainer(
          duration: duration,
          width: width * ((percentage / 100) - (percentage < 50 ? 0 : 0.1)),
          height: width * 0.005,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.all(Radius.circular(width)),
          ),
        ),
      ],
    );
  }
}