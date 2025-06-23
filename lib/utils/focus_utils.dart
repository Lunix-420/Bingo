import 'package:flutter/cupertino.dart';
import 'package:frontend/widgets/bingo_field/base_field.dart';

BaseTileWidget? getFocusedBaseField() {
  final focus = FocusManager.instance.primaryFocus;
  final widget =
      focus?.context?.findAncestorWidgetOfExactType<BaseTileWidget>();
  return widget;
}
