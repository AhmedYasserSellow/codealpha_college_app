import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/eye.dart';
import 'package:hogwarts_college_app/features/auth/presentation/views/widgets/sign_in_buttton.dart';

class AdminSignInForm extends StatelessWidget {
  const AdminSignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          title: 'Email',
          icon: FontAwesomeIcons.envelope,
          controller: context.read<AuthCubit>().adminEmailController,
        ),
        CustomTextField(
          isObscured: context.read<AuthCubit>().isObscured,
          suffix: const Eye(),
          title: 'Password',
          icon: FontAwesomeIcons.envelope,
          controller: context.read<AuthCubit>().adminPasswordController,
        ),
        SignInButton(
          text: 'Sign In',
          onTap: () {
            context.read<AuthCubit>().adminSignIn(context);
          },
        ),
      ],
    );
  }
}
