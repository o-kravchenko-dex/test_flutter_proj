import 'package:flutter/material.dart';
import 'package:untitled_flutter_pr/routes/app_routes.dart';
import 'package:untitled_flutter_pr/styles/icons/app_icons.dart';
import 'package:untitled_flutter_pr/styles/styles.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  final String route;
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child, required this.route});

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int _currentIndex = 0;

  static List<BottomNavbarItem> tabs = [
    BottomNavbarItem(
      icon: Icon(AppIcons.home),
      activeIcon: Icon(AppIcons.home, color: AppColors.green6),
      label: 'HOME',
      initialLocation: AppRoutes.root,
    ),
    BottomNavbarItem(
      icon: Icon(AppIcons.donut),
      activeIcon: Icon(AppIcons.donut, color: AppColors.green6),
      label: 'GRAPH',
      initialLocation: AppRoutes.graph,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(fontFamily: 'Roboto');
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: labelStyle,
        unselectedLabelStyle: labelStyle,
        selectedItemColor: const Color(0xFF434343),
        selectedFontSize: 12,
        unselectedItemColor: const Color(0xFF083299),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => setState(() {
          _currentIndex = index;
        }),
        currentIndex: _currentIndex,
        items: tabs,
      ),
    );
  }
}

class BottomNavbarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const BottomNavbarItem({
    required this.initialLocation,
    required Widget icon,
    String? label,
    Widget? activeIcon,
  }) : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}
