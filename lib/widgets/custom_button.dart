import 'package:flutter/material.dart';

import '../core/core.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.buttonText,
    this.buttonColor = AppColors.green,
    this.buttonBorderRadius = const BorderRadius.all(Radius.circular(10)),
    this.buttonTextStyle = const TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    ), this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final Color buttonColor;
  final BorderRadius buttonBorderRadius;
  final TextStyle buttonTextStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: buttonBorderRadius,
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.padding = const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 40,
    ),
    this.textStyle = const TextStyle(
      color: AppColors.green,
      fontSize: 12,
      wordSpacing: .5,
    ),
  }) : super(key: key);

  final VoidCallback onPressed;
  final String buttonText;
  final EdgeInsets padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.green,
          ),
          borderRadius: BorderRadius.circular(size.width),
        ),
        child: Text(
          buttonText,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}