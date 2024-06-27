import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/admin/data/models/grid_item_model.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.gridItemModel,
  });
  final GridItemModel gridItemModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
    );
  }
}
