import 'package:flutter/material.dart';
import 'create_card_button.dart';
import 'create_room_button.dart';
import 'join_room_button.dart';
import 'view_cards_button.dart';

class Menu extends StatelessWidget {
  final Animation<double> animation;

  const Menu({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ScaleTransition(
        scale: animation,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...[
                  CreateRoomButton(),
                  JoinRoomButton(),
                  CreateCardButton(),
                  ViewCardsButton(),
                ].map((button) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: button,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}