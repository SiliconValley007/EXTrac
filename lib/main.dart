import 'package:extrac/router/app_router.dart';

import 'core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extrac',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColors.green,
            ),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: const InitialHomeScreen(),
    );
  }
}
