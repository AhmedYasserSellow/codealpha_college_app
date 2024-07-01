import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';

abstract class AdminRepo {
  Future uploadStudentData(BuildContext context, StudentModel studentModel);
}
