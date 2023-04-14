import 'package:flutter/material.dart';

class Weightwheeltile extends StatelessWidget {
  final String weightstates;
  final Color selectedColor;
  Weightwheeltile(this.selectedColor, this.weightstates, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          weightstates,
          style: TextStyle(
            fontSize: 25,
            color: selectedColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
