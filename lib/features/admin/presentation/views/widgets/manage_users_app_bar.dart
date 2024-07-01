import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/upload_student_data/upload_student_data_cubit.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_sheet_view/add_student_sheet.dart';

class ManageUsersAppBar extends StatelessWidget {
  const ManageUsersAppBar({
    super.key,
    this.title = 'Manage Users',
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      trailing: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => UploadStudentDataCubit(),
                  child: const AddStudentSheet(),
                );
              },
            );
          },
          icon: const Icon(FontAwesomeIcons.plus),
          color: Colors.white,
        ),
      ],
    );
  }
}
