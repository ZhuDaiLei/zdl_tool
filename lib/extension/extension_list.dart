

/// @author zdl
/// date 2020/10/22 14:50
/// email zdl328465042@163.com
/// description 扩展List
extension ExtensionList on List{

  bool get isList => null != this || !(this is List);

  List get dealNotList => isList ? this : [];

  String toStringWith({String splitUnit = '、'}){
    String str = this.dealNotList.toString();
    return str.substring(1, str.length-1).replaceAll(', ', splitUnit);
  }
}