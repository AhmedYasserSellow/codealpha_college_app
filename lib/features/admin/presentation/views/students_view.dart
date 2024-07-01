import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/admin/data/models/path_model.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/manage_users_app_bar.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/student_item.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final PathModel pathModel =
        ModalRoute.of(context)!.settings.arguments as PathModel;
    return NestedScrollViewScaffoldBuilder(
      appBar: ManageUsersAppBar(
        title:
            '${pathModel.houseModel.houseFullName} Level ${pathModel.level} Students',
      ),
      body: Sheet(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(pathModel.houseModel.houseName)
              .doc('students')
              .collection(pathModel.level)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomScrollView(
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
                      studentModelWithPassword: StudentModelWithPassword(
                        password: snapshot.data!.docs[index]['password'],
                        studentModel: StudentModel(
                          name: snapshot.data!.docs[index]['name'],
                          phone: snapshot.data!.docs[index]['phone'],
                          house: pathModel.houseModel.houseName,
                          level: pathModel.level,
                          image: snapshot.data!.docs[index]['image'],
                        ),
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
            );
          },
        ),
      ),
    );
  }
}
