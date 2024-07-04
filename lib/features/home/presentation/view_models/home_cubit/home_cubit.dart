import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/events/presentation/views/events_view.dart';
import 'package:hogwarts_college_app/features/home/presentation/views/schedule_view.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/student_profile_view.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int pageIndex = 0;

  List screens(StudentModelWithPassword studentModelWithPassword) => [
        EventsView(
          isAdmin: false,
          studentModelWithPassword: studentModelWithPassword,
        ),
        ScheduleView(studentModel: studentModelWithPassword.studentModel),
        StudentProfileView(
          isAdmin: false,
          studentModelWithPasswordHome: studentModelWithPassword,
        )
      ];

  List<GButton> tabs = const [
    GButton(
      text: 'Events',
      icon: FontAwesomeIcons.calendar,
    ),
    GButton(
      text: 'Schedule',
      icon: FontAwesomeIcons.clock,
    ),
    GButton(
      icon: FontAwesomeIcons.user,
      text: 'Profile',
    ),
  ];

  void changePages(int index) {
    pageIndex = index;
    emit(HomePageUpdated());
  }
}
