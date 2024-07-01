import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/admin/data/models/path_model.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/level_item.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/manage_users_app_bar.dart';

class LevelsView extends StatelessWidget {
  const LevelsView({super.key});
  static List<String> levels = [
    '000',
    '100',
    '200',
    '300',
  ];
  @override
  Widget build(BuildContext context) {
    final HouseModel houseModel =
        ModalRoute.of(context)!.settings.arguments as HouseModel;
    return NestedScrollViewScaffoldBuilder(
      appBar: ManageUsersAppBar(
        title: '${houseModel.houseFullName} House Levels',
      ),
      body: Sheet(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverList.separated(
              itemCount: 4,
              itemBuilder: (context, index) {
                return LevelItem(
                  pathModel: PathModel(
                    houseModel: houseModel,
                    level: levels[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
