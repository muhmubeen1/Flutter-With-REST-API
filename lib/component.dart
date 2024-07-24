// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ReuseableRow extends StatefulWidget {
  String title, value;

  ReuseableRow({super.key, required this.title, required this.value});
  @override
  State<ReuseableRow> createState() => _ReuseableRowState();
}

class _ReuseableRowState extends State<ReuseableRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title),
        const SizedBox(width: 5),
        Text(widget.value),
      ],
    );
  }
}
