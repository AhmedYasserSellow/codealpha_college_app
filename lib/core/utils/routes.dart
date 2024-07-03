import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/admin_view.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:hogwarts_college_app/features/events/presentation/views/events_view.dart';
import 'package:hogwarts_college_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/admin_profile_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/houses_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/levels_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/manage_admins_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/student_profile_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/students_view.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/auth_view.dart';
import 'package:hogwarts_college_app/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static String authView = '/authView';
  static String adminView = '/adminView';
  static String housesView = '/housesView';
  static String levelsView = '/levelsView';
  static String studentsView = '/studentsView';
  static String studentView = '/studentView';
  static String manageAdminsView = '/manageAdminsView';
  static String adminProfileView = '/adminProfileView';
  static String manageEventsView = '/manageEventsView';
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
    homeView: (BuildContext context) => BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeView(),
        ),
    housesView: (BuildContext context) => const HousesView(),
    levelsView: (BuildContext context) => const LevelsView(),
    studentsView: (BuildContext context) => const StudentsView(),
    studentView: (BuildContext context) => const StudentProfileView(),
    manageAdminsView: (BuildContext context) => const ManageAdminsView(),
    adminProfileView: (BuildContext context) => const AdminProfileView(),
    manageEventsView: (BuildContext context) =>
        const NestedScrollViewScaffoldBuilder(
          appBar: CustomAppBar(title: 'Manage Events', trailing: []),
          body: EventsView(
            isAdmin: true,
          ),
        ),
  };
}
