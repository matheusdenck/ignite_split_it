import 'package:flutter/material.dart';
import 'package:split_it/shared/utils/formatters.dart';

import '../../data/models/item_model.dart';

class ItemTileWidget extends StatelessWidget {
  final ItemModel model;

  const ItemTileWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.name),
      trailing: Text(
        model.value.reais(),
      ),
    );
  }
}
