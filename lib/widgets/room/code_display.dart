import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/theme/colors.dart';
import '../../theme/textstyles.dart';

class CodeDisplayWidget extends StatelessWidget {
  final String code;

  const CodeDisplayWidget({super.key, required this.code});

  void _copyToClipboard() {
    final data = ClipboardData(text: code);
    Clipboard.setData(data);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _copyToClipboard,
      style: ButtonStyles.roomCodeButton,
      child: Text(
        code,
        style: TextStyles.normal(
          color: AppColors.getContrastingColor(AppColors.primary),
        ),
      ),
    );
  }
}
