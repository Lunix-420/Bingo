import 'package:flutter/material.dart';
import 'package:frontend/model/tileset.model.dart';
import 'package:frontend/services/tileset.service.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/view_field.dart';

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

  Widget render(String tile, _) {
    return ViewField(tile: tile);
  }

  @override
  Widget build(BuildContext context) {
    return tileset == null
        ? Text("Loading...")
        : BingoField(data: tileset!, render: render);
  }
}
