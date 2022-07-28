import 'dart:async';

import '../core/constants.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../core/core.dart';

class InitialHomeScreen extends StatefulWidget {
  const InitialHomeScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const InitialHomeScreen());

  @override
  State<InitialHomeScreen> createState() => _InitialHomeScreenState();
}

class _InitialHomeScreenState extends State<InitialHomeScreen>
    with SingleTickerProviderStateMixin {
  late final ValueNotifier<bool> _showSeparateBankAccountsTab =
      ValueNotifier(true);

  late final ValueNotifier<bool> _showMessagesScanningTab = ValueNotifier(true);

  late final Timer _timer;

  late final ValueNotifier<bool> _setMonthlyBudgetExpanded =
      ValueNotifier(false);
  late final ValueNotifier<bool> _setIncomeGoalExpanded = ValueNotifier(false);

  late final ValueNotifier<bool> _isDisplayMan = ValueNotifier(true);

  late final List<ValueNotifier> _initialDisplayButtonsList = [
    _setMonthlyBudgetExpanded,
    _setIncomeGoalExpanded,
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 2), (_) {
      _showMessagesScanningTab.value = true;
    });
  }

  @override
  void dispose() {
    _showSeparateBankAccountsTab.dispose();
    _showMessagesScanningTab.dispose();
    for (int i = 0; i < _initialDisplayButtonsList.length; i++) {
      _initialDisplayButtonsList[i].dispose();
    }
    _isDisplayMan.dispose();
    _timer.cancel();
    super.dispose();
  }

  void toggleContainerExpansion(int containerNumber) {
    for (int i = 0; i < _initialDisplayButtonsList.length; i++) {
      if (i == containerNumber) {
        _initialDisplayButtonsList[i].value = true;
        continue;
      }
      _initialDisplayButtonsList[i].value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _TopBar(
                  isDisplayMan: _isDisplayMan,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable: _showSeparateBankAccountsTab,
                        builder: (context, value, child) {
                          return AnimatedSwitcher(
                            transitionBuilder: (child, animation) =>
                                SizeTransition(
                              sizeFactor: animation,
                              child: child,
                            ),
                            switchInCurve: Curves.easeOut,
                            switchOutCurve: Curves.easeIn,
                            duration: duration,
                            child: value
                                ? Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.darkGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Want dedicated transaction insights of your separate bank accounts?',
                                          style: TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          maxLines: null,
                                        ),
                                        const SizedBox(height: 25),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () =>
                                                  _showSeparateBankAccountsTab
                                                      .value = false,
                                              child: const Text(
                                                'Dismiss',
                                                style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 12,
                                                  wordSpacing: .5,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const SizedBox(width: 25),
                                            CustomOutlinedButton(
                                              onPressed: () =>
                                                  _showSeparateBankAccountsTab
                                                      .value = false,
                                              buttonText: 'Yes',
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ValueListenableBuilder<bool>(
                        valueListenable: _setMonthlyBudgetExpanded,
                        builder: (context, value, child) => SetNewTab(
                          title: 'Set Monthly Budget',
                          content:
                              'A financial budget helps you to create financial stability and set the right path in achieving financial goals.',
                          imageFilePath: AppAssets.setBudgetPng,
                          buttonText: 'Set Budget',
                          isExpanded: value,
                          textFieldHeading: 'Enter Budget Amount',
                          hintText: '0.00',
                          gradient: const LinearGradient(
                            colors: AppColors.greenGradient,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          fillColor: AppColors.textFieldFillGreen,
                          onPressed: () {
                            if (_setMonthlyBudgetExpanded.value) {
                              Navigator.pushNamed(
                                  context, AppStrings.homeScreen);
                            } else {
                              toggleContainerExpansion(
                                  _initialDisplayButtonsList
                                      .indexOf(_setMonthlyBudgetExpanded));
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      ValueListenableBuilder<bool>(
                        valueListenable: _setIncomeGoalExpanded,
                        builder: (context, value, child) => SetNewTab(
                          title: 'Set Income Goal',
                          content:
                              'Setting a proper income goal in advance helps in proper utilization of available resources.',
                          imageFilePath: AppAssets.incomePng,
                          buttonText: 'Set Income Goal',
                          isExpanded: value,
                          textFieldHeading: 'Set Income Goal',
                          hintText: '0.00',
                          gradient: const LinearGradient(
                            colors: AppColors.purpleGradient,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          buttonColor: AppColors.white,
                          fillColor: AppColors.textFieldFillPurple,
                          onPressed: () {
                            if (_setIncomeGoalExpanded.value) {
                              Navigator.pushNamed(
                                  context, AppStrings.homeScreen);
                            } else {
                              toggleContainerExpansion(
                                  _initialDisplayButtonsList
                                      .indexOf(_setIncomeGoalExpanded));
                            }
                          },
                        ),
                      ),
                      // const SizedBox(height: 10),
                      // const _InitialDisplayContainer(
                      //   title: 'Set Reminders',
                      //   content:
                      //       'Set reminders for upcoming Bills, Incomes and make sure you pay them timely',
                      //   animationFilePath: AppAssets.clockAnimation,
                      //   buttonText: 'Set Reminders',
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _showMessagesScanningTab,
              builder: (_, value, __) => AnimatedPositioned(
                duration: duration,
                bottom: value ? 0 : -size.height,
                curve: Curves.easeOut,
                child: Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 15.0,
                  ),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.lightBlack,
                        AppColors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Collecting your transaction data...',
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          wordSpacing: .5,
                        ),
                        maxLines: null,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Note: We will not collect your personal or confidential details',
                        style: TextStyle(
                          color: AppColors.semiLightGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          wordSpacing: .5,
                        ),
                        maxLines: null,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      TweenAnimationBuilder<double>(
                        key: ValueKey(value),
                        tween: Tween<double>(begin: 0, end: 100),
                        duration: const Duration(seconds: 9),
                        onEnd: () => _showMessagesScanningTab.value = false,
                        builder: (__, value, _) =>
                            CustomLinearProgressIndicator(
                          width: size.width,
                          percentage: value,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    Key? key,
    required this.isDisplayMan,
  }) : super(key: key);

  final ValueNotifier<bool> isDisplayMan;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.zero,
      // height: size.height * 0.1,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [
            AppColors.black,
            AppColors.lightBlack,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => isDisplayMan.value = !isDisplayMan.value,
            child: ValueListenableBuilder<bool>(
              valueListenable: isDisplayMan,
              builder: (context, value, child) {
                return AnimatedSwitcher(
                  duration: duration,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  child: value
                      ? Image.asset(
                          AppAssets.man,
                          key: const ValueKey(AppAssets.man),
                          width: size.width * 0.1,
                          height: size.width * 0.1,
                        )
                      : Image.asset(
                          AppAssets.woman,
                          key: const ValueKey(AppAssets.woman),
                          width: size.width * 0.1,
                          height: size.width * 0.1,
                        ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Good Morning',
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  wordSpacing: .5,
                ),
                maxLines: null,
                textAlign: TextAlign.left,
              ),
              Text(
                'Debjeet!',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  wordSpacing: .5,
                ),
                maxLines: null,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
