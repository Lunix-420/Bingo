import 'package:flutter/material.dart';

class PreviewCardTagListWidget extends StatefulWidget {
  final List<String> tags;
  final int size;

  const PreviewCardTagListWidget({
    super.key,
    required this.tags,
    required this.size,
  });

  @override
  State<PreviewCardTagListWidget> createState() =>
      _PreviewCardTagListWidgetState();
}

class _PreviewCardTagListWidgetState extends State<PreviewCardTagListWidget> {
  late final ScrollController _tagScrollController;
  late final List<String> _tags;

  @override
  void initState() {
    super.initState();
    _tagScrollController = ScrollController();
    _tags = List<String>.from(widget.tags);
    _tags.insert(0, "${widget.size}x${widget.size}");
  }

  @override
  void dispose() {
    _tagScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_tags.isEmpty) return const SizedBox.shrink();
    return SizedBox(
      height: 32,
      child: Scrollbar(
        controller: _tagScrollController,
        thumbVisibility: true,
        child: ListView.separated(
          controller: _tagScrollController,
          scrollDirection: Axis.horizontal,
          itemCount: _tags.length,
          itemBuilder:
              (context, index) =>
              // PreviewCardTagChipWidget(text: widget.tags[index]),
              Chip(
                label: Text(
                  _tags[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: BorderSide(width: 0, color: Colors.transparent),
                ),
                shadowColor: Colors.transparent,
                visualDensity: VisualDensity.compact,
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          physics: const ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
