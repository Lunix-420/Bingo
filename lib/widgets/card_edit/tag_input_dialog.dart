import 'package:flutter/material.dart';
import 'package:frontend/widgets/card_edit/tag_input_list.dart';

/// Dialog for editing tags. Handles its own state and controllers.
class TagInputDialogWidget extends StatefulWidget {
  final List<String> initialTags;
  const TagInputDialogWidget({super.key, required this.initialTags});

  @override
  State<TagInputDialogWidget> createState() => _TagInputDialogWidgetState();
}

class _TagInputDialogWidgetState extends State<TagInputDialogWidget> {
  late List<String> _tags;

  @override
  void initState() {
    super.initState();
    _tags = List<String>.from(widget.initialTags);
  }

  void _handleTagChange(String value, int index) {
    setState(() {
      _tags[index] = value;
    });
  }

  void _handleTagDelete(int index) {
    setState(() {
      _tags.removeAt(index);
    });
  }

  void _handleAddTag(String value) {
    setState(() {
      _tags.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Edit Tags")),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: TagInputListWidget(
          tags: _tags,
          onTagChange: _handleTagChange,
          onTagDelete: _handleTagDelete,
          onAddTag: _handleAddTag,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(_tags),
          child: const Text("Save"),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
