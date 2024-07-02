import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hogwarts_college_app/core/widgets/app_bar.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/features/events/presentation/views/events_view.dart';
import 'package:hogwarts_college_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:hogwarts_college_app/features/home/presentation/views/widgets/bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return NestedScrollViewScaffoldBuilder(
          appBar: CustomAppBar(
            title: 'Welcome',
            trailing: const [
              // IconButton(
              //   onPressed: () {
              //     AuthRepoImpl().signOut(context);
              //   },
              //   icon: const Icon(
              //     FontAwesomeIcons.arrowRightFromBracket,
              //     color: Colors.white,
              //   ),
              // ),
            ],
            leading: state is HomeLoading
                ? const CircularProgressIndicator()
                : IconButton(
                    onPressed: () {
                      // Navigator.pushNamed(
                      //   context,
                      //   AppRouter.studentView,
                      //   arguments: context.read<HomeCubit>().studentModel,
                      // );
                    },
                    icon: const Icon(
                      FontAwesomeIcons.user,
                      color: Colors.white,
                    ),
                  ),
          ),
          body: const EventsView(
            isAdmin: false,
          ),
          bottomNavigationBar: CustomBottomNavBar(
            tabs: const [],
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
