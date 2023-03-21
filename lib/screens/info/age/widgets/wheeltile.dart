import 'package:flutter/material.dart';

class wheeltile extends StatelessWidget {
  final String states;
  final Color selectedColor;
  wheeltile(this.selectedColor, this.states, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          states,
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
