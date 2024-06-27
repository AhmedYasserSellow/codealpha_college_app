import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';

class AuthTab extends StatelessWidget {
  const AuthTab({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: isSelected ? PrimaryColors.main : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : PrimaryColors.main,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
