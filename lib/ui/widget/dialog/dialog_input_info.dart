import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zdl_tool/services/custom_text_formatter.dart';
import '../../../extension/index_extension.dart';
import '../../../utils/intent_util.dart';

/// @author zdl
/// date 2020/8/21 14:18
/// email zdl328465042@163.com
/// description 显示提示内容的dialog

/*
DialogInputInfo.show(_viewService.context, callback: (data) {
          });
*/

typedef InputInfoCallback(String data);

class DialogInputInfo extends StatefulWidget {
  static void show(
    BuildContext context, {
    String title = '标题文本',
    String hintText,
    String cancelText = '取消',
    String confirmText = '确定',
    int maxLines = 1,
    TextInputType inputType,
    String whitelisting,
    String blacklisting,
    int maxLength,
    int decimalDigits,
    ValueChanged<String> onChanged,
    TextField inputWidget,
    InputInfoCallback callback,
  }) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => DialogInputInfo(
        title,
        hintText,
        cancelText,
        confirmText,
        maxLines,
        inputType,
        whitelisting,
        blacklisting,
        maxLength,
        decimalDigits,
        onChanged,
        inputWidget,
        callback,
      ),
    );
  }

  final String title;
  final String hintText;
  final String cancelText;
  final String confirmText;

  ///自带输入框最大行数
  final int maxLines;

  ///输入数字请用TextInputType.numberWithOptions(decimal: true)
  final TextInputType inputType;

  ///输入内容正则约束，白名单、黑名单
  final String whitelisting;
  final String blacklisting;

  ///输入内容最大长度
  final int maxLength;

  ///小数位数
  final int decimalDigits;
  final ValueChanged<String> onChanged;
  final TextField inputWidget;
  final InputInfoCallback callback;

  DialogInputInfo(
    this.title,
    this.hintText,
    this.cancelText,
    this.confirmText,
    this.maxLines,
    this.inputType,
    this.whitelisting,
    this.blacklisting,
    this.maxLength,
    this.decimalDigits,
    this.onChanged,
    this.inputWidget,
    this.callback,
  );

  @override
  _DialogInputInfoState createState() => _DialogInputInfoState();
}

class _DialogInputInfoState extends State<DialogInputInfo> {
  TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController = null == widget.inputWidget
        ? TextEditingController()
        : widget.inputWidget.controller;
  }

  @override
  Widget build(BuildContext context) {
    Widget defInput = Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: '#DBDBDB'.toColor()),
      ),
      child: TextField(
        controller: _contentController,
        inputFormatters: [
          if (null != widget.maxLength)
            LengthLimitingTextInputFormatter(widget.maxLength),
          if (null != widget.whitelisting)
            WhitelistingTextInputFormatter(RegExp(widget.whitelisting)),
          if (null != widget.blacklisting)
            BlacklistingTextInputFormatter(RegExp(widget.blacklisting)),
          if (null != widget.decimalDigits)
            DecimalDigitsTextInputFormatter(widget.decimalDigits),
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
        ),
        maxLines: widget.maxLines,
        keyboardType: widget.inputType,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.done,
      ),
    );
    Widget dialogContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 20, top: 24, right: 20),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: '#333333'.toColor(),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: widget.inputWidget ?? defInput,
              ),
              Container(
                decoration: BoxDecoration(
                  color: '#E8E8E8'.toColor(),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                padding: EdgeInsets.only(top: 1),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          IntentUtil.finish(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8)),
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(right: 1),
                          child: Text(
                            widget.cancelText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: '#333333'.toColor(),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          widget.callback(_contentController.text);
                          IntentUtil.finish(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8)),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            widget.confirmText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: '#1E6FF4'.toColor(),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return WillPopScope(
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Material(
          type: MaterialType.transparency,
          child: dialogContent,
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
