import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/7/21 10:58
/// email zdl328465042@163.com
/// description 通用的左右布局信息展示
class ShowInfoRow extends StatelessWidget {
  final String left;
  final Widget leftWidget;
  final String right;
  final Widget rightWidget;
  final int leftFlex;
  final int rightFlex;
  final Color bgColor;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color leftColor;
  final Color rightColor;
  final double leftFontSize;
  final double rightFontSize;
  final FontWeight leftFontWeight;
  final FontWeight rightFontWeight;
  final GestureTapCallback onTap;

  ShowInfoRow({
    this.left,
    this.leftWidget,
    this.right,
    this.rightWidget,
    this.leftFlex = 1,
    this.rightFlex = 2,
    this.bgColor = Colors.transparent,
    this.borderRadius,
    this.padding,
    this.margin,
    this.leftColor = const Color(0xff333333),
    this.rightColor = const Color(0xff666666),
    this.leftFontSize = 14,
    this.rightFontSize = 14,
    this.leftFontWeight = FontWeight.w600,
    this.rightFontWeight = FontWeight.normal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget view = Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius,
      ),
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: leftFlex,
            child: leftWidget ??
                Text(
                  left,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: leftColor,
                    fontSize: leftFontSize,
                    fontWeight: leftFontWeight,
                  ),
                ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: rightFlex,
            child: rightWidget ??
                Text(
                  right,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: rightColor,
                    fontSize: rightFontSize,
                    fontWeight: rightFontWeight,
                  ),
                ),
          ),
        ],
      ),
    );
    Widget child;
    if (null == onTap) {
      child = view;
    } else {
      child = InkWell(
        onTap: onTap,
        child: view,
      );
    }
    return child;
  }
}
