import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/upload_student_data/upload_student_data_cubit.dart';

class SelectHouse extends StatelessWidget {
  const SelectHouse({
    super.key,
  });
  static const List<String> items = [
    'GRY',
    'HUF',
    'RAV',
    'SLY',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadStudentDataCubit, UploadStudentDataState>(
      builder: (context, state) {
        return DropdownButton(
          value: context.read<UploadStudentDataCubit>().studentHouse,
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
            context.read<UploadStudentDataCubit>().pickStudentHouse(value!);
          },
        );
      },
    );
  }
}
