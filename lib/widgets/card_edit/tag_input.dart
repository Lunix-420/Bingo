import 'package:flutter/material.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_tag_list.dart';
import 'package:frontend/widgets/card_edit/tag_input_dialog.dart';

class TagInputWidget extends StatefulWidget {
  final List<String> tags;
  final Function(List<String>) onTagsChanged;
  final int size;

  /// TagInputWidget displays a list of tags as chips and allows editing via a dialog.
  const TagInputWidget({
    super.key,
    required this.tags,
    required this.onTagsChanged,
    required this.size,
  });

  @override
  State<TagInputWidget> createState() => _TagInputWidgetState();
}

class _TagInputWidgetState extends State<TagInputWidget> {
  void _onEditTags() async {
    final result = await showDialog<List<String>>(
      context: context,
      builder: (context) => TagInputDialogWidget(initialTags: widget.tags),
    );
    if (result != null) {
      widget.onTagsChanged(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Spacings.small,
      children: [
        Expanded(
          child: PreviewCardTagListWidget(tags: widget.tags, size: widget.size),
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: _onEditTags,
          style: ButtonStyles.filterIconButton,
        ),
      ],
    );
  }
}
