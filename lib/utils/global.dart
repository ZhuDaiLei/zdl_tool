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
  static bool isEmpty(dynamic data) {
    if(null == data){
      return true;
    }
    switch (data) {
      case String:
        return '' == (data as String).trim();
        break;
      case int:
        return true;
        break;
      case List:
        return (data as List).isEmpty;
        break;
      case Map:
        return (data as Map).isEmpty;
        break;
      default:
        return false;
        break;
    }
  }

  ///md5加密
  static String generateMd5(String str)  => isEmpty(str) ? '' : str.generateMd5;

  ///验证是否是电话号码
  static bool isPhoneNumber(String str) => isEmpty(str) ? false : str.isPhoneNumber;

  ///验证是否是邮箱
  static bool isEmail(String str) => isEmpty(str) ? false : str.isEmail;

  ///是否是url
  static bool isUrl(String str) => isEmpty(str) ? false : str.isUrl;

  ///是否是身份证
  static bool isIdCard(String str) => isEmpty(str) ? false : str.isIdCard;

  ///是否是中文
  static bool isChinese(String str) => isEmpty(str) ? false : str.isChinese;

  ///是否是车牌
  static bool isCarNumber(String str) => isEmpty(str) ? false : str.isCarNumber;

  static String dealNull(String msg, {String defaultMsg = '无'}){
    String result;
    result = isEmpty(msg) ? defaultMsg : msg;
    return result;
  }
}
