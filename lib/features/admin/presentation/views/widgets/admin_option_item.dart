import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/admin/data/models/admin_options_model.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.gridItemModel,
    required this.onTap,
  });
  final AdminOptionsModel gridItemModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: PrimaryColors.surface,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  gridItemModel.icon,
                  color: PrimaryColors.main,
                  size: 20,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  gridItemModel.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: PrimaryColors.main,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
