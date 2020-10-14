import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/10/14 15:51
/// email zdl328465042@163.com
/// description 虚线
class DashedLine extends StatelessWidget {
  final Color color;
  final double dashedWidth;
  final double dashedHeight;
  final double dashedGap;
  final double rootWidth;
  final EdgeInsets margin;

  DashedLine({
    this.color = const Color(0xfff4f4f4),
    this.dashedWidth = 3,
    this.dashedHeight = 1,
    this.dashedGap = 3,
    this.rootWidth,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: CustomPaint(
        size: Size(rootWidth ?? double.infinity, dashedHeight),
        painter: DashedPainter(color, dashedWidth, dashedHeight, dashedGap),
      ),
    );
  }
}

class DashedPainter extends CustomPainter {
  final Color color;
  final double dashedWidth;
  final double dashedHeight;
  final double dashedGap;

  DashedPainter(
    this.color,
    this.dashedWidth,
    this.dashedHeight,
    this.dashedGap,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..isAntiAlias = true
      ..strokeWidth = dashedHeight;
    double maxWidth = size.width;
    double startX = 0;
    final double space = dashedWidth + dashedGap;
    while (startX < maxWidth) {
      canvas.drawLine(
          Offset(startX, 0), Offset(startX + dashedWidth, 0), paint);
      startX += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
