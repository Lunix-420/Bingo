import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/model/tileset_filter_model.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/spacings.dart';
import 'package:frontend/theme/textstyles.dart';
import 'package:frontend/widgets/card_edit/tag_input_list.dart';

class CardListFilterDialogWidget extends StatefulWidget {
  final TilesetFilterModel initialFilters;

  const CardListFilterDialogWidget({super.key, required this.initialFilters});

  @override
  State<CardListFilterDialogWidget> createState() =>
      _CardListFilterDialogWidgetState();
}

class _CardListFilterDialogWidgetState
    extends State<CardListFilterDialogWidget> {
  late final TilesetFilterModel filters = widget.initialFilters;
  late TextEditingController ratingController = TextEditingController(
    text: filters.rating?.toString() ?? '',
  );
  late TextEditingController playsController = TextEditingController(
    text: filters.plays?.toString() ?? '',
  );

  void _handleTagChange(String value, int index) {
    setState(() {
      filters.tags[index] = value;
    });
  }

  void _handleTagDelete(int index) {
    setState(() {
      filters.tags = List.from(filters.tags)..removeAt(index);
    });
  }

  void _handleAddTag(String value) {
    setState(() {
      filters.tags = List.from(filters.tags)..add(value);
    });
  }

  void _handleSizeChange(int size) {
    setState(() {
      if (filters.size.contains(size)) {
        filters.size = List.from(filters.size)..remove(size);
      } else {
        filters.size = List.from(filters.size)..add(size);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle dialogStyle = TextStyles.normal(
      color: AppColors.getContrastingColor(AppColors.dialogBackground),
    );

    return AlertDialog(
      title: const Center(child: Text("Filter Fields")),
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          spacing: 8,
          children: [
            Text("Tags", style: dialogStyle),
            TagInputListWidget(
              tags: filters.tags,
              onTagChange: _handleTagChange,
              onTagDelete: _handleTagDelete,
              onAddTag: _handleAddTag,
            ),
            const SizedBox(height: Spacings.medium),
            Text("Size", style: dialogStyle),
            Wrap(
              spacing: Spacings.small,
              children:
                  TilesetService.validSizes.map((size) {
                    return ChoiceChip(
                      label: Text(size.toString()),
                      selected: filters.size.contains(size),
                      onSelected: (_) => _handleSizeChange(size),
                    );
                  }).toList(),
            ),
            const SizedBox(height: Spacings.medium),
            TextField(
              controller: ratingController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: 'Rating'),
            ),
            const SizedBox(height: Spacings.medium),
            TextField(
              controller: playsController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: 'Plays'),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(filters),
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
