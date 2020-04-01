import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

/// @author zdl
/// date 2020/3/31 18:19
/// email zdl328465042@163.com
/// description

extension ExtensionString on String {
  ///String转int
  int get parseInt => int.parse(this);

  ///String转double
  double get parseDouble => double.parse(this);

  ///对字符串进行md5加密
  String get generateMd5 {
    if (this.isEmpty) return '';
    var content = Utf8Encoder().convert(this);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  ///验证是否是电话号码
  bool get isPhoneNumber => RegExp(r'^1[3-9][0-9]\d{8}$').hasMatch(this);

  ///验证是否是邮箱
  bool get isEmail =>
      RegExp(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$').hasMatch(this);

  ///是否是url
  bool get isUrl =>
      RegExp(r'^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+$').hasMatch(this);

  ///是否是身份证
  bool get isIdCard => RegExp(r'^\d{17}[\d|x]|\d{15}$').hasMatch(this);

  ///是否是中文
  bool get isChinese => RegExp(r'^[\u4e00-\u9fa5]$').hasMatch(this);

  ///是否是车牌
  bool get isCarNumber => RegExp(
          r'(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$)|(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{2}$)')
      .hasMatch(this.toUpperCase());
}
