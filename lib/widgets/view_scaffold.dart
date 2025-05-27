import 'package:flutter/material.dart';
import 'package:frontend/widgets/appbar.dart';

class ViewScaffoldWidget extends StatelessWidget {
  final AppBarWidget appbar;
  final List<Widget> children;

  const ViewScaffoldWidget({
    super.key,
    required this.appbar,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // or spaceBetween
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
