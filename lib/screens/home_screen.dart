import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';

import '../core/constants.dart';
import '../core/core.dart';
import '../widgets/water_filling_animation.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute<void>(builder: (_) => const HomeScreen());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final ValueNotifier<bool> _isDisplayExpense = ValueNotifier(true);
  late final ValueNotifier<bool> _isDisplayMan = ValueNotifier(true);
  late final ValueNotifier<int> _percentage = ValueNotifier(69);
  late final ValueNotifier<int> _tabIndex = ValueNotifier(0);

  late final TabController _tabController = TabController(
    length: 12,
    vsync: this,
    initialIndex: DateTime.now().month - 1,
  );

  late final TabController _graphDisplayController = TabController(
    length: 2,
    vsync: this,
  );

  late final TabController _singlePercentageController = TabController(
    length: 1,
    vsync: this,
  );

  @override
  void dispose() {
    _isDisplayExpense.dispose();
    _isDisplayMan.dispose();
    _percentage.dispose();
    _tabController.dispose();
    _tabIndex.dispose();
    _graphDisplayController.dispose();
    _singlePercentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _TopBar(
              isDisplayExpense: _isDisplayExpense,
              tabController: _tabController,
              isDisplayMan: _isDisplayMan,
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  const Center(
                    child: Text(
                      'Jan',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Feb',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Mar',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Apr',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'May',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: WaveCircularLoader(),
                  ),
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        left: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ValueListenableBuilder<int>(
                                valueListenable: _percentage,
                                builder: (context, value, child) {
                                  return CircleProgressBar(
                                    radius: size.height * 0.3,
                                    value: value.toDouble(),
                                    strokeWidth: 15,
                                    onTap: (animationStatus) {
                                      if (animationStatus ==
                                              AnimationStatus.completed ||
                                          animationStatus ==
                                              AnimationStatus.dismissed) {
                                        _percentage.value =
                                            0 + Random().nextInt(100);
                                      }
                                    },
                                  );
                                },
                              ),
                              // SizedBox(
                              //   width: size.height * 0.3,
                              //   height: size.height * 0.3,
                              //   child: const Center(
                              //     child: Text('Bar Chart'),
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: size.height * 0.3,
                              //   height: size.height * 0.3,
                              //   child: const Center(
                              //     child: Text('Pie Chart'),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          ValueListenableBuilder<int>(
                            valueListenable: _tabIndex,
                            builder: (context, value, child) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (_tabIndex.value != 0) {
                                      _tabIndex.value = 0;
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    AppAssets.lineGraph,
                                    width: size.width * 0.07,
                                    height: size.width * 0.07,
                                    color: value == 0
                                        ? AppColors.green
                                        : AppColors.lightGrey,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                GestureDetector(
                                  onTap: () {
                                    if (_tabIndex.value != 1) {
                                      _tabIndex.value = 1;
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    AppAssets.barGraph,
                                    width: size.width * 0.07,
                                    height: size.width * 0.07,
                                    color: value == 1
                                        ? AppColors.green
                                        : AppColors.lightGrey,
                                  ),
                                ),
                                const SizedBox(width: 24),
                                GestureDetector(
                                  onTap: () {
                                    if (_tabIndex.value != 2) {
                                      _tabIndex.value = 2;
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    AppAssets.pieChart,
                                    width: size.width * 0.07,
                                    height: size.width * 0.07,
                                    color: value == 2
                                        ? AppColors.green
                                        : AppColors.lightGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text.rich(
                            TextSpan(
                              text: '₹7,800 Spent',
                              style: TextStyle(
                                color: AppColors.offWhite,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              children: [
                                TextSpan(
                                  text: ' of ₹10,000',
                                  style: TextStyle(
                                    color: AppColors.lightGrey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '₹333.33 / Day  |  16th Jul, 2022',
                            style: TextStyle(
                              color: AppColors.semiLightGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ValueListenableBuilder<int>(
                            valueListenable: _tabIndex,
                            builder: (context, value, child) =>
                                AnimatedSwitcher(
                              duration: duration,
                              transitionBuilder: (child, animation) =>
                                  FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                              child: value == 0
                                  ? TabBar(
                                      controller: _singlePercentageController,
                                      isScrollable: true,
                                      labelPadding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.05,
                                      ),
                                      labelColor: AppColors.green,
                                      labelStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                      unselectedLabelColor: AppColors.lightGrey,
                                      unselectedLabelStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                      indicator: BoxDecoration(
                                        border: Border.all(
                                          color: AppColors.green,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(size.width),
                                      ),
                                      indicatorWeight: 0.0,
                                      tabs: const [
                                        Tab(
                                          text: 'Update Budget',
                                        ),
                                      ],
                                    )
                                  : Theme(
                                      data: ThemeData(
                                        splashColor: Colors.transparent,
                                      ),
                                      child: TabBar(
                                        controller: _graphDisplayController,
                                        isScrollable: true,
                                        labelPadding: EdgeInsets.symmetric(
                                          horizontal: size.width * 0.05,
                                        ),
                                        labelColor: AppColors.green,
                                        labelStyle: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        unselectedLabelColor:
                                            AppColors.lightGrey,
                                        unselectedLabelStyle: const TextStyle(
                                          fontSize: 14,
                                        ),
                                        indicator: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.green,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(size.width),
                                        ),
                                        indicatorWeight: 0.0,
                                        tabs: const [
                                          Tab(
                                            text: 'Weekly',
                                          ),
                                          Tab(
                                            text: 'Monthly',
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 15.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Recent Transactions',
                                      style: TextStyle(
                                        color: AppColors.lightGrey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        wordSpacing: 1,
                                        letterSpacing: .5,
                                      ),
                                    ),
                                    _CustomChevron(
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                TransactionTile(
                                  prefixIcon: SvgPicture.asset(
                                    AppAssets.upi,
                                  ),
                                  heading: 'UPI Transaction',
                                  subtitle: '1 hr Ago',
                                  suffixText: '- ₹568.00',
                                ),
                                const SizedBox(height: 20),
                                TransactionTile(
                                  prefixIcon: SvgPicture.asset(
                                    AppAssets.upi,
                                  ),
                                  heading: 'UPI Transaction',
                                  subtitle: '29th Aug',
                                  suffixText: '+ ₹900.00',
                                ),
                                const SizedBox(height: 20),
                                TransactionTile(
                                  prefixIcon: SvgPicture.asset(
                                    AppAssets.bank,
                                  ),
                                  heading: 'Bank Transaction',
                                  subtitle: '24th Aug',
                                  suffixText: '+ ₹1580.00',
                                ),
                                const SizedBox(height: 20),
                                CustomButton(
                                  onPressed: () {},
                                  buttonText: 'Add New Transaction',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 20.0,
                              horizontal: 15.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkGrey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Today\'s Expense',
                                      style: TextStyle(
                                        color: AppColors.lightGrey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '₹568.00',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Today\'s Income',
                                      style: TextStyle(
                                        color: AppColors.lightGrey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '₹0.00',
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Container(
                          //   width: double.infinity,
                          //   padding: const EdgeInsets.symmetric(
                          //     vertical: 20.0,
                          //     horizontal: 15.0,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: AppColors.darkGrey,
                          //     ),
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           const Text(
                          //             'Reminders',
                          //             style: TextStyle(
                          //               color: AppColors.lightGrey,
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.normal,
                          //             ),
                          //           ),
                          //           _CustomChevron(
                          //             onPressed: () {},
                          //           ),
                          //         ],
                          //       ),
                          //       const SizedBox(height: 10),
                          //       SingleChildScrollView(
                          //         scrollDirection: Axis.horizontal,
                          //         physics: const BouncingScrollPhysics(),
                          //         child: Row(
                          //           children: [
                          //             ReminderListItem(
                          //               amount: '₹499.00',
                          //               reminderTitle: 'Mobile Recharge',
                          //               timeLeft: '05 Days to go',
                          //               onReschedulePressed: () {},
                          //             ),
                          //             const SizedBox(width: 10),
                          //             ReminderListItem(
                          //               amount: '₹80,000.00',
                          //               reminderTitle: 'College Fees',
                          //               timeLeft: '45 Days to go',
                          //               onReschedulePressed: () {},
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       const SizedBox(height: 15),
                          //       const CustomButton(
                          //         buttonText: 'Set Reminder',
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Aug',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Sep',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Oct',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Nov',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Dec',
                      style: TextStyle(
                        color: AppColors.offWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomChevron extends StatelessWidget {
  const _CustomChevron({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightBlack,
        ),
        padding: const EdgeInsets.all(
          5.0,
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.chevron_right,
          color: AppColors.green,
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    Key? key,
    required this.isDisplayExpense,
    required this.isDisplayMan,
    required this.tabController,
  }) : super(key: key);

  final ValueNotifier<bool> isDisplayExpense;
  final ValueNotifier<bool> isDisplayMan;
  final TabController tabController;

  void vibrate() async {
    if ((await Vibration.hasVibrator()) ?? false) {
      Vibration.vibrate(
        duration: 50,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.zero,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => isDisplayMan.value = !isDisplayMan.value,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: isDisplayMan,
                      builder: (context, value, child) {
                        return AnimatedSwitcher(
                          duration: duration,
                          transitionBuilder: (child, animation) =>
                              FadeTransition(
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
              Row(
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: isDisplayExpense,
                    builder: (_, value, child) => AnimatedDefaultTextStyle(
                      curve: Curves.easeInOut,
                      duration: duration,
                      style: GoogleFonts.nunito(
                        color: value ? AppColors.green : AppColors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        wordSpacing: .5,
                        // color: AppColors.grey,
                      ),
                      child: child!,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (!isDisplayExpense.value) {
                          isDisplayExpense.value = true;
                        }
                      },
                      child: const Text(
                        AppStrings.expense,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ValueListenableBuilder<bool>(
                    valueListenable: isDisplayExpense,
                    builder: (_, value, child) => AnimatedDefaultTextStyle(
                      duration: duration,
                      curve: Curves.easeInOut,
                      style: GoogleFonts.nunito(
                        color: value ? AppColors.grey : AppColors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        wordSpacing: .5,
                      ),
                      child: child!,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (isDisplayExpense.value) {
                          isDisplayExpense.value = false;
                        }
                      },
                      child: const Text(
                        AppStrings.income,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          TabBar(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            isScrollable: true,
            onTap: (index) {
              if (index > DateTime.now().month - 1) {
                tabController.index = tabController.previousIndex;
              } else {
                if (tabController.indexIsChanging) {
                  vibrate();
                }
              }
            },
            labelStyle: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
            ),
            unselectedLabelStyle: const TextStyle(
              color: AppColors.lightGrey,
              fontSize: 14,
            ),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: AppColors.darkGreen,
              ),
              // shape: BoxShape.rectangle,
            ),
            indicatorWeight: 0.0,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              for (int i = 0; i < AppStrings.months.length; i++)
                i < (DateTime.now().month - 1)
                    ? Tab(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: EdgeInsets.zero,
                          alignment: Alignment.center,
                          child: Text(
                            AppStrings.months[i],
                          ),
                        ),
                      )
                    : i == DateTime.now().month - 1
                        ? Tab(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: AppColors.darkGreen,
                              ),
                              alignment: Alignment.center,
                              child: Text(AppStrings.months[i]),
                            ),
                          )
                        : Tab(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin: EdgeInsets.zero,
                              alignment: Alignment.center,
                              child: Text(
                                AppStrings.months[i],
                                style: const TextStyle(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ),
                          ),
            ],
          ),
        ],
      ),
    );
  }
}
