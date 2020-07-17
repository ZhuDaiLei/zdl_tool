import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:zdl_tool/extension/extension_string.dart';

/// @author zdl
/// date 2020/3/31 16:24
/// email zdl328465042@163.com
/// description

class Global {
  ///判空
  static bool isEmpty(var data) {
    if(null == data){
      return true;
    }
    switch (data.runtimeType.toString()) {
      case 'String':
        return '' == (data as String).trim();
        break;
      case 'int':
        return true;
        break;
      case 'List':
        return (data as List).isEmpty;
        break;
      case 'Map':
        return (data as Map).isEmpty;
        break;
      default:
        return false;
        break;
    }
  }

  ///双击退出APP
  static int last = 0;
  static Future<bool> doubleClickBack(Function onClickBack) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - last > 1000) {
      last = DateTime.now().millisecondsSinceEpoch;
      if(null != onClickBack) onClickBack;
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
