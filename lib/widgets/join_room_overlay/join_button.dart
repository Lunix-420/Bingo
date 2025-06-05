import 'package:flutter/material.dart';

import '../custom_button.dart';

class JoinButton extends StatelessWidget {

  const JoinButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: Colors.lightGreenAccent,
      label: 'JOIN',
      isWideButton: false,
      onPressed: () {
        // TODO
      },
    );
  }
}