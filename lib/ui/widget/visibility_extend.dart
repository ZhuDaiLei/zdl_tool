import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/7/17 11:14
/// email zdl328465042@163.com
/// description 扩展原生Visibility，新增INVISIBLE
class VisibilityExtend extends StatelessWidget {
  final Widget child;
  final Visible visible;

  VisibilityExtend({Key key, this.child, this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible != Visible.GONE,
      child: Opacity(
        opacity: visible == Visible.INVISIBLE ? 1.0 : 0.0,
        child: child,
      ),
    );
  }
}

enum Visible {
  GONE,
  VISIBLE,
  INVISIBLE,
}
