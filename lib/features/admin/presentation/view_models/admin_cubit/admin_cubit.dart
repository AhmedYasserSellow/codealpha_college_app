import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/admin/data/repos/admin_repo_impl.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/admin_view_body.dart';
import 'package:hogwarts_college_app/features/settings/data/models/admin_model.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/settings_view.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/add_student_view.dart';
import 'package:hogwarts_college_app/features/events/data/models/event_model.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/add_events_view.dart';
import 'package:image_picker/image_picker.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  int currentPage = 0;
  List adminPages = const [
    AdminViewBody(),
    AddStudentView(),
    AddEventsView(),
    SettingsView(),
  ];
  List<GButton> tabs = const [
    GButton(
      icon: FontAwesomeIcons.house,
      text: 'Home',
    ),
    GButton(
      icon: FontAwesomeIcons.users,
      text: 'Add Users',
    ),
    GButton(
      icon: FontAwesomeIcons.upload,
      text: 'Upload Event',
    ),
    GButton(
      icon: FontAwesomeIcons.gear,
      text: 'Settings',
    )
  ];
  void changePage(int index) {
    currentPage = index;
    emit(AdminChangePageState());
  }
// Add Students Section

  GlobalKey<FormState> addstudentsFormKey = GlobalKey<FormState>();
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
    if (addstudentsFormKey.currentState!.validate()) {
      emit(UploadStudentDataLoading());

      try {
        await AdminRepoImpl().uploadStudentData(
            context,
            StudentModel(
              name: studentNameController.text,
              phone: studentPhoneController.text,
              house: studentHouse,
              level: studentLevel,
              image: studentImage!.path,
            ));
        emit(UploadStudentDataSuccess());
      } catch (e) {
        emit(UploadStudentDataError());
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'there was an error , try again later',
              style: TextStyle(color: Colors.white),
            ),
          ));
        }
      }
    }
  }

  // Add Events Section

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  XFile? eventImage;
  String eventLocation = 'House Of Gryffindor';
  void pickEventImage() async {
    eventImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(EventImagePicked());
  }

  void pickEventLocation(String location) {
    eventLocation = location;
    emit(EventLocationPicked());
  }

  Future uploadEventData(BuildContext context) async {
    emit(UploadEventDataLoading());

    try {
      await AdminRepoImpl().uploadEventData(
        context,
        EventModel(
          name: titleController.text,
          date: dateController.text,
          time: timeController.text,
          location: eventLocation,
          image: eventImage!.path,
        ),
      );
      emit(UploadEventDataSuccess());
    } catch (e) {
      emit(UploadEventDataError());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'there was an error , try again later',
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    }
  }

// Add Admins Section

  TextEditingController adminFirstNameController = TextEditingController();
  TextEditingController adminLastNameController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  XFile? adminImage;

  void pickAdminImage() async {
    adminImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(AdminImagePicked());
  }

  void uploadAdminData(BuildContext context) async {
    emit(UploadAdminDataLoading());
    try {
      await AdminRepoImpl().uploadAdminData(
        context,
        AdminModel(
          name:
              '${adminFirstNameController.text} ${adminLastNameController.text}',
          email: '${adminEmailController.text}@hogwarts.std',
          image: adminImage!.path,
          password: adminPasswordController.text,
        ),
      );
      emit(UploadAdminDataSuccess());
    } catch (e) {
      emit(UploadAdminDataError());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'there was an error , try again later',
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    }
  }
}
