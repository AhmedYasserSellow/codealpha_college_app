import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';

class HouseItem extends StatelessWidget {
  const HouseItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Text(
        'House of Gryffindor',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: SecondaryColors.main,
          fontSize: 20,
        ),
      ),
    );
  }
}
