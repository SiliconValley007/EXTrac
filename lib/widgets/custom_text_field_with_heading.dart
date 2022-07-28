import 'package:flutter/material.dart';

import '../core/core.dart';
import 'custom_text_field.dart';

class CustomTextFieldWithHeading extends StatelessWidget {
  const CustomTextFieldWithHeading({
    Key? key,
    required this.heading,
    required this.hintText,
    this.prefixIcon,
    required this.hintTextStyle,
    this.isFilled = false,
    this.fillColor,
  })  : assert(isFilled ? fillColor != null : true),
        super(key: key);

  final String heading;
  final String hintText;
  final TextStyle hintTextStyle;
  final bool isFilled;
  final Color? fillColor;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 12.0,
            ),
            maxLines: null,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: hintText,
            hintStyle: hintTextStyle,
            prefixIcon: prefixIcon,
            isFilled: isFilled,
            fillColor: fillColor,
          ),
        ],
      ),
    );
  }
}
