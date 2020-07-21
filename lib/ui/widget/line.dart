import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/7/21 9:41
/// email zdl328465042@163.com
/// description 分割线
class Line extends StatelessWidget {
  final Color color;
  final bool isHor;
  final double width;
  final double height;
  final EdgeInsets margin;

  Line({
    this.color = const Color(0xfff4f4f4),
    this.isHor = true,
    this.width,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (isHor ? double.infinity : 1),
      height: height ?? (isHor ? 1 : double.infinity),
      margin: margin,
      color: color,
    );
  }
}
