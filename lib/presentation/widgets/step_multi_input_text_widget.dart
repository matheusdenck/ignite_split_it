import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'create_split/step_input_text_widget.dart';

class StepMultiInputText extends StatefulWidget {
  final int count;
  final String? initialName;
  final double? initialValue;
  final ValueChanged<String> itemName;
  final ValueChanged<double> itemValue;
  final VoidCallback? onDelete;
  final bool isRemovable;

  StepMultiInputText({
    Key? key,
    required this.count,
    required this.itemName,
    required this.itemValue,
    this.isRemovable = false,
    this.initialName,
    this.initialValue,
    this.onDelete,
  }) : super(key: key);

  @override
  State<StepMultiInputText> createState() => _StepMultiInputTextState();
}

class _StepMultiInputTextState extends State<StepMultiInputText> {
  late MoneyMaskedTextController valueInputTextController =
      MoneyMaskedTextController(
    initialValue: widget.initialValue ?? 0.0,
    leftSymbol: "R\$",
    decimalSeparator: ',',
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text('${widget.count}'),
          ),
          Expanded(
            flex: 3,
            child: StepInputTextWidget(
              initialValue: widget.initialName,
              hintText: 'Ex: Picanha',
              padding: EdgeInsets.zero,
              onChange: (value) {
                widget.itemName(value);
              },
              align: TextAlign.start,
            ),
          ),
          Expanded(
            child: StepInputTextWidget(
              textEditingController: valueInputTextController,
              textInputType: TextInputType.number,
              hintText: 'R\$0,00',
              padding: EdgeInsets.zero,
              onChange: (value) {
                widget.itemValue(valueInputTextController.numberValue);
              },
              align: TextAlign.start,
            ),
          ),
          if (widget.isRemovable)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                if (widget.onDelete != null) {
                  widget.onDelete!();
                }
              },
            )
        ],
      ),
    );
  }
}
