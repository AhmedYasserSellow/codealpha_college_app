import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/settings_list_tile.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/sign_out._sheet.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Sheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Manager',
            style: TextStyle(
              color: PrimaryColors.main,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SettingsListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.manageAdminsView);
            },
            icon: FontAwesomeIcons.usersGear,
            title: 'Manage Admins',
          ),
          SettingsListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.housesView);
            },
            icon: FontAwesomeIcons.users,
            title: 'Manage Students',
          ),
          SettingsListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.manageEventsView);
            },
            icon: FontAwesomeIcons.calendar,
            title: 'Manage Events',
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Sign Out',
            style: TextStyle(
              color: PrimaryColors.main,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SettingsListTile(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const SignOutSheet();
                  });
            },
            icon: FontAwesomeIcons.arrowRightFromBracket,
            title: 'Sign Out',
          ),
        ],
      ),
    );
  }
}
