import 'package:flutter/material.dart';

import '../core/core.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintStyle = const TextStyle(
      color: AppColors.grey,
    ),
    this.textStyle = const TextStyle(
      color: AppColors.white,
    ),
    required this.hintText,
    this.cursorColor = AppColors.green,
    this.borderColor = AppColors.darkGrey,
    this.prefixIcon,
    this.isFilled = false,
    this.fillColor,
  })  : assert(isFilled ? fillColor != null : true),
        super(key: key);

  final TextStyle hintStyle;
  final TextStyle textStyle;
  final String hintText;
  final bool isFilled;
  final Color? fillColor;
  final Color cursorColor;
  final Color borderColor;
  final Widget? prefixIcon;

  OutlineInputBorder _outlineInputBorder({Color? customBorderColor}) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: isFilled
            ? BorderSide.none
            : BorderSide(
                color: customBorderColor ?? borderColor,
              ),
      );

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: cursorColor,
      decoration: InputDecoration(
        focusedBorder: _outlineInputBorder(
          customBorderColor: AppColors.green,
        ),
        enabledBorder: _outlineInputBorder(),
        border: _outlineInputBorder(),
        filled: isFilled,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: isFilled
            ? const TextStyle(
                color: AppColors.white,
              )
            : hintStyle,
        prefixIcon: prefixIcon,
      ),
      style: textStyle,
    );
  }
}
