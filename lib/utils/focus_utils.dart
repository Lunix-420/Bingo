import 'package:flutter/cupertino.dart';

T? getFocusedElement<T extends Widget>() {
  final focus = FocusManager.instance.primaryFocus;
  final widget = focus?.context?.findAncestorWidgetOfExactType<T>();
  return widget;
}
