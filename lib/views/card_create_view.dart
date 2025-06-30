import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/card_edit/card_edit_form.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:toastification/toastification.dart';

class CardCreateView extends StatefulWidget {
  const CardCreateView({super.key});

  @override
  State<CardCreateView> createState() => _CardCreateViewState();
}

class _CardCreateViewState extends State<CardCreateView> {
  Future<void> _handleSave(Tileset tileset) async {
    final result = await TilesetService.createTileset(tileset);
    if (result == null) {
      Toast.show(
        "Error",
        "Failed to create Bingocard",
        ToastificationType.error,
      );
      return;
    }
    Toast.show(
      "Success",
      "Successfully created Bingocard ${result.name}",
      ToastificationType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Card Create"),
      children: [CardEditFormWidget(tileset: Tileset(), onSave: _handleSave)],
    );
  }
}
