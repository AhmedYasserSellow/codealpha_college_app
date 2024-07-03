import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'package:hogwarts_college_app/features/auth/data/repos/auth_repo.dart';
import 'package:hogwarts_college_app/features/settings/data/models/admin_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future adminSignIn(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((admin) {
        if (context.mounted) {
          Navigator.pushReplacementNamed(
            context,
            AppRouter.adminView,
            arguments: AdminModel(
              name: admin.user!.displayName!,
              email: email,
              password: password,
              image: admin.user!.photoURL!,
            ),
          );
        }
      });
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
  Future studentSignIn(BuildContext context, String id, String password) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await FirebaseFirestore.instance.collection('students').doc(id).get();

      if (doc.exists && doc.data()!['pw'] == password) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'student@hogwarts.std',
          password: '12345678',
        );
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('id', id);
        prefs.setString('house', doc.data()!['house']!);
        prefs.setString('level', doc.data()!['level']!);

        if (context.mounted) {
          Navigator.pushReplacementNamed(
            context,
            AppRouter.homeView,
          );
        }
      } else {
        throw Exception();
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'ID or Password is incorrect',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

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
