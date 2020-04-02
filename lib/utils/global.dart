import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

/// @author zdl
/// date 2020/3/31 16:24
/// email zdl328465042@163.com
/// description

class Global {
  ///判空
  static bool isEmpty(dynamic data) {
    switch (data) {
      case String:
        return null == data || '' == data.trim();
        break;
      case List:
        return null == data || (data as List).isEmpty;
        break;
      case Map:
        return null == data || (data as Map).isEmpty;
        break;
      default:
        return false;
        break;
    }
  }

  ///md5加密
  static String generateMd5(String str) {
    if (null == str || str.isEmpty) {
      return '';
    }
    var content = Utf8Encoder().convert(str);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  static bool _regExp(String source, String str) =>
      null == str ? false : RegExp(source).hasMatch(str);

  ///验证是否是电话号码
  static bool isPhoneNumber(String str) => _regExp(r'^1[3-9][0-9]\d{8}$', str);

  ///验证是否是邮箱
  static bool isEmail(String str) =>
      _regExp(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$', str);

  ///是否是url
  static bool isUrl(String str) =>
      _regExp(r'^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+$', str);

  ///是否是身份证
  static bool isIdCard(String str) => _regExp(r'^\d{17}[\d|x]|\d{15}$', str);

  ///是否是中文
  static bool isChinese(String str) => _regExp(r'[\u4e00-\u9fa5]', str);

  ///是否是车牌
  static bool isCarNumber(String str) => _regExp(
      r'(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$)|(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{2}$)', str.toUpperCase());
}
