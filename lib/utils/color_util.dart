import 'dart:math';
import 'dart:ui';


/// @author zdl
/// date 2020/3/31 10:45
/// email zdl328465042@163.com
/// description 颜色工具类

class ColorUtil {
  ///判断是否为带#的颜色字符串
  static isValidColor(String color) {
    if (!color.contains('#')) {
      throw 'color缺失#';
    }
    if (color.length != 7) {
      throw 'color书写错误，不是7位';
    }
  }

  ///字符串颜色转Color
  @Deprecated('please use ExtensionString toColor')
  static Color getColor(String color) {
    isValidColor(color);
    return Color(int.parse(color.replaceAll('#', '0xff')));
  }

  ///带透明度的颜色
  static Color getAlphaColor(String color, {double alpha}) {
    isValidColor(color);
    int hex = int.parse(color.replaceAll('#', '0x'));
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16, (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0, alpha);
  }

  ///获取随机颜色
  static Color getRandomColor() {
    Random random = Random.secure();
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  static const Color text_color_333 = Color(0xff333333);
  static const Color text_color_666 = Color(0xff666666);
  static const Color text_color_999 = Color(0xff999999);
}
