class StudentModel {
  final String name, phone, house, level, image;
  const StudentModel(
      {required this.name,
      required this.phone,
      required this.house,
      required this.level,
      required this.image});
}

class StudentModelWithPassword {
  final StudentModel studentModel;
  final String password;

  const StudentModelWithPassword({
    required this.studentModel,
    required this.password,
  });
}
