import 'dart:ui';


/// @author zdl
/// date 2020/7/9 14:23
/// email zdl328465042@163.com
/// description 扩展Object

extension ExtensionObject on Object {

  bool isNull(){
    bool result = false;
    if(null == this){
      result = true;
    }else{
      switch(this){
        case String:
          break;
        case List:
          break;
        case Map:
          break;
        case String:
          break;
      }
    }
    return result;
  }

  String get dealNull => this ?? '';
}
