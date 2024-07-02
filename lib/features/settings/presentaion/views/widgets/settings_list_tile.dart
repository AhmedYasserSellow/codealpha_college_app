import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/utils/colors.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile(
      {super.key, required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        color: SecondaryColors.main,
      ),
      title: Text(
        title,
      ),
      trailing: const Icon(
        FontAwesomeIcons.angleRight,
        size: 16,
        color: NeutralColors.k100,
      ),
    );
  }
}
