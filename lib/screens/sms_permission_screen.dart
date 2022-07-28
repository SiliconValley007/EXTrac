import '../core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/widgets.dart';

class SMSPermissionScreen extends StatelessWidget {
  const SMSPermissionScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const SMSPermissionScreen());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SMS Permission',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    wordSpacing: .5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Allowing SMS permission will help us to present your spend bill payments and other needful insights.',
                  maxLines: null,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.noOtp),
                        const SizedBox(width: 10),
                        const Text(
                          'No OTP',
                          maxLines: null,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width * 0.1),
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.noPersonalSMS),
                        const SizedBox(width: 10),
                        const Text(
                          'No Personal SMS',
                          maxLines: null,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                const SmallerDisplayScreen(
                  title: 'SMS Permission',
                  subtitle: 'SMS ACCESS FOR THIS APP',
                  filledRadioButtonText: 'Allow',
                  unfilledRadioButtonText: 'Don\'t Allow',
                ),
                SizedBox(height: size.height * 0.1),
                CustomButton(
                  buttonText: 'Grant SMS Permission',
                  onPressed: () => Navigator.pushNamed(
                      context, AppStrings.locationPermissionScreen),
                ),
                const SizedBox(height: 15),
                const Align(
                  child: Text.rich(
                    TextSpan(
                      text: 'By giving permission you are agreeing EXTrac\n',
                      children: [
                        TextSpan(
                          text: 'terms of use',
                          style: TextStyle(
                            color: AppColors.green,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'privacy policy',
                          style: TextStyle(
                            color: AppColors.green,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
