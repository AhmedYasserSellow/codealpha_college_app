import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';

class Eye extends StatelessWidget {
  const Eye({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                context.read<AuthCubit>().changeObscure();
              },
              icon: Icon(
                context.read<AuthCubit>().eyeIcon,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 12,
            )
          ],
        );
      },
    );
  }
}
