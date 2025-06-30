import 'package:flutter/material.dart';
import 'package:frontend/theme/spacings.dart';

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

  List<String> get tags {
    final List<String> tags = List<String>.from(widget.tags);
    tags.insert(0, "${widget.size}x${widget.size}");
    return tags;
  }

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 32,
      child: Scrollbar(
        controller: _tagScrollController,
        thumbVisibility: true,
        child: ListView.separated(
          controller: _tagScrollController,
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) => Chip(label: Text(tags[index])),
          separatorBuilder: (context, index) => SizedBox(width: Spacings.small),
          physics: const ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
