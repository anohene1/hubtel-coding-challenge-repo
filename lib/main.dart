import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hubtel/bottom_nav_shell.dart';
import 'package:hubtel/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hubtel Coding Challenge',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.teal,
        textTheme: GoogleFonts.nunitoSansTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.teal),
        bottomNavigationBarTheme: Theme.of(context)
            .bottomNavigationBarTheme
            .copyWith(
              unselectedLabelStyle:
                  const TextStyle(color: AppColors.navTextGray),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
            ),
      ),
      home: const BottomNavShell(),
    );
  }
}
