import 'package:flutter/material.dart';
import 'package:hogwarts_college_app/core/widgets/custom_scaffold.dart';
import 'package:hogwarts_college_app/core/widgets/news_feed.dart';
import 'package:hogwarts_college_app/features/admin/presentation/views/widgets/admin_options_view.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});
  static String id = 'admin_view';
  @override
  Widget build(BuildContext context) {
    return const NestedScrollViewScaffoldBuilder(
      appBar: SliverAppBar(
        title: Text(
          'Admin Panel',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        bottom: AdminOptionsView(),
      ),
      body: NewsFeed(),
    );
  }
}
