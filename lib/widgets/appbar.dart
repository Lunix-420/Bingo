import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  final bool disableSettings;
  final bool isHome;
  final List<Widget>? actions;

  const AppbarWidget({
    super.key,
    required this.title,
    required this.disableSettings,
    required this.isHome,
    this.actions,
  });

  void _navigateBack(BuildContext context) {
    Navigator.of(context).maybePop();
  }

  void _navigateToSettings(BuildContext context) {
    Navigator.of(context).pushNamed('/settings');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          isHome
              ? null
              : IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => _navigateBack(context),
              ),
      title: Text(title),
      actions: [
        if (actions != null) ...actions!,
        if (!disableSettings)
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _navigateToSettings(context),
          ),
      ],
    );
  }
}
