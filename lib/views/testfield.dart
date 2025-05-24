import 'package:flutter/material.dart';
import 'package:frontend/model/tileset.model.dart';
import 'package:frontend/services/tileset.service.dart';
import 'package:frontend/utils/focus.utils.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/edit_field.dart';

/*
  This is only a component for testing other components. It does not have to be in good
  style or anything and will later be removed.
*/

class TestfieldView extends StatefulWidget {
  const TestfieldView({super.key});

  @override
  State<TestfieldView> createState() => _TestfieldViewState();
}

class _TestfieldViewState extends State<TestfieldView> {
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

  Widget render(String tile, int index) {
    return EditFieldWidget(
      tile: tile,
      index: index,
      onTileChanged: _handleEdit,
    );
  }

  void _test() {
    final field = getFocusedBaseField();
    if (field != null) {
      print("Found: ${field.tile}");
    } else {
      print("None found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        tileset == null
            ? Text("Loading...")
            : BingoFieldWidget(
              tiles: tileset!.tiles,
              size: tileset!.size,
              render: render,
            ),
        ElevatedButton(onPressed: _test, child: Text("Test")),
      ],
    );
  }
}
