import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/upload_student_data/upload_student_data_cubit.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadStudentDataCubit, UploadStudentDataState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<UploadStudentDataCubit>().pickStudentImage();
          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: SecondaryColors.main,
                  width: 1,
                )),
            child: context.read<UploadStudentDataCubit>().studentImage == null
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.image,
                        size: 50,
                        color: SecondaryColors.main,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Add Image',
                        style: TextStyle(
                          color: SecondaryColors.main,
                        ),
                      )
                    ],
                  )
                : Image.file(
                    File(context
                        .read<UploadStudentDataCubit>()
                        .studentImage!
                        .path),
                    fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
