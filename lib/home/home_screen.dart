import 'package:flutter/material.dart';
import 'package:transformx/home/pages/pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        elevation: 2,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.house),
            icon: Icon(Icons.roofing),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.area_chart),
            icon: Icon(Icons.area_chart_outlined),
            label: 'Stats',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: SafeArea(
        child: <Widget>[
          const HomeView(),
          const StatsPageWrapper(),
          const ProfilePage(),
        ][currentPageIndex],
      ),
    );
  }
}
