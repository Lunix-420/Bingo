import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/vertical_max_list.dart';
import '../../theme/spacings.dart';

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
        decoration: BoxDecoration(gradient: AppColors.background),
        child: Padding(
          padding: Spacings.allMedium,
          child: VerticalMaxListWidget(
            mainAxisAlignment: mainAxisAlignment,
            children: children,
          ),
        ),
      ),
    );
  }
}
