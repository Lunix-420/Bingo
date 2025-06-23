import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool disableSettings;
  final bool isHome;
  final List<Widget>? actions;
  final String? routeName;

  const AppBarWidget({
    super.key,
    required this.title,
    this.disableSettings = false,
    this.isHome = false,
    this.actions,
    this.routeName,
  });

  void _navigateBack(BuildContext context) {
    if (routeName != null) {
      Navigator.of(context).pushNamed(routeName!);
      return;
    }
    Navigator.of(context).maybePop();
  }

  void _navigateToSettings(BuildContext context) {
    // Navigator.of(context).pushNamed('/settings');
    // TODO: implement
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarBackground,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading:
          isHome
              ? null
              : Container(
                margin: Spacings.allSmall,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  tooltip: 'Back',
                  onPressed: () => _navigateBack(context),
                  style: IconButton.styleFrom(
                    foregroundColor: AppColors.backButtonForeground,
                    backgroundColor: AppColors.backButtonBackground,
                  ),
                ),
              ),
      title: Text(title, style: TextStyles.title(color: Colors.white)),
      actions: [
        if (actions != null) ...actions!,
        if (!disableSettings)
          Container(
            margin: Spacings.allSmall,
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => _navigateToSettings(context),
              style: IconButton.styleFrom(
                foregroundColor: AppColors.settingsButtonForeground,
                backgroundColor: AppColors.settingsButtonBackground,
              ),
            ),
          ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
