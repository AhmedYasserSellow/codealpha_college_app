import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/events/data/models/event_model.dart';
import 'package:hogwarts_college_app/features/home/data/repos/home_repo.dart';
import 'package:intl/intl.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future addEventToSchedule(
      String eventID, EventModel eventModel, StudentModel studentModel) async {
    String dateString = '${eventModel.date} ${eventModel.time}';
    DateFormat dateFormat = DateFormat('MMM d, yyyy h:mm a');
    DateTime dateTime = dateFormat.parse(dateString);
    await FirebaseFirestore.instance
        .collection(studentModel.house)
        .doc('students')
        .collection(studentModel.level)
        .doc(studentModel.phone)
        .collection('schedule')
        .doc(eventID)
        .set(
      {
        'name': eventModel.name,
        'image': eventModel.image,
        'date': eventModel.date,
        'time': eventModel.time,
        'location': eventModel.location,
        'timestamp': dateTime.millisecondsSinceEpoch
      },
    );
  }

  @override
  Future deleteEventFromSchedule(
    StudentModel studentModel,
    String eventId,
  ) async {
    await FirebaseFirestore.instance
        .collection(studentModel.house)
        .doc('students')
        .collection(studentModel.level)
        .doc(studentModel.phone)
        .collection('schedule')
        .doc(eventId)
        .delete();
  }
}
