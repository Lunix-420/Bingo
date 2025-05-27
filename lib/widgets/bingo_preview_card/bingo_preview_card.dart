import 'package:flutter/material.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_icon_indicator.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_row.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_tag_list.dart';

class BingoPreviewCardWidget extends StatelessWidget {
  final String name;
  final List<String> tags;
  final int? likes;
  final int? plays;

  const BingoPreviewCardWidget({
    super.key,
    required this.name,
    required this.tags,
    this.likes,
    this.plays,
  });

  Widget? _likesWidget() {
    if (likes == null) return null;
    return PreviewCardIconIndicatorWidget(
      icon: Icons.star_rounded,
      iconColor: Colors.yellow[700]!,
      count: likes!,
    );
  }

  Widget? _playsWidget() {
    if (plays == null) return null;
    return PreviewCardIconIndicatorWidget(
      icon: Icons.play_arrow_rounded,
      iconColor: Colors.red,
      count: plays!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
                name,
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
              expandedChild: PreviewCardTagListWidget(tags: tags),
              trailingChild: _playsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
