import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/utils/focus_utils.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/checkable_field.dart';

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
  Tileset? tileset;

  @override
  void initState() {
    super.initState();
    TilesetService.fetchTilesets()
        .then(
          (value) => {
            setState(() {
              tileset = value[0];
            }),
          },
        )
        .catchError(
          (error) => {
            // Handle error here, not importing for the test-view
            // ignore: avoid_print
            print("Error fetching tilesets: $error"),
          },
        );
  }

  void _handleEdit(String text, int index) {
    setState(() {
      tileset!.tiles[index] = text;
    });
  }

  Widget tileBuilder(String tile, int index) {
    // return EditFieldWidget(
    //   tile: tile,
    //   index: index,
    //   onTileChanged: _handleEdit,
    // );
    return CheckableFieldWidget(tile: tile, checked: true);
  }

  void _test() {
    Navigator.pushNamed(
      context,
      "/edit",
      arguments: {"id": "682b303352f8a9a95e7413c2"},
    );
    // final field = getFocusedBaseField();
    // if (field != null) {
    //   print("Found: ${field.tile}");
    // } else {
    //   print("None found");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Testing playground"),
      children: [
        tileset == null
            ? const Text("Loading...")
            : BingoFieldWidget(
              tiles: tileset!.tiles,
              size: tileset!.size,
              tileBuilder: tileBuilder,
            ),
        ElevatedButton(onPressed: _test, child: const Text("Test")),
      ],
    );
  }
}
