import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/eye.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/auth_button.dart';

class StudentSignInForm extends StatelessWidget {
  const StudentSignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              title: 'ID / Phone Number',
              icon: FontAwesomeIcons.phone,
              controller: context.read<AuthCubit>().studentIDController,
            ),
            CustomTextField(
              isObscured: context.read<AuthCubit>().isObscured,
              suffix: const Eye(),
              title: 'Password',
              icon: FontAwesomeIcons.envelope,
              controller: context.read<AuthCubit>().studentPasswordController,
            ),
            AuthButton(
              text: 'Sign In',
              onTap: () {
                context.read<AuthCubit>().studentSignIn(context);
              },
            ),
          ],
        );
      },
    );
  }
}
