import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/core.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const LoginScreen());

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    'Let\'s Get Started!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Enter your information below or continue with your Google Account.',
                    maxLines: null,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hintText: 'Email Address',
                    borderColor: AppColors.grey,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppAssets.sms,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'Enter Password',
                    borderColor: AppColors.grey,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppAssets.lock,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.green,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    buttonText: 'Next',
                    onPressed: () => Navigator.pushNamed(
                        context, AppStrings.smsPermissionScreen),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Spacer(),
                      CustomDivider(
                        width: size.width * 0.15,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Or Create Using',
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      CustomDivider(
                        width: size.width * 0.15,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppAssets.google,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
