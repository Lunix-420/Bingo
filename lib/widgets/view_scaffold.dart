import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/vertical_max_list.dart';

class ViewScaffoldWidget extends StatelessWidget {
  final AppBarWidget appbar;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;

  const ViewScaffoldWidget({
    super.key,
    required this.appbar,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.75,
            colors: [Colors.deepPurpleAccent[100]!, Colors.deepPurple[600]!],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: VerticalMaxListWidget(
            mainAxisAlignment: mainAxisAlignment,
            children: children,
          ),
        ),
      ),
    );
  }
}
