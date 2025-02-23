import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';

class AddDataButton extends StatelessWidget {
  const AddDataButton({
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
    return BlocBuilder<AdminCubit, AdminState>(
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
              child: state is UploadStudentDataLoading ||
                      state is UploadEventDataLoading ||
                      state is UploadAdminDataLoading
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
