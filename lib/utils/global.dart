import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

/// @author zdl
/// date 2020/3/31 16:24
/// email zdl328465042@163.com
/// description

class Global {
  ///md5加密
  static String generateMd5(String str) {
    if (str.isEmpty) {
      return '';
    }
    var content = Utf8Encoder().convert(str);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  ///验证是否是电话号码
  static bool isPhoneNumber(String str) =>
      RegExp(r'^1[3-9][0-9]\d{8}$').hasMatch(str);

  ///验证是否是邮箱
  static bool isEmail(String str) =>
      RegExp(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$').hasMatch(str);

  ///是否是url
  static bool isUrl(String str) =>
      RegExp(r'^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+$').hasMatch(str);

  ///是否是身份证
  static bool isIdCard(String str) =>
      RegExp(r'^\d{17}[\d|x]|\d{15}$').hasMatch(str);

  ///是否是中文
  static bool isChinese(String str) =>
      RegExp(r'^[\u4e00-\u9fa5]$').hasMatch(str);

  ///是否是车牌
  static bool isCarNumber(String str) => RegExp(
          r'(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$)|(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{2}$)')
      .hasMatch(str.toUpperCase());
}
