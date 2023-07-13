import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hubtel_coding_challenge/utils/colors.dart';

import 'history_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hubtel Coding Challenge',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: GoogleFonts.nunitoSansTextTheme(),
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme:
              Theme.of(context).bottomNavigationBarTheme.copyWith(
                    unselectedLabelStyle:
                        const TextStyle(color: AppColors.navTextGray),
                    selectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.w800),
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.black,
                  )),
      home: const HistoryScreen(),
    );
  }
}
