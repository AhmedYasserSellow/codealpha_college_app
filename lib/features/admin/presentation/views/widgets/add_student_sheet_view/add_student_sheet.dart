import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_sheet_view/add_student_button.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_sheet_view/select_house.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_sheet_view/select_level.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/upload_student_data/upload_student_data_cubit.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_sheet_view/upload_image_box.dart';

class AddStudentSheet extends StatelessWidget {
  const AddStudentSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: context.read<UploadStudentDataCubit>().formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const UploadImageBox(),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                title: 'Full Name',
                icon: FontAwesomeIcons.user,
                controller: context
                    .read<UploadStudentDataCubit>()
                    .studentNameController,
              ),
              CustomTextField(
                title: 'Phone Number',
                icon: FontAwesomeIcons.phone,
                controller: context
                    .read<UploadStudentDataCubit>()
                    .studentPhoneController,
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
                  context
                      .read<UploadStudentDataCubit>()
                      .uploadStudentData(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
