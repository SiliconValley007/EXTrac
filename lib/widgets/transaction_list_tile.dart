import 'package:flutter/material.dart';

import '../core/core.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.prefixIcon,
    required this.heading,
    required this.subtitle,
    required this.suffixText,
  }) : super(key: key);

  final Widget prefixIcon;
  final String heading;
  final String subtitle;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.lightGrey,
                ),
              ),
              padding: const EdgeInsets.all(
                15.0,
              ),
              alignment: Alignment.center,
              child: prefixIcon,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.lightGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          suffixText,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
