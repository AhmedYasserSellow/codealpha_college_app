import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldBuilder(
      slivers: [
        SliverToBoxAdapter(
          child: Text('Events View'),
        ),
      ],
    );
  }
}
