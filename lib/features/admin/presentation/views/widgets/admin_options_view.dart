import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/features/admin/data/models/grid_item_model.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/admin_option_item.dart';

class AdminOptionsView extends StatelessWidget implements PreferredSizeWidget {
  const AdminOptionsView({
    super.key,
  });
  static List<GridItemModel> gridItems = const [
    GridItemModel(icon: FontAwesomeIcons.house, title: 'Manage\nHouses'),
    GridItemModel(icon: FontAwesomeIcons.userGear, title: 'Manage\nUsers'),
    GridItemModel(icon: FontAwesomeIcons.upload, title: 'Upload\nEvent'),
    GridItemModel(
        icon: FontAwesomeIcons.arrowRightFromBracket, title: 'Sign\nOut'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 16,
            );
          },
          itemBuilder: (context, index) {
            return GridItem(
              gridItemModel: gridItems[index],
            );
          },
          itemCount: gridItems.length,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(136);
}
