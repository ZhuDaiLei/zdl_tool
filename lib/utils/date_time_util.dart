import 'package:intl/intl.dart';
import 'package:zdl_tool/utils/global.dart';

/// @author zdl
/// date 2020/3/31 10:45
/// email zdl328465042@163.com
/// description 日期时间相关工具类

class DateTimeUtil {
  static const String formatDefault = 'yyyy-MM-dd HH:mm:ss';
  static const String formatYMD = 'yyyy-MM-dd';
  static const String formatHMS = 'HH:mm:ss';
  static const String formatYMDHM = 'yyyy-MM-dd HH:mm';

  ///获取年
  static int getYear() => DateTime.now().year;

  ///获取月
  static int getMonth() => DateTime.now().month;

  ///获取日
  static int getDay() => DateTime.now().day;

  ///获取时
  static int getHour() => DateTime.now().hour;

  ///获取分
  static int getMinute() => DateTime.now().minute;

  ///获取秒
  static int getSecond() => DateTime.now().second;

  ///获取周几
  static int getWeekday() => DateTime.now().weekday;

  ///获取微秒
  static int getCurrentMillisecondsSinceEpoch() =>
      DateTime.now().millisecondsSinceEpoch;

  ///获取季度
  ///month: 不传则获取本月季度
  static int getQuarter({int month}) {
    if (Global.isEmpty(month)) month = getMonth();
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
        throw ('月份错误，请检查');
        break;
    }
    return quarter;
  }

  ///在当前时间下，指定往前、往后几天
  ///days > 0，为往后多少天；days < 0，为往前几天
  static String getAssignDay({int days = 0}) {
    int time;
    String end;
    if (days >= 0) {
      time = DateTime.now().add(Duration(days: days)).millisecondsSinceEpoch;
      end = ' 23:59:59';
    } else {
      time = DateTime.now()
          .subtract(Duration(days: days.abs()))
          .millisecondsSinceEpoch;
      end = ' 00:00:00';
    }
    return '${time2str(time, format: formatYMD)}$end';
  }

  ///获取今天开始的时间或者结束的时间
  static String getCurrentDay({bool isEnd = true}) =>
      '${time2str(getCurrentMillisecondsSinceEpoch(), format: formatYMD)} ${isEnd ? '23:59:59' : '00:00:00'}';

  ///时间戳转字符串日期
  static String time2str(int time, {String format = formatDefault}) {
    if(time.toString().length == 10) time = time*1000;
    DateFormat df = DateFormat(format);
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
    return df.format(date);
  }

  ///字符串转DateTime
  static DateTime str2dateTime(String str, {String format = formatDefault}) {
    DateFormat df = DateFormat(format);
    DateTime dt = DateTime.now();
    try {
      dt = df.parse(str);
      return dt;
    } catch (e) {
      print(e);
    } finally {
      return dt;
    }
  }
}
