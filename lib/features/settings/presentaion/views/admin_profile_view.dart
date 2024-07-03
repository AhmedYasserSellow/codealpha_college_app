import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/settings/data/models/admin_model.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/manage_students/password_text_field.dart';

class AdminProfileView extends StatelessWidget {
  const AdminProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminModel adminModel =
        ModalRoute.of(context)!.settings.arguments as AdminModel;
    String firstName = adminModel.name.split(' ')[0];
    String lastName = adminModel.name.split(' ')[1];
    String userName = adminModel.email.split('@')[0];
    return NestedScrollViewScaffoldBuilder(
      appBar: const CustomAppBar(
        title: 'Admin Info',
        trailing: [],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Sheet(
              child: Column(
                children: [
                  const SizedBox(height: 66),
                  CustomTextField(
                    readOnly: true,
                    title: 'First Name',
                    icon: FontAwesomeIcons.user,
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        text: firstName,
                      ),
                    ),
                  ),
                  CustomTextField(
                    readOnly: true,
                    title: 'Last Name',
                    icon: FontAwesomeIcons.user,
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        text: lastName,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          readOnly: true,
                          title: 'Username',
                          icon: FontAwesomeIcons.idCard,
                          controller: TextEditingController.fromValue(
                            TextEditingValue(
                              text: userName,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        '@hogwarts.std',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                  PasswordTextField(
                    password: adminModel.password,
                  ),
                ],
              ),
            ),
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              adminModel.image,
            ),
          )
        ],
      ),
    );
  }
}
