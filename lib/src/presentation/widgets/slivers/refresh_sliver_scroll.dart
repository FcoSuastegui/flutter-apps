import 'package:flutter/material.dart';

class RefreshSliverScrollView extends StatelessWidget {
  final VoidCallback? onRefresh;
  final List<Widget> slivers;
  final ScrollController? controller;
  final bool reverse;
  final ScrollPhysics? physics;

  const RefreshSliverScrollView({
    Key? key,
    this.onRefresh,
    this.slivers = const <Widget>[],
    this.controller,
    this.reverse = false,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      strokeWidth: 1.0,
      onRefresh: () => Future.sync(onRefresh ?? () {}),
      child: CustomScrollView(
        physics: physics,
        reverse: reverse,
        controller: controller,
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 0)),
          ...slivers,
        ],
      ),
    );
  }
}
