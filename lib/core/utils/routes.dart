import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/admin_view.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/events_view.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/houses_view.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/levels_view.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/students_view.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/auth_view.dart';
import 'package:hogwarts_college_app/features/student/presentataion/views/student_view.dart';

abstract class AppRouter {
  static String authView = '/authView';
  static String adminView = '/adminView';
  static String housesView = '/housesView';
  static String levelsView = '/levelsView';
  static String studentsView = '/studentsView';
  static String studentView = '/studentView';
  static String eventsView = '/eventsView';

  static Map<String, Widget Function(BuildContext)> routes = {
    authView: (BuildContext context) => const AuthView(),
    adminView: (BuildContext context) => const AdminView(),
    housesView: (BuildContext context) => const HousesView(),
    levelsView: (BuildContext context) => const LevelsView(),
    studentsView: (BuildContext context) => const StudentsView(),
    studentView: (BuildContext context) => const StudentView(),
    eventsView: (BuildContext context) => const EventsView(),
  };
}
