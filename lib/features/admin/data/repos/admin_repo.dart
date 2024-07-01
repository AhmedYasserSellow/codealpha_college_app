import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/models/event_model.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';

abstract class AdminRepo {
  Future uploadStudentData(BuildContext context, StudentModel studentModel);
  Future uploadEventData(BuildContext context, EventModel eventModel);
  Future deleteEvent(String eventId);
}
