import 'package:flutter/material.dart';
import 'package:frontend/model/tileset_model.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_icon_indicator.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_row.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_tag_list.dart';

class BingoPreviewCardWidget extends StatelessWidget {
  final Tileset tileset;
  final bool decorators;
  final Function(Tileset tileset)? onTap;

  const BingoPreviewCardWidget({
    super.key,
    required this.tileset,
    this.decorators = true,
    this.onTap,
  });

  Widget? _likesWidget() {
    if (!decorators) return null;
    return PreviewCardIconIndicatorWidget(
      icon: Icons.star_rounded,
      iconColor: Colors.yellow[700]!,
      count: tileset.rating,
    );
  }

  Widget? _playsWidget() {
    if (!decorators) return null;
    return PreviewCardIconIndicatorWidget(
      icon: Icons.play_arrow_rounded,
      iconColor: Colors.red,
      count: tileset.plays,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        cursor: onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
        child: GestureDetector(
          onTap: onTap != null ? () => onTap!(tileset) : null,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 4,
              ),
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PreviewCardRowWidget(
                  expandedChild: Text(
                    tileset.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailingChild: _likesWidget(),
                ),
                const SizedBox(height: 16),
                PreviewCardRowWidget(
                  expandedChild: PreviewCardTagListWidget(
                    tags: tileset.tags,
                    size: tileset.size,
                  ),
                  trailingChild: _playsWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
