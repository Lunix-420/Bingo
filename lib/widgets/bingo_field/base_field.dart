import 'package:flutter/material.dart';

class BaseField extends StatefulWidget {
  final String tile;
  final Widget? child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const BaseField({
    super.key,
    required this.tile,
    this.child,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<BaseField> createState() => _BaseFieldState();
}

class _BaseFieldState extends State<BaseField> {
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
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              border: Border.all(
                color:
                    _focusNode.hasFocus ? Colors.blue[900]! : Colors.blue[400]!,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(8),
            child:
                widget.child ??
                Text(
                  widget.tile,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
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
