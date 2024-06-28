import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'package:hogwarts_college_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future adminSignIn(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        Navigator.pushReplacementNamed(
          context,
          AppRouter.adminView,
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'email or password is incorrect',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Future studentSignIn(
      BuildContext context, String id, String password) async {}
  @override
  Future signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      Navigator.pushReplacementNamed(
        context,
        AppRouter.authView,
      );
    }
  }
}
