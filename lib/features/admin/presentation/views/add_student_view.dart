import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_view/add_student_button.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_view/select_house.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_view/select_level.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_view/upload_image_box.dart';

import '../view_models/admin_cubit/admin_cubit.dart';

class AddStudentView extends StatelessWidget {
  const AddStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sheet(
      child: SingleChildScrollView(
        child: Form(
          key: context.read<AdminCubit>().addstudentsFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 24,
              ),
              const UploadImageBox(),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'name cannot be empty';
                  }
                  return null;
                },
                title: 'Full Name',
                icon: FontAwesomeIcons.user,
                controller: context.read<AdminCubit>().studentNameController,
              ),
              CustomTextField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'phone Number cannot be empty';
                  }
                  return null;
                },
                title: 'Phone Number',
                icon: FontAwesomeIcons.phone,
                controller: context.read<AdminCubit>().studentPhoneController,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('House :'),
                      SizedBox(
                        width: 8,
                      ),
                      SelectHouse(),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Level :'),
                      SizedBox(
                        width: 8,
                      ),
                      SelectLevel(),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              AddStudentButton(
                text: 'Add Student',
                onTap: () {
                  context.read<AdminCubit>().uploadStudentData(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
