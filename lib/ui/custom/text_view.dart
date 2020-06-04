import 'package:flutter/material.dart';
import 'package:zdl_tool/utils/color_util.dart';

/// @author zdl
/// date 2020/4/21 16:38
/// email zdl328465042@163.com
/// description 未完成

class TextView extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final FontWeight textStyle;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;
  final Color background;
  final TextDecoration decoration;
  final TextDecorationStyle decorationStyle;
  final GestureTapCallback onTap;
  final GestureTapCallback onDoubleTap;
  final GestureLongPressCallback onLongPress;
  final GestureTapDownCallback onTapDown;
  final GestureTapCancelCallback onTapCancel;
  final ValueChanged<bool> onHighlightChanged;

  TextView({
    this.text,
    this.textColor = ColorUtil.text_color_333,
    this.textSize = 14.0,
    this.textStyle = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.background,
    this.decoration,
    this.decorationStyle,
    this.onTap,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onHighlightChanged,
  });

  @override
  _TextViewState createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  @override
  Widget build(BuildContext context) {
    bool hasClick = (null == widget.onTap &&
        null == widget.onDoubleTap &&
        null == widget.onLongPress &&
        null == widget.onTapDown &&
        null == widget.onTapCancel);
    Widget tv = Text(
      widget.text,
      textAlign: widget.textAlign,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      style: TextStyle(
        color: widget.textColor,
        fontSize: widget.textSize,
        fontWeight: widget.textStyle,
        background: Paint()..color = widget.background,
        decoration: widget.decoration,
        decorationStyle: widget.decorationStyle
      ),
    );
    Widget clickTv = InkWell(
      child: tv,
      onTap: widget.onTap,
      onTapCancel: widget.onTapCancel,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onTapDown: widget.onTapDown,
      onHighlightChanged: widget.onHighlightChanged,
    );
    return hasClick ? clickTv : tv;
  }
}
