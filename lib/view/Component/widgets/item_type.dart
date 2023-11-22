import 'package:flutter/material.dart';
class ItemType extends StatelessWidget {
  ItemType({super.key , required this.text, required this.color});
  final String? text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
         color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text!),
    );
  }
}
