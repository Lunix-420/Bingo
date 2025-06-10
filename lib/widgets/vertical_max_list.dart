import 'package:flutter/material.dart';

class VerticalMaxListWidget extends StatelessWidget {
  final List<Widget> children;

  const VerticalMaxListWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // or spaceBetween
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            ),
          ),
        );
      },
    );
  }
}
