import 'package:flutter/material.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';

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
              (context, index) => Chip(
                label: Text(
                  _tags[index],
                  style: TextStyles.small(color: Colors.white),
                ),
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: Spacings.roundBorderExtraLarge,
                  side: BorderSide(width: 0, color: Colors.transparent),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          physics: const ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
