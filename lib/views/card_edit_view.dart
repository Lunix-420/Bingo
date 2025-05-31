import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/card_edit/card_edit_form.dart';
import 'package:frontend/widgets/future_loader.dart';
import 'package:frontend/widgets/view_scaffold.dart';

class CardEditView extends StatefulWidget {
  const CardEditView({super.key});

  @override
  State<CardEditView> createState() => _CardEditViewState();
}

class _CardEditViewState extends State<CardEditView> {
  void _handleSave(Tileset tileset) {
    TilesetService.editTileset(tileset);
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Card Create"),
      children: [
        FutureLoaderWidget(
          future: TilesetService.getTilesetById(context),
          builder:
              (context, tileset) =>
                  CardEditFormWidget(tileset: tileset, onSave: _handleSave),
        ),
      ],
    );
  }
}
