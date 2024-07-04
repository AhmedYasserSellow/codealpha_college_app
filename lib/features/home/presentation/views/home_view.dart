import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/features/admin/data/models/student_model.dart';
import 'package:hogwarts_college_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:hogwarts_college_app/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:hogwarts_college_app/features/settings/presentaion/views/widgets/sign_out._sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentModelWithPassword studentModelWithPassword =
        ModalRoute.of(context)!.settings.arguments as StudentModelWithPassword;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return NestedScrollViewScaffoldBuilder(
          appBar: CustomAppBar(
              title: 'Welcome',
              trailing: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const SignOutSheet();
                        });
                  },
                  icon: const Icon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    color: Colors.white,
                  ),
                ),
              ],
              leading: null),
          body: context.read<HomeCubit>().screens(
              studentModelWithPassword)[context.read<HomeCubit>().pageIndex],
          bottomNavigationBar: CustomBottomNavBar(
            tabs: context.read<HomeCubit>().tabs,
            selectedIndex: context.read<HomeCubit>().pageIndex,
            onTabChange: (index) {
              context.read<HomeCubit>().changePages(index);
            },
          ),
        );
      },
    );
  }
}
