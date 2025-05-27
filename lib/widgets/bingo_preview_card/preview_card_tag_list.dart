import 'package:flutter/material.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_tag_chip.dart';

class PreviewCardTagListWidget extends StatefulWidget {
  final List<String> tags;

  const PreviewCardTagListWidget({super.key, required this.tags});

  @override
  State<PreviewCardTagListWidget> createState() =>
      _PreviewCardTagListWidgetState();
}

class _PreviewCardTagListWidgetState extends State<PreviewCardTagListWidget> {
  late final ScrollController _tagScrollController;

  @override
  void initState() {
    super.initState();
    _tagScrollController = ScrollController();
  }

  @override
  void dispose() {
    _tagScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tags.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 32,
      child: Scrollbar(
        controller: _tagScrollController,
        thumbVisibility: true,
        child: ListView.separated(
          controller: _tagScrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.tags.length,
          itemBuilder:
              (context, index) =>
                  PreviewCardTagChipWidget(text: widget.tags[index]),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          physics: const ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
