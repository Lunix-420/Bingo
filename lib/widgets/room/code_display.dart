import 'package:flutter/material.dart';
import '../../theme/decorations.dart';
import '../../theme/textstyles.dart';
import '../../theme/spacings.dart';

class CodeDisplayWidget extends StatelessWidget {
  final String code;

  const CodeDisplayWidget({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Spacings.medium,
        horizontal: Spacings.extraLarge,
      ),
      decoration: Decorations.codeDisplay,
      child: Text(code, style: TextStyles.normal()),
    );
  }
}
