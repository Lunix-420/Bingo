import 'package:flutter/material.dart';

class TagInputListWidget extends StatefulWidget {
  final List<String> tags;
  final Function(String, int) onTagChange;
  final Function(int) onTagDelete;
  final Function(String) onAddTag;

  const TagInputListWidget({
    super.key,
    required this.tags,
    required this.onTagChange,
    required this.onTagDelete,
    required this.onAddTag,
  });

  @override
  State<TagInputListWidget> createState() => _TagInputListWidgetState();
}

class _TagInputListWidgetState extends State<TagInputListWidget> {
  String _newTag = "";

  Function(String) _handleChange(int index) {
    return (value) => widget.onTagChange(value, index);
  }

  VoidCallback _handleDelete(int index) {
    return () => widget.onTagDelete(index);
  }

  void _handleNewTagChange(String value) {
    setState(() {
      _newTag = value;
    });
  }

  void _handleSubmit(_) {
    _addTag();
  }

  void _addTag() {
    if (_newTag.trim().isEmpty || widget.tags.contains(_newTag)) {
      return;
    }
    widget.onAddTag(_newTag);
    _newTag = "";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ...List.generate(
          widget.tags.length,
          (i) => Row(
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
        Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: true,
                onChanged: _handleNewTagChange,
                onFieldSubmitted: _handleSubmit,
                decoration: const InputDecoration(
                  labelText: 'Add new tag',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(icon: const Icon(Icons.add), onPressed: _addTag),
          ],
        ),
      ],
    );
  }
}
