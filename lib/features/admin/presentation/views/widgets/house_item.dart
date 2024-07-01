import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'package:hogwarts_college_app/features/admin/data/models/path_model.dart';

class HouseItem extends StatelessWidget {
  const HouseItem({
    super.key,
    required this.houseModel,
  });

  final HouseModel houseModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.levelsView,
          arguments: houseModel,
        );
      },
      child: Container(
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
          'House of ${houseModel.houseFullName}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: SecondaryColors.main,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
