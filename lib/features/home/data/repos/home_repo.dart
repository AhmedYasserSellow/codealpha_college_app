import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/events/data/models/event_model.dart';

abstract class HomeRepo {
  Future addEventToSchedule(
      String eventID, EventModel eventModel, StudentModel studentModel);
  Future deleteEventFromSchedule(
    StudentModel studentModel,
    String eventId,
  );
}
