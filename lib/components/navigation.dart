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
      backgroundColor: Colors.transparent, // Transparent background for nav bar
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style6, // Style with minimal background
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20.0),
        colorBehindNavBar: Colors.transparent,
      ),
      // Additional customization for opacity and shadow removal
      navBarHeight: kBottomNavigationBarHeight,
      bottomScreenMargin: 0,
      margin: EdgeInsets.zero,
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
        icon: const Icon(Icons.wb_sunny),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.black,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Weekly",
        icon: const Icon(Icons.calendar_today),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.black,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
      PersistentBottomNavBarItem(
        title: "Monthly",
        icon: const Icon(Icons.calendar_month),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.black,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
    ];
  }
}
