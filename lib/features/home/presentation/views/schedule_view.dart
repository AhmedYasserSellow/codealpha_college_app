import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/events/data/models/event_model.dart';
import 'package:hogwarts_college_app/features/home/presentation/views/widgets/schedule_item.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({
    super.key,
    required this.studentModel,
  });
  final StudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return Sheet(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(studentModel.house)
              .doc('students')
              .collection(studentModel.level)
              .doc(studentModel.phone)
              .collection('schedule')
              .orderBy('timestamp')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverList.separated(
                    itemBuilder: (context, index) {
                      return ScheduleItem(
                        studentModel: studentModel,
                        eventModel: EventModel(
                          name: snapshot.data!.docs[index]['name'],
                          date: snapshot.data!.docs[index]['date'],
                          time: snapshot.data!.docs[index]['time'],
                          location: snapshot.data!.docs[index]['location'],
                          image: snapshot.data!.docs[index]['image'],
                        ),
                        eventID: snapshot.data!.docs[index].id,
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
