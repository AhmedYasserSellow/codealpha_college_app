import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_data_button.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_events_view/select_event_time_and_date.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_events_view/select_event_location.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_events_view/upload_event_image.dart';

class AddEventsView extends StatelessWidget {
  const AddEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sheet(
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 24,
              ),
              const UploadEventImage(),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                title: 'Event Name',
                icon: FontAwesomeIcons.user,
                controller: context.read<AdminCubit>().titleController,
              ),
              const SelectEventTimeAndDate(),
              const SelectEventLocation(),
              const SizedBox(
                height: 24,
              ),
              AddDataButton(
                text: 'Add Event',
                onTap: () {
                  context.read<AdminCubit>().uploadEventData(context);
                },
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
