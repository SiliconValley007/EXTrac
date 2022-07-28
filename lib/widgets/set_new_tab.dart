import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/core.dart';
import 'widgets.dart';

class SetNewTab extends StatelessWidget {
  const SetNewTab({
    Key? key,
    required this.title,
    required this.content,
    required this.imageFilePath,
    required this.buttonText,
    this.onPressed,
    this.isExpanded = false,
    required this.textFieldHeading,
    required this.hintText,
    required this.gradient,
    this.buttonColor = AppColors.green,
    required this.fillColor,
  }) : super(key: key);

  final String title;
  final String content;
  final String imageFilePath;
  final String buttonText;
  final String textFieldHeading;
  final String hintText;
  final Color fillColor;
  final bool isExpanded;
  final Color buttonColor;
  final VoidCallback? onPressed;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: duration,
      curve: Curves.easeInOut,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: AppColors.darkGrey,
        // ),
        gradient: gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              imageFilePath,
              height: size.width * 0.4,
              width: size.width * 0.4,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              wordSpacing: .5,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            content,
                            style: const TextStyle(
                              color: AppColors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            maxLines: null,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                    ),
                  ],
                ),
                AnimatedSwitcher(
                  duration: duration,
                  transitionBuilder: (child, animation) => SizeTransition(
                    sizeFactor: animation,
                    child: child,
                  ),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  child: isExpanded
                      ? CustomTextFieldWithHeading(
                          heading: textFieldHeading,
                          hintText: hintText,
                          isFilled: true,
                          fillColor: fillColor,
                          hintTextStyle: const TextStyle(
                            color: AppColors.darkGrey,
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AppAssets.rupee,
                              height: size.width * 0.045,
                              width: size.width * 0.045,
                              fit: BoxFit.scaleDown,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonText: isExpanded ? 'Continue' : buttonText,
                        onPressed: onPressed,
                        buttonColor: buttonColor,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
