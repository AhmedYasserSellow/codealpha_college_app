import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';

abstract class HomeRepo {
  Future loadData(
    StudentModelWithPassword studentModel,
  );
}
