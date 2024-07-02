part of 'admin_cubit.dart';

abstract class AdminState {}

final class AdminInitial extends AdminState {}

final class AdminChangePageState extends AdminState {}

// Add Users Section

final class StudentImagePicked extends AdminState {}

final class StudentHousePicked extends AdminState {}

final class StudentLevelPicked extends AdminState {}

final class UploadStudentDataLoading extends AdminState {}

final class UploadStudentDataSuccess extends AdminState {}

// Add Events Section

final class EventImagePicked extends AdminState {}

final class EventLocationPicked extends AdminState {}

final class UploadEventDataLoading extends AdminState {}

final class UploadEventDataSuccess extends AdminState {}

final class UploadEventDataError extends AdminState {}
