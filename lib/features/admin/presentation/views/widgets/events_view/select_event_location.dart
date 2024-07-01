import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/events_cubit/events_cubit.dart';

class SelectEventLocation extends StatelessWidget {
  const SelectEventLocation({
    super.key,
  });
  static const List<String> locations = [
    'House Of Gryffindor',
    'House Of Hufflepuff',
    'House Of Ravenclaw',
    'House Of Slytherin',
    'Hogwarts Lobby',
    'Hogwarts Stadium',
    'Hogwarts Stage',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsCubit, EventsState>(
      builder: (context, state) {
        return Row(
          children: [
            const Text('Event Location :'),
            const SizedBox(
              width: 16,
            ),
            DropdownButton(
              value: context.read<EventsCubit>().eventLocation,
              items: locations.map(
                (String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                context.read<EventsCubit>().pickEventLocation(value!);
              },
            ),
          ],
        );
      },
    );
  }
}
