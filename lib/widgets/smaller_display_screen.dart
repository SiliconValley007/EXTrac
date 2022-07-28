import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/core.dart';
import 'widgets.dart';

class SmallerDisplayScreen extends StatelessWidget {
  const SmallerDisplayScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.filledRadioButtonText,
    required this.unfilledRadioButtonText,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String filledRadioButtonText;
  final String unfilledRadioButtonText;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40.0,
      ),
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        gradient: LinearGradient(
          colors: [
            AppColors.lightBlack,
            AppColors.black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            AppAssets.back,
            color: AppColors.grey,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: .5,
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 25),
          Align(
            child: Container(
              width: size.width * 0.2,
              height: size.width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.grey.withOpacity(0.4),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            subtitle,
            style: const TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CustomRadioButton(
                radius: size.width * 0.045,
                filled: true,
              ),
              const SizedBox(width: 15),
              Text(
                filledRadioButtonText,
                style: const TextStyle(
                  color: AppColors.grey,
                ),
                maxLines: null,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              CustomRadioButton(
                radius: size.width * 0.045,
              ),
              const SizedBox(width: 15),
              Text(
                unfilledRadioButtonText,
                style: const TextStyle(
                  color: AppColors.grey,
                ),
                maxLines: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
