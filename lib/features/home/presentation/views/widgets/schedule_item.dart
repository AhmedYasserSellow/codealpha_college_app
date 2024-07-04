import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/events/data/models/event_model.dart';
import 'package:hogwarts_college_app/features/home/data/repos/home_repo_impl.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
    required this.eventModel,
    required this.eventID,
    required this.studentModel,
  });
  final EventModel eventModel;
  final String eventID;
  final StudentModel studentModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            eventModel.image,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${eventModel.date} ${eventModel.time}',
              style: const TextStyle(
                  fontSize: 20,
                  color: PrimaryColors.main,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              eventModel.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              eventModel.location,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: SecondaryColors.main,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            TextButton(
              child: const Text(
                'Remove from schedule',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                HomeRepoImpl().deleteEventFromSchedule(studentModel, eventID);
              },
            )
          ],
        ),
      ],
    );
  }
}
