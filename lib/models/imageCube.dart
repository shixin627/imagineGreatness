import 'package:flutter/material.dart';

class ImageCube extends StatelessWidget {
  final Widget child;
  final double sideLength;
  ImageCube(this.child, {this.sideLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.grey,
      alignment: Alignment.center,
      height: sideLength ?? 100,
      width: sideLength ?? 100,
      child: child,
    );
  }
}
