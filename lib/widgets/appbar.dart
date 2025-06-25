import 'package:flutter/material.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool disableSettings;
  final bool isHome;
  final List<Widget>? actions;
  final String? routeName;
  final VoidCallback? onBackPressed;

  const AppBarWidget({
    super.key,
    required this.title,
    this.disableSettings = false,
    this.isHome = false,
    this.actions,
    this.routeName,
    this.onBackPressed,
  });

  void _navigateBack(BuildContext context) {
    onBackPressed?.call();
    if (routeName != null) {
      Navigator.pushNamed(context, routeName!);
      return;
    }
    Routing.navigateBack(context);
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
                    foregroundColor: AppColors.getContrastingColor(
                      AppColors.backButtonBackground,
                    ),
                    backgroundColor: AppColors.backButtonBackground,
                  ),
                ),
              ),
      title: Text(
        title,
        style: TextStyles.title(
          color: AppColors.getContrastingColor(AppColors.appBarBackground),
        ),
      ),
      actions: [
        if (actions != null) ...actions!,
        if (!disableSettings)
          Container(
            margin: Spacings.allSmall,
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => _navigateToSettings(context),
              style: IconButton.styleFrom(
                foregroundColor: AppColors.getContrastingColor(
                  AppColors.settingsButtonBackground,
                ),
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
