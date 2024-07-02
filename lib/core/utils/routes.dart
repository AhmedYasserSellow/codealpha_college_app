import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/admin_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/houses_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/levels_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/students_view.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/auth_view.dart';
import 'package:hogwarts_college_app/features/home/presentation/views/home_view.dart';
import 'package:hogwarts_college_app/features/student/presentataion/views/student_view.dart';

abstract class AppRouter {
  static String authView = '/authView';
  static String adminView = '/adminView';
  static String housesView = '/housesView';
  static String levelsView = '/levelsView';
  static String studentsView = '/studentsView';
  static String studentView = '/studentView';
  static String homeView = '/homeView';

  static Map<String, Widget Function(BuildContext)> routes = {
    authView: (BuildContext context) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const AuthView(),
        ),
    adminView: (BuildContext context) => BlocProvider(
          create: (context) => AdminCubit(),
          child: const AdminView(),
        ),
    housesView: (BuildContext context) => const HousesView(),
    levelsView: (BuildContext context) => const LevelsView(),
    studentsView: (BuildContext context) => const StudentsView(),
    studentView: (BuildContext context) => const StudentView(),
    homeView: (BuildContext context) => const HomeView(),
  };
}
