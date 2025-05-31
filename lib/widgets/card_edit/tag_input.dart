import 'package:flutter/material.dart';
import 'package:frontend/widgets/card_edit/tag_input_dialog.dart';

class TagInputWidget extends StatefulWidget {
  final List<String> tags;
  final Function(List<String>) onTagsChanged;

  /// TagInputWidget displays a list of tags as chips and allows editing via a dialog.
  const TagInputWidget({
    super.key,
    required this.tags,
    required this.onTagsChanged,
  });

  @override
  State<TagInputWidget> createState() => _TagInputWidgetState();
}

class _TagInputWidgetState extends State<TagInputWidget> {
  void _onDeleteTag(int index) {
    final newTags = List<String>.from(widget.tags);
    newTags.removeAt(index);
    widget.onTagsChanged(newTags);
  }

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
      children: [
        Expanded(
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: List.generate(
              widget.tags.length,
              (i) => Chip(
                label: Text(widget.tags[i]),
                onDeleted: () => _onDeleteTag(i),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64),
                ),
              ),
            ),
          ),
        ),
        IconButton(icon: const Icon(Icons.edit), onPressed: _onEditTags),
      ],
    );
  }
}
