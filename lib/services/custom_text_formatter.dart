import 'package:flutter/services.dart';
import '../extension/extension_string.dart';


/// @author zdl
/// date 2020/8/21 17:44
/// email zdl328465042@163.com
/// description 限制TextField输入小数位数
class DecimalDigitsTextInputFormatter extends TextInputFormatter {
  final int decimalDigits;

  DecimalDigitsTextInputFormatter(
    this.decimalDigits,
  );

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newTxt = newValue.text.replaceExceptFirst('.', '');
    List<String> newArr = newTxt.split('.');
    if(newArr.length != 1 && newArr[1].length > decimalDigits){
      String value = '${newArr[0]}.${newArr[1].substring(0, decimalDigits)}';
      return TextEditingValue(text: value,selection: TextSelection.collapsed(offset: value.length));
    }
    return TextEditingValue(text: newTxt,selection: TextSelection.collapsed(offset: newTxt.length));
  }
}
