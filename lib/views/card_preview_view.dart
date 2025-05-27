import 'package:flutter/widgets.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/view_field.dart';
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
  Widget _futureBuilder(context, tileset) {
    logger.i("Building preview for tileset: ${tileset.name}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BingoPreviewCardWidget(
          name: tileset.name,
          tags: tileset.tags,
          likes: tileset.rating.toInt(),
          plays: tileset.plays,
        ),
        const SizedBox(height: 32),
        BingoFieldWidget(
          tiles: tileset.tiles,
          size: tileset.size,
          tileBuilder: ViewFieldWidget.tileBuilder,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Card Preview"),
      children: [
        FutureLoaderWidget<Tileset>(
          future: TilesetService.getTilesetById(context),
          builder: _futureBuilder,
          onError: (error) => logger.e(error),
        ),
        const SizedBox(height: 0), // style only
      ],
    );
  }
}
