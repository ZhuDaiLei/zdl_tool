import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/7/21 10:58
/// email zdl328465042@163.com
/// description 通用的左右布局信息展示
class ShowInfoRow extends StatelessWidget {
  final String left;
  final String right;
  final int leftFlex;
  final int rightFlex;
  final Color bgColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color leftColor;
  final Color rightColor;
  final double fontSize;
  final FontWeight leftFontWeight;
  final FontWeight rightFontWeight;

  ShowInfoRow({
    this.left,
    this.right,
    this.leftFlex = 1,
    this.rightFlex = 2,
    this.bgColor = Colors.transparent,
    this.padding,
    this.margin,
    this.leftColor = const Color(0xff333333),
    this.rightColor = const Color(0xff666666),
    this.fontSize = 14,
    this.leftFontWeight = FontWeight.w600,
    this.rightFontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: padding,
      margin: margin,
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: leftFlex,
            child: Text(
              left,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: leftColor,
                fontSize: fontSize,
                fontWeight: leftFontWeight,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: rightFlex,
            child: Text(
              right,
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: rightColor,
                fontSize: fontSize,
                fontWeight: rightFontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
