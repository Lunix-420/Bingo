import 'package:flutter/material.dart';
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
}

class _BaseTileWidgetState extends State<BaseTileWidget> {
  final FocusNode _focusNode = FocusNode();

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
        setState(() {});
      },
      child: GestureDetector(
        onTap: _handleTap,
        onLongPress: widget.onLongPress,
        behavior: HitTestBehavior.translucent,
        child: Tooltip(
          // TODO: check tooltip trigger mode for mobile
          message: widget.tile,
          enableTapToDismiss: true,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // TODO:
              color: Colors.blue[100],
              border: Border.all(
                color:
                    _focusNode.hasFocus ? Colors.blue[900]! : Colors.blue[400]!,
                width: 2,
              ),
              borderRadius: Spacings.roundBorderMedium,
            ),
            padding: Spacings.allMedium,
            child:
                widget.child ??
                Text(
                  widget.tile,
                  style: TextStyles.normal(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
          ),
        ),
      ),
    );
  }
}
