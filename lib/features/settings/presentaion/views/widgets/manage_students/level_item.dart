import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'package:hogwarts_college_app/features/settings/data/models/path_model.dart';

class LevelItem extends StatelessWidget {
  const LevelItem({
    super.key,
    required this.pathModel,
  });
  final PathModel pathModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.studentsView,
            arguments: pathModel);
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
          'Level ${pathModel.level}',
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
