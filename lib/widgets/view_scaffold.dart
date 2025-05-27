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
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: scrollController,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
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
        ),
      ),
    );
  }
}
