import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/7/17 9:51
/// email zdl328465042@163.com
/// description 点击页面空白处隐藏软键盘
class BaseBlankUnfocus extends StatelessWidget {
  final Widget child;

  BaseBlankUnfocus({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}
