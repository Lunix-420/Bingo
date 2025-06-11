import 'package:flutter/material.dart';

class VerticalMaxListWidget extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;

  const VerticalMaxListWidget({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: mainAxisAlignment,
                children: [
                  ...children,
                  // invisible spacer to fill remaining space if needed
                  SizedBox(height: 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
