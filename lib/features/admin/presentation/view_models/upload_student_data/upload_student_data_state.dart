part of 'upload_student_data_cubit.dart';

abstract class UploadStudentDataState {}

final class UploadStudentDataInitial extends UploadStudentDataState {}

final class StudentImagePicked extends UploadStudentDataState {}

final class UploadStudentDataLoading extends UploadStudentDataState {}

final class UploadStudentDataSuccess extends UploadStudentDataState {}

final class StudentHousePicked extends UploadStudentDataState {}

final class StudentLevelPicked extends UploadStudentDataState {}
