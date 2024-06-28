import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/admin_view.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/events_view.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/houses_view.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/students_view.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/auth_view.dart';

abstract class AppRouter {
  static String authView = '/authView';
  static String adminView = '/adminView';
  static String housesView = '/housesView';
  static String studentsView = '/studentsView';
  static String eventsView = '/eventsView';

  static Map<String, Widget Function(BuildContext)> routes = {
    authView: (BuildContext context) => const AuthView(),
    adminView: (BuildContext context) => const AdminView(),
    housesView: (BuildContext context) => const HousesView(),
    studentsView: (BuildContext context) => const StudentsView(),
    eventsView: (BuildContext context) => const EventsView(),
  };
}
