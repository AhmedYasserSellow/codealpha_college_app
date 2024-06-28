import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future adminSignIn(BuildContext context, String email, String password);
  Future studentSignIn(BuildContext context, String id, String password);
  Future signOut(BuildContext context);
}
