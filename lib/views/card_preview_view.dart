import 'dart:math';

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
  Future<Tileset> _fetchTileset(BuildContext context) async {
    // sleep for 5 seconds, then with a 50/50 chance return a tileset or throw an error
    try {
      final result = await TilesetService.getTilesetById(context);
      await Future.delayed(const Duration(seconds: 2));
      if (Random().nextBool()) {
        throw Exception("Random error occurred while fetching tileset");
      }
      return result;
    } catch (e) {
      logger.e("Error fetching tileset: $e");
      throw Exception("Failed to load tileset");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Card Preview"),
      children: [
        BingoPreviewCardWidget(),
        FutureLoaderWidget<Tileset>(
          future: _fetchTileset(context),
          builder:
              (context, tileset) => BingoFieldWidget(
                tiles: tileset.tiles,
                size: tileset.size,
                tileBuilder: ViewFieldWidget.tileBuilder,
              ),
        ),
      ],
    );
  }
}
