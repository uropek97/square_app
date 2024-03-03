import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final double size;
  final Color color;
  
  const Square({super.key, this.size = 50, this.color = Colors.purple});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
    );
  }
}