import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/7/21 10:33
/// email zdl328465042@163.com
/// description 带背景的文字
///
/// 图层从上到下:bgImg>gradient>bgColor
/// 设置了shape: BoxShape.circle，则不能再设置borderRadius
/// border: Border.all(color: Colors.black, width: 2)
/// borderRadius: BorderRadius.all(Radius.circular(5))
/// shape: BoxShape.circle
/// 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
/// boxShadow: [BoxShadow(color: Colors.green,offset: Offset(5, 5),blurRadius: 10,spreadRadius: 5,)]
/// 环形渲染:RadialGradient，扫描式渐变:SweepGradient，线性渐变:LinearGradient
/// gradient: LinearGradient(colors: [Colors.red, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight)
class TextWithBg extends StatelessWidget {
  final double width;
  final double height;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String bgImg;
  final Color bgColor;
  final BoxBorder border;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> boxShadow;
  final BoxShape shape;
  final Gradient gradient;

  TextWithBg({
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.padding,
    this.margin,
    this.text = "",
    this.fontSize = 14,
    this.fontColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.bgImg,
    this.bgColor,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.shape = BoxShape.rectangle,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
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
