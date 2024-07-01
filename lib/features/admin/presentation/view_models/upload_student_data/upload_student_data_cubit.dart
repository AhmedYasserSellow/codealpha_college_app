import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/admin/data/repos/admin_repo_impl.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_student_data_state.dart';

class UploadStudentDataCubit extends Cubit<UploadStudentDataState> {
  UploadStudentDataCubit() : super(UploadStudentDataInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? studentImage;
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentPhoneController = TextEditingController();
  String studentHouse = 'GRY';
  String studentLevel = '000';
  void pickStudentImage() async {
    studentImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(StudentImagePicked());
  }

  void pickStudentHouse(String house) {
    studentHouse = house;
    emit(StudentHousePicked());
  }

  void pickStudentLevel(String level) {
    studentLevel = level;
    emit(StudentLevelPicked());
  }

  void uploadStudentData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(UploadStudentDataLoading());

      AdminRepoImpl().uploadStudentData(
          context,
          StudentModel(
            name: studentNameController.text,
            phone: studentPhoneController.text,
            house: studentHouse,
            level: studentLevel,
            image: studentImage!.path,
          ));
      emit(UploadStudentDataSuccess());
    }
  }
}
