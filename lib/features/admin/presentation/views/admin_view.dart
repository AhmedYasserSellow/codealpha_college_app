import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/features/admin/presentation/view_models/admin_cubit/admin_cubit.dart';
import 'package:hogwarts_college_app/features/home/presentation/views/widgets/bottom_nav_bar.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return NestedScrollViewScaffoldBuilder(
          appBar: const CustomAppBar(
            title: 'Admin Panel',
            leading: null,
            trailing: [],
          ),
          body: context
              .read<AdminCubit>()
              .adminPages[context.read<AdminCubit>().currentPage],
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: context.read<AdminCubit>().currentPage,
            onTabChange: (index) {
              context.read<AdminCubit>().changePage(index);
            },
            tabs: context.read<AdminCubit>().tabs,
          ),
        );
      },
    );
  }
}
