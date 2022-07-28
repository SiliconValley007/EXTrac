import 'package:flutter/material.dart';

import '../core/core.dart';
import '../widgets/widgets.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const LocationPermissionScreen());

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
                  'Location Permission',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    wordSpacing: .5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'This helps us to present you the location of your spends and expenses.',
                  maxLines: null,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.09),
                const SmallerDisplayScreen(
                  title: 'Location Permission',
                  subtitle: 'LOCATION ACCESS FOR THIS APP',
                  filledRadioButtonText: 'Allow',
                  unfilledRadioButtonText: 'Don\'t Allow',
                ),
                SizedBox(height: size.height * 0.1),
                CustomButton(
                  buttonText: 'Grant Location Permission',
                  onPressed: () => Navigator.pushNamed(
                      context, AppStrings.initialHomeScreen),
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
