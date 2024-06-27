import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/core/utils/assets.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/admin_sign_in_form.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/auth_tap_bar.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/student_sign_in_form.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ScaffoldBuilder(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'Hogwarts School',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Image.asset(Assets.kLogo, width: 250, height: 250),
            )),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Sheet(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const AuthTabBar(),
                    const SizedBox(height: 16),
                    context.read<AuthCubit>().currentIndex == 0
                        ? const AdminSignInForm()
                        : const StudentSignInForm(),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
