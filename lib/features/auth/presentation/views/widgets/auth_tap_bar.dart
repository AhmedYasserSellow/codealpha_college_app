import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/auth_tab.dart';

class AuthTabBar extends StatelessWidget {
  const AuthTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: PrimaryColors.surface,
          ),
          child: Row(
            children: [
              Expanded(
                child: AuthTab(
                  isSelected: context.read<AuthCubit>().currentIndex == 0,
                  title: 'Admin',
                  onTap: () {
                    context.read<AuthCubit>().changeIndex(0);
                  },
                ),
              ),
              Expanded(
                child: AuthTab(
                  isSelected: context.read<AuthCubit>().currentIndex == 1,
                  title: 'Student',
                  onTap: () {
                    context.read<AuthCubit>().changeIndex(1);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
