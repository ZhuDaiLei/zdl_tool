import 'dart:ui';

class ColorUtil{

  static isValidColor(String color){
    if(!color.contains('#')){
      throw 'color缺失#';
    }
    if(color.length != 7){
      throw 'color书写错误，不是7位';
    }
  }

  ///字符串颜色转Color
  static Color getColor(String color){
    isValidColor(color);
    return Color(int.parse(color.replaceAll('#', '0xff')));
  }

  ///带透明度的颜色
  static Color getAlphaColor(String color, {double alpha}){
    isValidColor(color);
    int hex = int.parse(color.replaceAll('#', '0x'));
    if (alpha < 0){
      alpha = 0;
    }else if (alpha > 1){
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16 ,
        (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0,
        alpha);
  }
}