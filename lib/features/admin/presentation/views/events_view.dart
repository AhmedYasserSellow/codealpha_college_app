import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NestedScrollViewScaffoldBuilder(
      appBar: CustomAppBar(
        title: 'Events View',
        trailing: [],
      ),
      body: Sheet(
        child: Center(
          child: Text('Events View'),
        ),
      ),
    );
  }
}
