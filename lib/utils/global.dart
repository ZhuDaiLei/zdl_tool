import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:zdl_tool/extension/extension_string.dart';

/// @author zdl
/// date 2020/3/31 16:24
/// email zdl328465042@163.com
/// description

class Global {
  ///处理接口返回字符串
  @Deprecated('please use ExtensionString dealData')
  static String dealNull(String msg, {String defaultMsg = '无'}) =>
      isEmpty(msg) ? defaultMsg : msg;

  ///判空
  static bool isEmpty(data) {
    if (null == data) {
      return true;
    }
    if (data is String) {
      return 0 == data.trim().length;
    } else if (data is List) {
      return data.isEmpty;
    } else if (data is Map) {
      return data.isEmpty;
    }
    return true;
  }

  ///双击退出APP
  static int _last = 0;

  static Future<bool> doubleClickBack(Function onClickBack) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - _last > 1000) {
      _last = DateTime.now().millisecondsSinceEpoch;
      if (null != onClickBack) onClickBack;
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
