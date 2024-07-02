import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';
import 'package:intl/intl.dart';

class SelectEventTimeAndDate extends StatelessWidget {
  const SelectEventTimeAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: CustomTextField(
                keyboardType: TextInputType.none,
                title: 'Event Date',
                icon: FontAwesomeIcons.calendar,
                controller: context.read<AdminCubit>().dateController,
                readOnly: true,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.utc(DateTime.now().year + 1, 12, 31))
                      .then((value) {
                    if (value == null) {
                      context.read<AdminCubit>().dateController.clear();
                    } else {
                      context.read<AdminCubit>().dateController.text =
                          DateFormat.yMMMd().format(value);
                    }
                  });
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextField(
                keyboardType: TextInputType.none,
                title: 'Event Time',
                icon: FontAwesomeIcons.clock,
                controller: context.read<AdminCubit>().timeController,
                readOnly: true,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((value) {
                    if (value == null) {
                      context.read<AdminCubit>().timeController.clear();
                    } else {
                      context.read<AdminCubit>().timeController.text =
                          value.format(context);
                    }
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
