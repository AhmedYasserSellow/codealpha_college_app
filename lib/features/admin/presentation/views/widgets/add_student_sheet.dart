import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/main_button.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/upload_student_data/upload_student_data_cubit.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/upload_image_box.dart';

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
                title: 'ID',
                icon: FontAwesomeIcons.idCard,
                controller:
                    context.read<UploadStudentDataCubit>().studentIDController,
              ),
              MainButton(
                text: 'Add Student',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
