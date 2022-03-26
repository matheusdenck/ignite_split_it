import 'package:flutter/material.dart';

class PersonTileWidget extends StatelessWidget {
  final String name;
  final bool isRemovable;
  final VoidCallback onPressed;
  const PersonTileWidget({
    Key? key,
    required this.name,
    this.isRemovable = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
        ),
        title: Text(name),
        trailing: IconButton(
          icon: isRemovable ? Icon(Icons.remove) : Icon(Icons.add),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
