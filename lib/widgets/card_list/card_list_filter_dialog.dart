import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/model/tileset_filter_model.dart';
import 'package:frontend/router/routing.dart';
import 'package:frontend/services/tileset_service.dart';
import 'package:frontend/theme/buttons.dart';
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
        child: SingleChildScrollView(
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
              SizedBox(height: Spacings.medium),
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
              SizedBox(height: Spacings.medium),
              TextField(
                controller: ratingController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Rating',
                  hint: const Text("Enter a minumum rating..."),
                ),
              ),
              SizedBox(height: Spacings.medium),
              TextField(
                controller: playsController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Plays',
                  hint: const Text("Enter a minimum number of plays..."),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Routing.navigateBack(context, value: filters),
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
