import 'package:flutter/material.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/theme/buttons.dart';
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
          isScrollable: true,
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Routing.navigateBack(context, value: _tags),
          style: ButtonStyles.successButton,
          child: const Text("Save"),
        ),
        ElevatedButton(
          onPressed: () => Routing.navigateBack(context),
          style: ButtonStyles.errorButton,
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}
