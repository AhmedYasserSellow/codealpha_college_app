import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'package:hogwarts_college_app/features/settings/data/models/admin_model.dart';

class AdminItem extends StatelessWidget {
  const AdminItem({
    super.key,
    required this.adminModel,
  });
  final AdminModel adminModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.adminProfileView,
            arguments: adminModel);
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
          adminModel.email,
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
