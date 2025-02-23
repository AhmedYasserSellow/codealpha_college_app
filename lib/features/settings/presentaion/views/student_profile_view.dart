import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/utils/assets.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/manage_students/password_text_field.dart';

class StudentProfileView extends StatelessWidget {
  const StudentProfileView({
    super.key,
    this.studentModelWithPasswordHome,
    required this.isAdmin,
  });
  final StudentModelWithPassword? studentModelWithPasswordHome;
  final bool isAdmin;
  @override
  Widget build(BuildContext context) {
    final StudentModelWithPassword studentModelWithPassword;
    if (isAdmin) {
      studentModelWithPassword = ModalRoute.of(context)!.settings.arguments
          as StudentModelWithPassword;
    } else {
      studentModelWithPassword = studentModelWithPasswordHome!;
    }

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Sheet(
            child: isAdmin
                ? ProfileViewBody(
                    studentModelWithPassword: studentModelWithPassword)
                : SingleChildScrollView(
                    child: ProfileViewBody(
                        studentModelWithPassword: studentModelWithPassword),
                  ),
          ),
        ),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            studentModelWithPassword.studentModel.image,
          ),
        )
      ],
    );
  }
}

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({
    super.key,
    required this.studentModelWithPassword,
  });

  final StudentModelWithPassword studentModelWithPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 66),
        CustomTextField(
          readOnly: true,
          title: 'Full Name',
          icon: FontAwesomeIcons.user,
          controller: TextEditingController.fromValue(
            TextEditingValue(
              text: studentModelWithPassword.studentModel.name,
            ),
          ),
        ),
        CustomTextField(
          readOnly: true,
          title: 'Phone / ID',
          icon: FontAwesomeIcons.idCard,
          controller: TextEditingController.fromValue(
            TextEditingValue(
              text: studentModelWithPassword.studentModel.phone,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                readOnly: true,
                title: 'House Name',
                icon: FontAwesomeIcons.house,
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: studentModelWithPassword.studentModel.house,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomTextField(
                readOnly: true,
                title: 'Level',
                icon: FontAwesomeIcons.hashtag,
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: studentModelWithPassword.studentModel.level,
                  ),
                ),
              ),
            ),
          ],
        ),
        PasswordTextField(
          password: studentModelWithPassword.password,
        ),
        Row(
          children: [
            Expanded(child: Image.asset(Assets.kLogo)),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Image.asset(
                  '${Assets.path}/${studentModelWithPassword.studentModel.house.toLowerCase()}.png'),
            ),
          ],
        )
      ],
    );
  }
}
