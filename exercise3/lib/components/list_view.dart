import 'package:flutter/material.dart';

class StyledListView extends StatelessWidget {
  final List<Widget> children;

  StyledListView({super.key, required List<Widget> children})
    : children = [
        for (int i = 0; i < children.length; i++) ...[
          children[i],
          SizedBox(height: 20),
        ],
      ];

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(20), children: children);
  }
}
