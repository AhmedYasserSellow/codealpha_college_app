import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
          appBar:
              const CustomAppBar(title: 'Welcome', trailing: [], leading: null),
          body: const EventsView(
            isAdmin: false,
          ),
          bottomNavigationBar: CustomBottomNavBar(
            tabs: const [
              GButton(
                text: 'Events',
                icon: FontAwesomeIcons.calendar,
              ),
              GButton(
                text: 'Schedule',
                icon: FontAwesomeIcons.clock,
              ),
              GButton(icon: FontAwesomeIcons.user, text: 'Profile'),
            ],
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
