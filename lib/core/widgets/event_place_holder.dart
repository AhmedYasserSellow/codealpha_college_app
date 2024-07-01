import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/models/event_model.dart';
import 'package:hogwarts_college_app/features/admin/data/repos/admin_repo_impl.dart';
import 'package:hogwarts_college_app/main.dart';

class EventPlaceHolder extends StatelessWidget {
  const EventPlaceHolder(
      {super.key, required this.eventModel, required this.eventID});
  final EventModel eventModel;
  final String eventID;
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
            isLoggedInPuplic == 1
                ? TextButton(
                    child: const Text(
                      'Delete Event',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    onPressed: () {
                      AdminRepoImpl().deleteEvent(eventID);
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
