import 'package:flutter/widgets.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_field/bingo_field.dart';
import 'package:frontend/widgets/bingo_field/view_field.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/view_scaffold.dart';
import 'package:frontend/utils/named_logger.dart';

final logger = namedLogger("Card-Preview-View");

class CardPreviewView extends StatefulWidget {
  const CardPreviewView({super.key});

  @override
  State<CardPreviewView> createState() => _CardPreviewViewState();
}

class _CardPreviewViewState extends State<CardPreviewView> {
  Tileset? tileset;
  String? error;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getTileset();
    });
  }

  void _getTileset() {
    TilesetService.getTilesetById(context)
        .then((value) {
          logger.i("Got tileset: ${value.name}");
          setState(() {
            tileset = value;
          });
        })
        .catchError((error, stackTrace) {
          logger.e(error, stackTrace: stackTrace);
          setState(() {
            this.error = "There was an error fetching the Bingo Field.";
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Card Preview"),
      children: [
        BingoPreviewCardWidget(),
        tileset != null
            ? BingoFieldWidget(
              tiles: tileset!.tiles,
              size: tileset!.size,
              tileBuilder: ViewFieldWidget.tileBuilder,
            )
            : const Text("Loading..."),
      ],
    );
  }
}
