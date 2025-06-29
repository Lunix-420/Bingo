import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:toastification/toastification.dart';
import '../../theme/textstyles.dart';

class CodeDisplayWidget extends StatelessWidget {
  final String code;

  const CodeDisplayWidget({super.key, required this.code});

  Future<void> _copyToClipboard() async {
    final data = ClipboardData(text: code);
    await Clipboard.setData(data);
    Toast.show(
      "Success",
      "Successfully copied the room code to clipboard!",
      ToastificationType.success,
    );
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
