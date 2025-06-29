import 'package:flutter/material.dart';
import 'package:frontend/theme/decorations.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';

class BaseTileWidget extends StatefulWidget {
  final String tile;
  final Widget? child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const BaseTileWidget({
    super.key,
    required this.tile,
    this.child,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<BaseTileWidget> createState() => _BaseTileWidgetState();

  static Widget baseFieldText(String text) {
    return Text(
      text,
      style: TextStyles.normal(),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}

class _BaseTileWidgetState extends State<BaseTileWidget> {
  final FocusNode _focusNode = FocusNode();
  final GlobalKey<TooltipState> _tooltipKey = GlobalKey<TooltipState>();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onTap != null) widget.onTap!();
    if (!_focusNode.hasFocus) {
      FocusScope.of(context).requestFocus(_focusNode);
    } else {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      onFocusChange: (hasFocus) {
        setState(() {
          if (hasFocus) {
            _tooltipKey.currentState?.ensureTooltipVisible();
          }
        });
      },
      child: GestureDetector(
        onTap: _handleTap,
        onLongPress: widget.onLongPress,
        behavior: HitTestBehavior.translucent,
        child: Tooltip(
          key: _tooltipKey,
          message: widget.tile,
          enableTapToDismiss: true,

          child: Container(
            alignment: Alignment.center,
            decoration: Decorations.bingoTile(_focusNode.hasFocus),
            padding: Spacings.allSmall,
            child: widget.child ?? BaseTileWidget.baseFieldText(widget.tile),
          ),
        ),
      ),
    );
  }
}
