import 'package:flutter/material.dart';

/// @author zdl
/// date 2019/12/5 11:02
/// email zdl328465042@163.com
/// description 多处复用的widget

class IncludeWidget {
  ///横向、纵向分割线
  static Widget line({
    Color color = const Color(0xFFF4F4F4),
    bool isHor = true,
    double width,
    double height,
    EdgeInsets margin,
  }) {
    double w;
    double h;
    if (isHor) {
      w = null == width ? double.infinity : width;
      h = null == height ? 1 : height;
    } else {
      w = null == width ? 1 : width;
      h = null == height ? double.infinity : height;
    }
    return Container(
      width: w,
      height: h,
      margin: margin,
      color: color,
    );
  }

  ///带背景的文字
  ///图层从上到下:bgImg>gradient>bgColor
  ///设置了shape: BoxShape.circle，则不能再设置borderRadius
  ///border: Border.all(color: Colors.black, width: 2)
  ///borderRadius: BorderRadius.all(Radius.circular(5))
  ///shape: BoxShape.circle
  ///阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
  ///boxShadow: [BoxShadow(color: Colors.green,offset: Offset(5, 5),blurRadius: 10,spreadRadius: 5,)]
  ///环形渲染:RadialGradient，扫描式渐变:SweepGradient，线性渐变:LinearGradient
  ///gradient: LinearGradient(colors: [Colors.red, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
  static Widget textWithBg({
    double width,
    double height,
    AlignmentGeometry alignment = Alignment.center,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry margin,
    String text = "",
    double fontSize = 14,
    Color fontColor,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.center,
    String bgImg,
    Color bgColor,
    BoxBorder border,
    BorderRadiusGeometry borderRadius,
    List<BoxShadow> boxShadow,
    BoxShape shape = BoxShape.rectangle,
    Gradient gradient,
  }) {
    return UnconstrainedBox(
      child: Container(
        width: width,
        height: height,
        alignment: alignment,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          image: null == bgImg
              ? null
              : DecorationImage(image: AssetImage(bgImg), fit: BoxFit.cover),
          color: bgColor,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          shape: shape,
          gradient: gradient,
        ),
        child: Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
