import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/event_place_holder.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/core/models/event_model.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({
    super.key,
  });

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
                  SliverToBoxAdapter(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 100,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Text(
                      'Events',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverList.separated(
                    itemBuilder: (context, index) {
                      return EventPlaceHolder(
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
