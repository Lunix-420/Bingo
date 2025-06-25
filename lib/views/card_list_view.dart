import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/model/create_room_model.dart';
import 'package:frontend/model/tileset_filter_model.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/bingo_preview_card/bingo_preview_card.dart';
import 'package:frontend/widgets/card_list/card_list_filter.dart';
import 'package:frontend/widgets/future_loader.dart';
import 'package:frontend/widgets/view_scaffold.dart';

class CardListView extends StatefulWidget {
  const CardListView({super.key});

  @override
  State<CardListView> createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  TilesetFilterModel _filter = TilesetFilterModel();
  Timer? _debounce;

  void _handleFilterChange(TilesetFilterModel filter) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 750), () {
      setState(() {
        _filter = filter;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  Function(Tileset tileset) _handleCardTap(CreateRoomModel? createRoom) {
    return (Tileset tileset) {
      if (createRoom != null) {
        createRoom.tileset = tileset;
        Navigator.pushNamed(
          context,
          "/create-room",
          arguments: {"create-room": createRoom},
        );
      } else {
        Navigator.pushNamed(
          context,
          "/preview",
          arguments: {"tilesetId": tileset.id},
        );
      }
    };
  }

  Future<List<Tileset>> get _tilesetFuture async =>
      (await TilesetService.getTilesets(_filter, doThrow: true))!;

  @override
  Widget build(BuildContext context) {
    final createRoom = Routing.getCreateRoomModelFromNavigation(context);

    return ViewScaffoldWidget(
      appbar: AppBarWidget(
        title: createRoom != null ? "Select Card" : "Card List",
      ),
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        CardListFilterWidget(
          filter: _filter,
          onFilterChange: _handleFilterChange,
        ),
        SizedBox(height: 32),
        FutureLoaderWidget(
          future: _tilesetFuture,
          builder: (context, tilesets) {
            return ListView.builder(
              itemCount: tilesets.length,
              shrinkWrap: true, // Important for ListView in Column
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent nested scrolling
              itemBuilder: (context, index) {
                final tileset = tilesets[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: BingoPreviewCardWidget(
                    tileset: tileset,
                    onTap: _handleCardTap(createRoom),
                  ),
                );
              },
            );
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
