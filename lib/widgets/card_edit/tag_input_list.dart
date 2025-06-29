import 'package:flutter/material.dart';
import 'package:frontend/theme/spacings.dart';

class TagInputListWidget extends StatefulWidget {
  final List<String> tags;
  final Function(String, int) onTagChange;
  final Function(int) onTagDelete;
  final Function(String) onAddTag;
  final bool isScrollable;

  const TagInputListWidget({
    super.key,
    required this.tags,
    required this.onTagChange,
    required this.onTagDelete,
    required this.onAddTag,
    this.isScrollable = false,
  });

  @override
  State<TagInputListWidget> createState() => _TagInputListWidgetState();
}

class _TagInputListWidgetState extends State<TagInputListWidget> {
  final TextEditingController _newTagController = TextEditingController();
  final FocusNode _newTagFocusNode = FocusNode();

  Function(String) _handleChange(int index) {
    return (value) => widget.onTagChange(value, index);
  }

  VoidCallback _handleDelete(int index) {
    return () => widget.onTagDelete(index);
  }

  void _handleSubmit(_) {
    _addTag();
  }

  void _addTag() {
    String newTag = _newTagController.text;
    if (newTag.trim().isEmpty || widget.tags.contains(newTag)) {
      return;
    }
    widget.onAddTag(newTag);
    _newTagController.clear();
    _newTagFocusNode.requestFocus();
  }

  List<Widget> _buildList(BuildContext context) {
    return [
      ...List.generate(
        widget.tags.length,
        (i) => Padding(
          padding: const EdgeInsets.only(bottom: Spacings.medium),
          child: Row(
            spacing: Spacings.medium,
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: _handleChange(i),
                  initialValue: widget.tags[i],
                ),
              ),
              IconButton(
                onPressed: _handleDelete(i),
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: Spacings.medium),
      Row(
        spacing: Spacings.medium,
        children: [
          Expanded(
            child: TextFormField(
              autofocus: true,
              controller: _newTagController,
              onFieldSubmitted: _handleSubmit,
              focusNode: _newTagFocusNode,
              decoration: const InputDecoration(labelText: 'Add new tag'),
            ),
          ),
          IconButton(icon: const Icon(Icons.add), onPressed: _addTag),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return widget.isScrollable
        ? SingleChildScrollView(child: Column(children: _buildList(context)))
        : Column(children: _buildList(context));
  }
}
