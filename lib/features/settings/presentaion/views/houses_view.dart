import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/settings/data/models/path_model.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/manage_students/house_item.dart';

class HousesView extends StatelessWidget {
  const HousesView({super.key});

  static const List<HouseModel> houses = [
    HouseModel(houseName: 'GRY', houseFullName: 'Gryffindor'),
    HouseModel(houseName: 'HUF', houseFullName: 'Hufflepuff'),
    HouseModel(houseName: 'RAV', houseFullName: 'Ravenclaw'),
    HouseModel(houseName: 'SLY', houseFullName: 'Slytherin'),
  ];

  @override
  Widget build(BuildContext context) {
    return NestedScrollViewScaffoldBuilder(
      appBar: const CustomAppBar(
        title: 'Manage Students',
        trailing: [],
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
              itemCount: houses.length,
              itemBuilder: (context, index) {
                return HouseItem(
                  houseModel: houses[index],
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
