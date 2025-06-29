import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/utils/toasts.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/card_edit/card_edit_form.dart';
import 'package:frontend/widgets/future_loader.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:toastification/toastification.dart';

class CardEditView extends StatefulWidget {
  const CardEditView({super.key});

  @override
  State<CardEditView> createState() => _CardEditViewState();
}

class _CardEditViewState extends State<CardEditView> {
  Future<Tileset>? _tilesetFuture;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _tilesetFuture = _loadTileset();
      });
    });
  }

  Future<Tileset> _loadTileset() async {
    return (await TilesetService.getTilesetById(context, doThrow: true))!;
  }

  Future<void> _handleSave(Tileset tileset) async {
    final result = await TilesetService.editTileset(tileset);
    if (result != null) {
      Toast.show(
        "Success",
        "Card saved successfully!",
        ToastificationType.success,
      );
      _navigateBack();
    }
  }

  void _navigateBack() {
    Routing.navigateBack(context);
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Card Create"),
      children: [
        if (_tilesetFuture == null)
          const Center(child: CircularProgressIndicator())
        else
          FutureLoaderWidget(
            future: _tilesetFuture!,
            builder:
                (context, tileset) =>
                    CardEditFormWidget(tileset: tileset, onSave: _handleSave),
          ),
      ],
    );
  }
}
