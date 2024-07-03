import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/sheet.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';
import 'package:hogwarts_college_app/features/settings/data/models/admin_model.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/manage_admins/add_admin_sheet.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/manage_admins/admin_item.dart';

class ManageAdminsView extends StatelessWidget {
  const ManageAdminsView({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollViewScaffoldBuilder(
      appBar: CustomAppBar(title: 'Manage Admins', trailing: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.plus),
          color: Colors.white,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => AdminCubit(),
                    child: const AddAdminView(),
                  );
                });
          },
        )
      ]),
      body: Sheet(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('admins').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
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
                          return AdminItem(
                            adminModel: AdminModel(
                              name: snapshot.data!.docs[index]['name'],
                              email: snapshot.data!.docs[index]['email'],
                              password: snapshot.data!.docs[index]['password'],
                              image: snapshot.data!.docs[index]['image'],
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
                }
              })),
    );
  }
}
