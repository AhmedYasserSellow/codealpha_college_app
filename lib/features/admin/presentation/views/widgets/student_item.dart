import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';

class HouseItem extends StatelessWidget {
  const HouseItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: SecondaryColors.main,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
      ),
      child: Text(
        'House of ${title.toUpperCase()}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: SecondaryColors.main,
          fontSize: 20,
        ),
      ),
    );
  }
}
