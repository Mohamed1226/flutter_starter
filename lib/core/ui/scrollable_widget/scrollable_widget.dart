import 'package:flutter/material.dart';

class ScrollableWidget extends StatelessWidget {
   ScrollableWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            child: child
        )
      ],
    );
  }
}
