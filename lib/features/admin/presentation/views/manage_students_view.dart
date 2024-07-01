import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/upload_student_data/upload_student_data_cubit.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/add_student_sheet.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/student_item.dart';

class ManageStudentsView extends StatelessWidget {
  const ManageStudentsView({super.key});
  static List<String> houses = [
    'gryffindor',
    'hufflepuff',
    'ravenclaw',
    'slytherin',
  ];
  @override
  Widget build(BuildContext context) {
    return NestedScrollViewScaffoldBuilder(
      appBar: CustomAppBar(
        title: 'Manage Users',
        trailing: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => UploadStudentDataCubit(),
                    child: const AddStudentSheet(),
                  );
                },
              );
            },
            icon: const Icon(FontAwesomeIcons.plus),
            color: Colors.white,
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
            SliverList.separated(
              itemCount: houses.length,
              itemBuilder: (context, index) {
                return HouseItem(
                  title: houses[index],
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
