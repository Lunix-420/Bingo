import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool disableSettings;
  final bool isHome;
  final List<Widget>? actions;

  const AppBarWidget({
    super.key,
    required this.title,
    this.disableSettings = false,
    this.isHome = false,
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
      backgroundColor: Colors.deepPurpleAccent[400],
      centerTitle: true,
      leading:
          isHome
              ? null
              : Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => _navigateBack(context),
                  splashRadius: 24,
                ),
              ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        if (actions != null) ...actions!,
        if (!disableSettings)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.black),
              onPressed: () => _navigateToSettings(context),
              splashRadius: 24,
            ),
          ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
