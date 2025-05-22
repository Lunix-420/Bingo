import 'package:flutter/material.dart';

class ThemeUtils {
  final BuildContext context;
  final ThemeData theme;

  ThemeUtils(this.context) : theme = Theme.of(context);

  Color getPrimary() {
    return Theme.of(context).colorScheme.primary;
  }
}
