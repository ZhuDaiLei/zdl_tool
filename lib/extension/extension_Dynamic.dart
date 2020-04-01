
/// @author zdl
/// date 2020/4/1 10:00
/// email zdl328465042@163.com
/// description

extension ExtensionDynamic on dynamic{
  String get toShow{
    switch(this){
      case String:
        break;
      case int:
        break;
      case double:
        break;
    }
  }
}