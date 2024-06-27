import 'package:flutter/material.dart';

class PageBuilder extends StatelessWidget {
  const PageBuilder({
    super.key,
    required this.slivers,
    this.bottomNavigationBar,
    this.extendBody = false,
  });
  final List<Widget> slivers;
  final Widget? bottomNavigationBar;
  final bool extendBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: extendBody,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: slivers,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
