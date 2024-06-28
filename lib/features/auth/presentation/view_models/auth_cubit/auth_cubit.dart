import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/features/auth/data/repos/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  int currentIndex = 0;

  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController studentPasswordController = TextEditingController();

  IconData eyeIcon = FontAwesomeIcons.eyeSlash;
  bool isObscured = true;
  void changeIndex(int index) {
    adminEmailController.clear();
    adminPasswordController.clear();
    studentIDController.clear();
    studentPasswordController.clear();
    currentIndex = index;
    emit(AuthPageUpdated());
  }

  changeObscure() {
    if (isObscured) {
      eyeIcon = FontAwesomeIcons.eye;
      isObscured = !isObscured;
    } else {
      eyeIcon = FontAwesomeIcons.eyeSlash;
      isObscured = !isObscured;
    }
    emit(AuthPageUpdated());
  }

  Future adminSignIn(BuildContext context) async {
    emit(AdminButtonisLoading());
    await AuthRepoImpl().adminSignIn(
      context,
      adminEmailController.text,
      adminPasswordController.text,
    );
    emit(AuthPageUpdated());
  }

  Future studentSignIn() async {}

  Future signOut(BuildContext context) async {
    await AuthRepoImpl().signOut(context);
  }
}
