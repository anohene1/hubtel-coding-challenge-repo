import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hubtel/colors.dart';
import 'package:hubtel/history_screen.dart';

// A shell to hold the bottom nav bar and chosen screens, in this case only HistoryScreen
class BottomNavShell extends StatelessWidget {
  const BottomNavShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HistoryScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: AppColors.lightTeal,
                radius: 22,
                child: SvgPicture.asset('assets/icons/Home.svg'),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/MoMo.svg',
                fit: BoxFit.none,
                width: 25,
                height: 35,
              ),
              label: 'Send'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/History.svg',
                fit: BoxFit.none,
                height: 35,
              ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Schedule.svg',
                fit: BoxFit.none,
                width: 25,
                height: 35,
              ),
              label: 'Scheduled'),
        ],
      ),
    );
  }
}
