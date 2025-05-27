import 'package:flutter/material.dart';

class PreviewCardTagListWidget extends StatelessWidget {
  final List<String> tags;

  const PreviewCardTagListWidget({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    final ScrollController tagScrollController = ScrollController();
    return SizedBox(
      height: 32,
      child: Scrollbar(
        controller: tagScrollController,
        thumbVisibility: true,
        child: ListView.separated(
          controller: tagScrollController,
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder:
              (context, index) => Chip(
                label: Text(
                  tags[index],
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.deepPurple,
              ),
          separatorBuilder: (context, index) => const SizedBox(width: 8),
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
