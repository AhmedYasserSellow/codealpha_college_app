import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({super.key, required this.studentModelWithPassword});
  final StudentModelWithPassword studentModelWithPassword;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.studentView,
          arguments: studentModelWithPassword,
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
          studentModelWithPassword.studentModel.phone,
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
