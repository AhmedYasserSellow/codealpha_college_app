import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/house_item.dart';

class HousesView extends StatelessWidget {
  const HousesView({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollViewScaffoldBuilder(
      appBar: CustomAppBar(
        title: 'Manage Houses',
        trailing: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
            ),
          ),
        ],
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
            SliverList.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return const HouseItem();
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
