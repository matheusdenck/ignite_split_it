import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import 'create_split/step_input_text_widget.dart';

class StepMultiInputText extends StatelessWidget {
  final int count;
  // final Function(String value) itemName;
  // final Function(String value) itemValue;
  final ValueChanged<String> itemName;
  final ValueChanged<double> itemValue;
  final bool isRemovable;

  StepMultiInputText({
    Key? key,
    required this.count,
    required this.itemName,
    required this.itemValue,
    this.isRemovable = false,
  }) : super(key: key);
  final valueInputTextController = MoneyMaskedTextController(
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
            child: Text('$count'),
          ),
          Expanded(
            flex: 3,
            child: StepInputTextWidget(
              hintText: 'Ex: Picanha',
              padding: EdgeInsets.zero,
              onChange: (value) {
                itemName(value);
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
                itemValue(valueInputTextController.numberValue);
              },
              align: TextAlign.start,
            ),
          ),
          if (isRemovable)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            )
        ],
      ),
    );
  }
}
