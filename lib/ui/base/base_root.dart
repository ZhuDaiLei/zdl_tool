import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zdl_tool/utils/color_util.dart';

/// @author zdl
/// date 2020/7/17 11:14
/// email zdl328465042@163.com
/// description 页面基类
class BaseRoot extends StatefulWidget {
  /*整体配置*/
  final GestureTapCallback clickBack;
  final Widget body;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget floatingActionButton;

  /*标题栏配置*/
  final String title;
  final Widget titleWidget;
  final bool centerTitle;
  final Widget leading;

  //常用的用IconButton来表示，不常用的用PopupMenuButton来显示三个点，点击展开
  final List<Widget> actions;
  final Color barBackgroundColor;
  final bool isDarkTheme;

  BaseRoot({
    Key key,
    this.clickBack,
    this.body,
    this.backgroundColor = Colors.white,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.title = '',
    this.titleWidget,
    this.centerTitle = true,
    this.leading = const Icon(Icons.arrow_back_ios),
    this.actions,
    this.barBackgroundColor,
    this.isDarkTheme = true,
  }) : super(key: key);

  @override
  _BaseRootState createState() => _BaseRootState();
}

class _BaseRootState extends State<BaseRoot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: AppBar(
        title: widget.titleWidget ?? Text(
          widget.title,
          style: TextStyle(
            color: widget.isDarkTheme ? Colors.white : ColorUtil.text_color_333,
          ),
        ),
        centerTitle: widget.centerTitle,
        leading: null == widget.leading ? null : IconButton(
          icon: widget.leading,
          onPressed: widget.clickBack ??
              () {
                if (Navigator.canPop(context))
                  Navigator.of(context).pop();
                else
                  SystemNavigator.pop();
              },
        ),
        actions: widget.actions,
        backgroundColor: widget.barBackgroundColor ?? widget.isDarkTheme
            ? null
            : Colors.white,
        brightness: widget.isDarkTheme ? Brightness.dark : Brightness.light,
        iconTheme: IconThemeData(
          color: widget.isDarkTheme ? Colors.white : ColorUtil.text_color_333,
        ),
      ),
      body: widget.body,
      backgroundColor: widget.backgroundColor,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
