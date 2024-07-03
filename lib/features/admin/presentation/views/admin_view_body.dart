import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/utils/assets.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/core/widgets/text_field.dart';
import 'package:hogwarts_college_app/features/settings/data/models/admin_model.dart';

class AdminViewBody extends StatelessWidget {
  const AdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminModel adminModel =
        ModalRoute.of(context)!.settings.arguments as AdminModel;
    return Sheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Welcome to Hogwarts School',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: PrimaryColors.main,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            Assets.kLogo,
            width: MediaQuery.sizeOf(context).width / 2,
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      adminModel.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  children: [
                    CustomTextField(
                      title: 'First Name',
                      icon: FontAwesomeIcons.user,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: adminModel.name.split(' ')[0])),
                      readOnly: true,
                    ),
                    CustomTextField(
                      title: 'Last Name',
                      icon: FontAwesomeIcons.user,
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: adminModel.name.split(' ')[1])),
                      readOnly: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  title: 'Username',
                  icon: FontAwesomeIcons.idCard,
                  controller: TextEditingController.fromValue(
                    TextEditingValue(text: adminModel.email.split('@')[0]),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                '@hogwarts.std',
                style: TextStyle(color: NeutralColors.k500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
