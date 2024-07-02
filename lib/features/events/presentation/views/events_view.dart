import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/features/events/presentation/views/widgets/event_place_holder.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/events/data/models/event_model.dart';

class EventsView extends StatelessWidget {
  const EventsView({
    super.key,
    required this.isAdmin,
  });
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    return Sheet(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('events')
              .orderBy('timestamp')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  SliverList.separated(
                    itemBuilder: (context, index) {
                      return EventPlaceHolder(
                        isAdmin: isAdmin,
                        eventID: snapshot.data!.docs[index].id,
                        eventModel: EventModel(
                          name: snapshot.data!.docs[index]['name'],
                          date: snapshot.data!.docs[index]['date'],
                          time: snapshot.data!.docs[index]['time'],
                          location: snapshot.data!.docs[index]['location'],
                          image: snapshot.data!.docs[index]['image'],
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 16);
                    },
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
