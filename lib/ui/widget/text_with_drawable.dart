import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/7/22 9:49
/// email zdl328465042@163.com
/// description 文字四周的图片，目前仅支持左右、上下
class TextWithDrawable extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Widget drawableStart;
  final Widget drawableTop;
  final Widget drawableEnd;
  final Widget drawableBottom;
  final double drawableStartPadding;
  final double drawableTopPadding;
  final double drawableEndPadding;
  final double drawableBottomPadding;
  final double drawablePadding;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final int maxLines;

  TextWithDrawable({
    this.text = '',
    this.fontColor = const Color(0xff666666),
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.drawableStart,
    this.drawableTop,
    this.drawableEnd,
    this.drawableBottom,
    this.drawableStartPadding,
    this.drawableTopPadding,
    this.drawableEndPadding,
    this.drawableBottomPadding,
    this.drawablePadding = 0,
    this.padding,
    this.margin,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    bool onlyRow = (null != drawableStart || null != drawableEnd) &&
        (null == drawableTop && null == drawableBottom);
    bool onlyColumn = (null != drawableTop || null != drawableBottom) &&
        (null == drawableStart && null == drawableEnd);
    Widget txt = Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
    Widget onlyRowWidget = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (null != drawableStart) drawableStart,
        SizedBox(
            width: null == drawableStartPadding
                ? drawablePadding
                : drawableStartPadding),
        Expanded(child: txt),
        SizedBox(
            width: null == drawableEndPadding
                ? drawablePadding
                : drawableEndPadding),
        if (null != drawableEnd) drawableEnd,
      ],
    );
    Widget onlyColumnWidget = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (null != drawableTop) drawableTop,
        SizedBox(
            height: null == drawableTopPadding
                ? drawablePadding
                : drawableTopPadding),
        Expanded(child: txt),
        SizedBox(
            height: null == drawableBottomPadding
                ? drawablePadding
                : drawableBottomPadding),
        if (null != drawableBottom) drawableBottom,
      ],
    );
    Widget child;
    if (onlyRow) {
      child = onlyRowWidget;
    } else if (onlyColumn) {
      child = onlyColumnWidget;
    } else {
//      child = Row(
//        mainAxisSize: MainAxisSize.min,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          if (null != drawableStart) drawableStart,
//          SizedBox(
//              width: null == drawableStartPadding
//                  ? drawablePadding
//                  : drawableStartPadding),
//          onlyColumnWidget,
//          SizedBox(
//              width: null == drawableEndPadding
//                  ? drawablePadding
//                  : drawableEndPadding),
//          if (null != drawableEnd) drawableEnd,
//        ],
//      );
      child = onlyRowWidget;
    }
    return Container(
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}
