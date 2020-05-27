
import 'package:zdl_tool/utils/global.dart';

/// @author zdl
/// date 2020/3/31 10:45
/// email zdl328465042@163.com
/// description 日期时间相关工具类

class DateTimeUtil {
  ///获取年
  static getYear() => DateTime.now().year;

  ///获取月
  static getMonth() => DateTime.now().month;

  ///获取日
  static getDay() => DateTime.now().day;

  ///获取时
  static getHour() => DateTime.now().hour;

  ///获取分
  static getMinute() => DateTime.now().minute;

  ///获取秒
  static getSecond() => DateTime.now().second;

  ///获取周几
  static getWeekday() => DateTime.now().weekday;

  ///获取毫秒
  static getCurrentMillisecond() => DateTime.now().millisecond;

  ///获取微秒
  static getCurrentMillisecondsSinceEpoch() =>
      DateTime.now().millisecondsSinceEpoch;

  ///获取季度
  ///month: 不传则获取本月季度
  static getQuarter({int month}) {
    if(Global.isEmpty(month)) month = getMonth();
    int quarter = 0;
    switch (month) {
      case 1:
      case 2:
      case 3:
        quarter = 1;
        break;
      case 4:
      case 5:
      case 6:
        quarter = 2;
        break;
      case 7:
      case 8:
      case 9:
        quarter = 3;
        break;
      case 10:
      case 11:
      case 12:
        quarter = 4;
        break;
      default:
        throw('月份错误，请检查');
        break;
    }
    return quarter;
  }
}
