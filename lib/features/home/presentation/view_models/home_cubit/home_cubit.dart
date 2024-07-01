import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int isLoggedIn = 0;
  late StudentModelWithPassword studentModel;
  Future loadData() async {
    emit(HomeLoading());
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getInt('isLoggedIn') ?? 0;
    if (isLoggedIn == 2) {
      String id = prefs.getString('id') ?? '';
      String house = prefs.getString('house') ?? '';
      String level = prefs.getString('level') ?? '';
      await FirebaseFirestore.instance
          .collection(house)
          .doc('students')
          .collection(level)
          .doc(id)
          .get()
          .then((value) {
        studentModel = StudentModelWithPassword(
          studentModel: StudentModel(
              name: value.data()!['name'],
              phone: value.data()!['phone'],
              house: house,
              level: level,
              image: value.data()!['image']),
          password: value.data()!['password'],
        );
      });
    }
    emit(HomeLoaded());
  }
}
