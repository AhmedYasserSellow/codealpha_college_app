import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';

class UploadEventImage extends StatelessWidget {
  const UploadEventImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<AdminCubit>().pickEventImage();
          },
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: SecondaryColors.main,
                  width: 1,
                )),
            child: context.read<AdminCubit>().eventImage == null
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
                : Image.file(File(context.read<AdminCubit>().eventImage!.path),
                    fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
