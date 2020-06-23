import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/4/21 15:38
/// email zdl328465042@163.com
/// description 未完成

class ClickWidget extends StatefulWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final AlignmentGeometry alignment;
  final Decoration decoration;
  final GestureTapCallback onTap;
  final GestureTapCallback onDoubleTap;
  final GestureLongPressCallback onLongPress;
  final GestureTapDownCallback onTapDown;
  final GestureTapCancelCallback onTapCancel;
  final ValueChanged<bool> onHighlightChanged;

  ClickWidget({
    Key key,
    @required this.child,
    this.margin,
    this.padding,
    this.alignment,
    this.decoration,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHighlightChanged,
  }) : super(key: key);

  @override
  _ClickWidgetState createState() => _ClickWidgetState();
}

class _ClickWidgetState extends State<ClickWidget> {
  @override
  Widget build(BuildContext context) {
    bool hasClick = (null == widget.onTap &&
        null == widget.onDoubleTap &&
        null == widget.onLongPress &&
        null == widget.onTapDown &&
        null == widget.onTapCancel);
    return Container(
      margin: widget.margin,
      alignment: widget.alignment,
      decoration: widget.decoration,
      child: InkWell(
        child: widget.child,
        onTap: widget.onTap,
        onDoubleTap: widget.onDoubleTap,
        onLongPress: widget.onLongPress,
        onTapDown: widget.onTapDown,
        onTapCancel: widget.onTapCancel,
        onHighlightChanged: widget.onHighlightChanged,
      ),
    );
  }
}
