import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/upload_student_data/upload_student_data_cubit.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.text,
    this.onTap,
    this.buttonColor = PrimaryColors.main,
    this.textColor = Colors.white,
  });
  final String text;
  final void Function()? onTap;
  final Color buttonColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadStudentDataCubit, UploadStudentDataState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(52),
              color: buttonColor,
            ),
            child: Center(
              child: state is UploadStudentDataLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
