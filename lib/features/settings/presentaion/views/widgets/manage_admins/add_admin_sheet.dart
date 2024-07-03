import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_data_button.dart';

class AddAdminView extends StatelessWidget {
  const AddAdminView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<AdminCubit>().pickAdminImage();
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
                    child: context.read<AdminCubit>().adminImage == null
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
                            File(context.read<AdminCubit>().adminImage!.path),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'first name cannot be empty';
                          }
                          return null;
                        },
                        title: 'First Name',
                        icon: FontAwesomeIcons.user,
                        controller:
                            context.read<AdminCubit>().adminFirstNameController,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: CustomTextField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'last name cannot be empty';
                          }
                          return null;
                        },
                        title: 'Last Name',
                        icon: FontAwesomeIcons.user,
                        controller:
                            context.read<AdminCubit>().adminLastNameController,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'email cannot be empty';
                    }
                    return null;
                  },
                  title: 'Username',
                  icon: FontAwesomeIcons.idCard,
                  controller: context.read<AdminCubit>().adminEmailController,
                ),
                CustomTextField(
                  title: 'Password',
                  icon: FontAwesomeIcons.lock,
                  controller:
                      context.read<AdminCubit>().adminPasswordController,
                ),
                const SizedBox(
                  height: 24,
                ),
                AddDataButton(
                  text: 'Add Admin',
                  onTap: () {
                    context.read<AdminCubit>().uploadAdminData(context);
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
