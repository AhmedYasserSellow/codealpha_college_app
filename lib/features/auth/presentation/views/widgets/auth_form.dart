import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/admin_sign_in_form.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/student_sign_in_form.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (context.read<AuthCubit>().currentIndex == 0) {
          return const AdminSignInForm();
        } else {
          return const StudentSignInForm();
        }
      },
    );
  }
}
