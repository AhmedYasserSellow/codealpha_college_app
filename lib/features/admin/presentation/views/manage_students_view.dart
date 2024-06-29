import 'package:cloud_firestore/cloud_firestore.dart';
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
        child: FutureBuilder(
            future: FirebaseFirestore.instance.collection('students').get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    SliverList.separated(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return StudentItem(
                          snapshot: snapshot.data!.docs[index],
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
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
