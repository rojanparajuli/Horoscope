import 'package:flutter/material.dart';
import 'package:horoscope/view/daily_horoscope_screen.dart';
import 'package:horoscope/view/monthly_horocope_screen.dart';
import 'package:horoscope/view/weekly_horoscope_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.blueGrey[900]!,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style1,
      navBarHeight: 60,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.zero,
        colorBehindNavBar: Colors.blueGrey[900]!,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const DailyHoroscopeScreen(),
      const WeeklyHoroscopeScreen(),
      const MonthlyHoroscopeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: "Daily",
        icon: const Icon(Icons.wb_sunny_outlined),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Weekly",
        icon: const Icon(Icons.calendar_today_outlined),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Monthly",
        icon: const Icon(Icons.calendar_month_outlined),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.grey,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    ];
  }
}
