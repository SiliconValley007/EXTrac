import 'package:flutter/material.dart';

const Duration duration = Duration(milliseconds: 500);

abstract class AppStrings {
  static const List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  static const String appName = 'Extrac';
  static const String initialHomeScreen = '/initial-home-screen';
  static const String homeScreen = '/home-screen';
  static const String locationPermissionScreen = '/location-permission-screen';
  static const String loginScreen = '/login-screen';
  static const String smsPermissionScreen = '/sms-permission-screen';
  static const String expense = 'Expense';
  static const String income = 'Income';
}

abstract class AppColors {
  static const Color black = Color(0xff161D1B);
  static const Color white = Color(0xffFFFFFF);
  static const Color grey = Color(0xffB3C3CB);
  static const Color darkGrey = Color(0xff39443F);
  static const Color lightGrey = Color(0xffB9C8C1);
  static const Color semiLightGrey = Color(0xff747E82);
  static const Color green = Color(0xff58B73C);
  static const Color darkGreen = Color(0xff1E644E);
  static const Color textFieldFillGreen = Color(0xff317862);
  static const Color textFieldFillPurple = Color(0xff8D56C4);
  static const Color offWhite = Color(0xffEEEEEE);
  static const Color amber = Color(0xffFFC107);
  static const Color lightRed = Color(0xffFF3D00);
  static const Color greenAccent = Color(0xff4CAF50);
  static const Color blue = Color(0xff1976D2);
  static const Color lightBlack = Color(0xff2B342F);
  static const Color yellow = Color(0xffECCD32);
  static const Color orange = Color(0xffEC7A17);
  static const Color red = Color(0xffE93B18);
  static const List<Color> greenGradient = [
    Color(0xff277059),
    Color(0xff104031),
  ];
  static const List<Color> purpleGradient = [
    Color(0xff824DB7),
    Color(0xff5D219A),
  ];
  static const List<Color> yellowGradient = [
    Color(0xffEBC735),
    Color(0xffE6A51F),
  ];
}

class AppMethods {
  static Color percentageColor(double percentage) {
    if (percentage <= 50) {
      return AppColors.green;
    } else if (percentage <= 75) {
      return AppColors.yellow;
    } else if (percentage <= 90) {
      return AppColors.orange;
    } else {
      return AppColors.red;
    }
  }
}

abstract class AppAssets {
  static const man = 'assets/images/man.png';
  static const woman = 'assets/images/woman.png';
  static const lock = 'assets/icons/lock.svg';
  static const sms = 'assets/icons/sms.svg';
  static const google = 'assets/images/google.svg';
  static const noOtp = 'assets/icons/No OTP.svg';
  static const back = 'assets/icons/Back.svg';
  static const bank = 'assets/icons/Bank.svg';
  static const upi = 'assets/icons/UPI.svg';
  static const rupee = 'assets/icons/₹.svg';
  static const barGraph = 'assets/icons/Bar Graph.svg';
  static const lineGraph = 'assets/icons/Line graph.svg';
  static const pieChart = 'assets/icons/Pie Chart.svg';
  static const noPersonalSMS = 'assets/icons/No personal SMS.svg';
  static const setBudgetPng = 'assets/images/SetBudget.png';
  static const reminderPng = 'assets/images/Reminder.png';
  static const incomePng = 'assets/images/Income.png';
}

//custom classes
class CustomScrollPhysics extends ScrollPhysics {
  const CustomScrollPhysics({
    ScrollPhysics? parent,
    this.isGoingRight = false,
  }) : super(parent: parent);

  final bool isGoingRight;

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(
      parent: buildParent(ancestor),
    );
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    return offset;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    assert(() {
      if (value == position.pixels) {
        throw FlutterError(
            '$runtimeType.applyBoundaryConditions() was called redundantly.\n'
            'The proposed new position, $value, is exactly equal to the current position of the '
            'given ${position.runtimeType}, ${position.pixels}.\n'
            'The applyBoundaryConditions method should only be called when the value is '
            'going to actually change the pixels, otherwise it is redundant.\n'
            'The physics object in question was:\n'
            '  $this\n'
            'The position object in question was:\n'
            '  $position\n');
      }
      return true;
    }());
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }
    if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) {
      return value - position.pixels;
    }
    if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) {
      return value - position.minScrollExtent;
    }

    if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) {
      return value - position.maxScrollExtent;
    }

    if (!isGoingRight) {
      return value - position.pixels;
    }
    return 0.0;
  }
}
