import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/view_tile.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/future_loader.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:frontend/utils/named_logger.dart';

final logger = namedLogger("Card-Preview-View");

class CardPreviewView extends StatefulWidget {
  const CardPreviewView({super.key});

  @override
  State<CardPreviewView> createState() => _CardPreviewViewState();
}

class _CardPreviewViewState extends State<CardPreviewView> {
  late Future<Tileset> future;
  Tileset? tileset;

  Widget _futureBuilder(context, tileset) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: Spacings.large,
      children: [
        BingoPreviewCardWidget(tileset: tileset),
        BingoFieldWidget(
          tiles: tileset.tiles,
          size: tileset.size,
          tileBuilder: ViewTileWidget.tileBuilder,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      future = _tilesetFuture;
      future.then((tileset) {
        setState(() {
          this.tileset = tileset;
        });
      });
    });
  }

  void navigateToEdit() {
    if (tileset == null) {
      logger.w("Tileset is null, cannot navigate to edit.");
      return;
    }
    Routing.navigateCardEdit(context, tileset!.id);
  }

  Future<Tileset> get _tilesetFuture async =>
      (await TilesetService.getTilesetById(context, doThrow: true))!;

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Card Preview"),
      children: [
        FutureLoaderWidget<Tileset>(
          future: _tilesetFuture,
          builder: _futureBuilder,
          onError: (error) => logger.e(error),
        ),
        ElevatedButton(
          onPressed: tileset != null ? navigateToEdit : null,
          style: ButtonStyles.successButton,
          child:
              tileset != null
                  ? const Text("Edit Card")
                  : const Text("Loading..."),
        ),
      ],
    );
  }
}
