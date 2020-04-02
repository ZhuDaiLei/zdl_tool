import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

/// @author zdl
/// date 2020/3/31 18:19
/// email zdl328465042@163.com
/// description

extension ExtensionString on String {
  ///String转int
  int get parseInt {
    try {
      return int.parse(this);
    } catch (e) {
      print(e);
      return -1;
    }
  }

  ///String转double
  double get parseDouble {
    try {
      return double.parse(this);
    } catch (e) {
      print(e);
      return -1.0;
    }
  }

  ///对字符串进行md5加密
  String get generateMd5 {
    if (this.isEmpty) return '';
    var content = Utf8Encoder().convert(this);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  bool _regExp(String source) => RegExp(source).hasMatch(this);

  ///验证是否是电话号码
  bool get isPhoneNumber => _regExp(r'^1[3-9][0-9]\d{8}$');

  ///验证是否是邮箱
  bool get isEmail => _regExp(r'^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$');

  ///是否是url
  bool get isUrl => _regExp(r'^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+$');

  ///是否是身份证
  bool get isIdCard => _regExp(r'^\d{17}[\d|x]|\d{15}$');

  ///是否是中文
  bool get isChinese => _regExp(r'[\u4e00-\u9fa5]');

  ///是否是车牌
  bool get isCarNumber => _regExp(
      r'(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Za-z]{1}[A-Za-z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Za-z0-9]{4}[A-Za-z0-9挂学警港澳]{1}$)|(^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Za-z]{1}[A-Za-z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Za-z0-9]{4}[A-Za-z0-9挂学警港澳]{2}$)');
}
