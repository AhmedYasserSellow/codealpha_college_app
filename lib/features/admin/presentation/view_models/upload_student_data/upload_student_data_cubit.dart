import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_student_data_state.dart';

class UploadStudentDataCubit extends Cubit<UploadStudentDataState> {
  UploadStudentDataCubit() : super(UploadStudentDataInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  XFile? studentImage;
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  void pickStudentImage() async {
    studentImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(StudentImagePicked());
  }
}
