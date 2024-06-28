import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/utils/routes.dart';
import 'package:hogwarts_college_app/features/admin/data/models/grid_item_model.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/admin_option_item.dart';
import 'package:hogwarts_college_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';

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
  static List<String> navigatorRoutes = [
    AppRouter.housesView,
    AppRouter.studentsView,
    AppRouter.eventsView,
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
              onTap: () {
                if (index == 3) {
                  context.read<AuthCubit>().signOut(context);
                } else {
                  Navigator.pushNamed(context, navigatorRoutes[index]);
                }
              },
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
