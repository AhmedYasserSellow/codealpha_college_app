import 'package:flutter/material.dart';

abstract class AuthRepo {
  Future adminSignIn(BuildContext context, String email, String password);
}
