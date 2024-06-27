import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/admin_view.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/auth_view.dart';

abstract class AppRouter {
  static String authView = '/authView';
  static String adminView = '/adminView';

  static Map<String, Widget Function(BuildContext)> routes = {
    authView: (BuildContext context) => const AuthView(),
    adminView: (BuildContext context) => const AdminView(),
  };
}
