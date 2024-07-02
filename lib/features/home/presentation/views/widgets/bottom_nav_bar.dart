import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTabChange,
    required this.selectedIndex,
    required this.tabs,
  });
  final void Function(int)? onTabChange;
  final int selectedIndex;
  final List<GButton> tabs;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: NeutralColors.k500,
      ),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: GNav(
          selectedIndex: selectedIndex,
          onTabChange: onTabChange,
          backgroundColor: NeutralColors.k500,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: PrimaryColors.main,
          gap: 12,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          tabBorderRadius: 30,
          tabs: tabs,
        ),
      ),
    );
  }
}
