import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';

class SelectLevel extends StatelessWidget {
  const SelectLevel({
    super.key,
  });
  static const List<String> items = [
    '000',
    '100',
    '200',
    '300',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return DropdownButton(
          value: context.read<AdminCubit>().studentLevel,
          items: items.map(
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
            context.read<AdminCubit>().pickStudentLevel(value!);
          },
        );
      },
    );
  }
}
