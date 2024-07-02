import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/auth_form.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/auth_tap_bar.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/logo_section.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return const ScaffoldBuilder(
          slivers: [
            SliverToBoxAdapter(child: LogoSection()),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Sheet(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    AuthTabBar(),
                    SizedBox(height: 16),
                    AuthForm(),
                    SizedBox(height: 16),
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
