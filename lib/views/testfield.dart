import 'package:flutter/material.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/room/code_display.dart';
import 'package:frontend/widgets/room/room_settings_display.dart';
import 'package:frontend/widgets/score/scoreboard.dart';

/*
  This is only a component for testing other components. It does not have to be in good
  style or anything and will later be removed.
*/
import 'package:frontend/widgets/view_scaffold.dart';

class TestFieldView extends StatefulWidget {
  const TestFieldView({super.key});

  @override
  State<TestFieldView> createState() => _TestFieldViewState();
}

class _TestFieldViewState extends State<TestFieldView> {
  Room room = Room();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Testing playground"),
      children: [RoomSettingsDisplayWidget(room: room)],
    );
  }
}
