import 'package:flutter/material.dart';
import 'package:frontend/theme/buttons.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/widgets/bingo_preview_card/preview_card_tag_list.dart';
import 'package:frontend/widgets/card_edit/tag_input_dialog.dart';

class TagInputWidget extends StatelessWidget {
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

  void _onEditTags(BuildContext context) async {
    final result = await showDialog<List<String>>(
      context: context,
      builder: (context) => TagInputDialogWidget(initialTags: tags),
    );
    if (result != null) {
      onTagsChanged(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Spacings.small,
      children: [
        Expanded(
          child: PreviewCardTagListWidget(tags: tags, size: size),
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => _onEditTags(context),
          style: ButtonStyles.filterIconButton,
        ),
      ],
    );
  }
}
