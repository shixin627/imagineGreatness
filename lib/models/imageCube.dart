import 'package:flutter/material.dart';

class ImageCube extends StatelessWidget {
  final Widget child;
  final double sideLength;
  ImageCube(this.child, {this.sideLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0), // 預留5pixel
      color: Colors.blue,
      alignment: Alignment.center,
      height: sideLength ?? 100,
      width: sideLength ?? 100,
      child: child,
    );
  }
}
