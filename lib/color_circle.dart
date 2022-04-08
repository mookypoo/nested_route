import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({Key? key, required this.color, this.onTap}) : super(key: key);
  final Color color;
  final void Function(Color color)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap != null ? () => this.onTap!(this.color) : null,
      child: Container(
        margin: const EdgeInsets.only(right: 22.0),
        height: 28.0,
        width: 28.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: this.color,
        ),
      ),
    );
  }
}