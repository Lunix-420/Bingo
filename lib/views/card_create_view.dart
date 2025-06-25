import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/card_edit/card_edit_form.dart';
import 'package:frontend/widgets/view_scaffold.dart';

class CardCreateView extends StatefulWidget {
  const CardCreateView({super.key});

  @override
  State<CardCreateView> createState() => _CardCreateViewState();
}

class _CardCreateViewState extends State<CardCreateView> {
  void _handleSave(Tileset tileset) async {
    await TilesetService.createTileset(tileset);
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Card Create"),
      children: [CardEditFormWidget(tileset: Tileset(), onSave: _handleSave)],
    );
  }
}
