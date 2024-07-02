import 'package:flutter/material.dart';

class ScaffoldBuilder extends StatelessWidget {
  const ScaffoldBuilder({
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

class NestedScrollViewScaffoldBuilder extends StatelessWidget {
  const NestedScrollViewScaffoldBuilder({
    super.key,
    required this.appBar,
    required this.body,
    this.controller,
    this.bottomNavigationBar,
  });
  final Widget appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: NestedScrollView(
            controller: controller,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [appBar];
            },
            body: body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
