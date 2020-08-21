import 'package:flutter/material.dart';
import '../../../extension/index_extension.dart';
import '../../../utils/intent_util.dart';

/// @author zdl
/// date 2020/8/21 14:18
/// email zdl328465042@163.com
/// description 显示提示内容的dialog

/*
DialogShowInfo.show(_viewService.context, callback: (isConfirm) {
          });
*/

typedef ShowInfoCallback(bool isConfirm);

class DialogShowInfo extends StatefulWidget {
  static void show(
    BuildContext context, {
    String title = '标题文本',
    String content,
    String cancelText = '取消',
    String confirmText = '确定',
    bool hasCancel = true,
    ShowInfoCallback callback,
  }) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => DialogShowInfo(
          title, content, cancelText, confirmText, hasCancel, callback),
    );
  }

  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final bool hasCancel;
  final ShowInfoCallback callback;

  DialogShowInfo(
    this.title,
    this.content,
    this.cancelText,
    this.confirmText,
    this.hasCancel,
    this.callback,
  );

  @override
  _DialogShowInfoState createState() => _DialogShowInfoState();
}

class _DialogShowInfoState extends State<DialogShowInfo> {
  @override
  Widget build(BuildContext context) {
    Widget contentWidget;
    if (null == widget.content) {
      contentWidget = SizedBox(height: 24);
    } else {
      contentWidget = Container(
        padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 25),
        child: Text(
          widget.content,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: '#999999'.toColor(),
            fontSize: 14,
          ),
        ),
      );
    }
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
              contentWidget,
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
                    Visibility(
                      visible: widget.hasCancel,
                      child: Expanded(
                        child: InkWell(
                          onTap: () {
                            widget.callback(false);
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
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          widget.callback(true);
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
        widget.callback(false);
        return true;
      },
    );
  }
}
