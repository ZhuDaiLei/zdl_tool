import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zdl_tool/ui/widget/index_widget.dart';
import 'package:zdl_tool/ui/widget/input_info_row.dart';
import 'package:zdl_tool/ui/widget/show_info_row.dart';
import 'package:zdl_tool/ui/widget/text_with_bg.dart';
import 'package:zdl_tool/utils/color_util.dart';

/// @author zdl
/// date 2019/12/5 11:02
/// email zdl328465042@163.com
/// description 多处复用的widget

@Deprecated('please use single widget')
class IncludeWidget {
  ///横向、纵向分割线
  /// [Line]
  @Deprecated('please use Line')
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
  /// [TextWithBg]
  @Deprecated('please use TextWithBg')
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

  ///通用的左右布局信息展示
  /// [ShowInfoRow]
  @Deprecated('please use ShowInfoRow')
  static Widget showInfoKeyValue({
    String key,
    String value,
    int keyFlex = 1,
    int valueFlex = 2,
    Color bgColor = Colors.transparent,
    EdgeInsetsGeometry padding = const EdgeInsets.only(top: 20, bottom: 20),
    EdgeInsetsGeometry margin,
    Color keyColor = ColorUtil.text_color_333,
    Color valueColor = ColorUtil.text_color_666,
    double fontSize = 14,
    FontWeight keyFontWeight = FontWeight.w600,
    FontWeight valueFontWeight = FontWeight.normal,
  }) {
    return Container(
      color: bgColor,
      padding: padding,
      margin: margin,
      child: Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: keyFlex,
            child: Text(
              key,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: keyColor,
                fontSize: fontSize,
                fontWeight: keyFontWeight,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: valueFlex,
            child: Text(
              value,
              textAlign: TextAlign.end,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: valueColor,
                fontSize: fontSize,
                fontWeight: valueFontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///通用的左右布局信息输入、选择
  /// [InputInfoRow]
  @Deprecated('please use InputInfoRow')
  static Widget inputKeyValue({
    String key,
    String value,
    String hintText,
    String unit,
    TextInputType inputType,
    TextEditingController controller,
    int keyFlex = 1,
    int valueFlex = 2,
    Color bgColor = Colors.transparent,
    EdgeInsetsGeometry margin,
    Color keyColor = ColorUtil.text_color_333,
    Color valueColor = ColorUtil.text_color_666,
    Color hintColor = ColorUtil.text_color_999,
    double fontSize = 14,
    FontWeight keyFontWeight = FontWeight.w600,
    bool showArrowRight = false,
    GestureTapCallback onTap,
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.only(left: 10, top: 20, bottom: 20),
  }) {
    controller = controller ?? TextEditingController();
    if (null != value) {
      controller.value = controller.value.copyWith(
        text: value,
        selection: TextSelection.fromPosition(
          TextPosition(
            affinity: TextAffinity.downstream,
            offset: value.length,
          ),
        ),
      );
    }
    bool readOnly = null != onTap;
    Pattern reg;
    if (inputType == TextInputType.number || inputType == TextInputType.phone) {
      reg = RegExp('[0-9.]');
    }
    TextField textField = TextField(
      controller: controller,
      textAlign: TextAlign.end,
      keyboardType: inputType,
      maxLines: 1,
      readOnly: readOnly,
      inputFormatters: [
        if (null != reg) WhitelistingTextInputFormatter(reg),
      ],
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: fontSize,
        ),
        contentPadding: contentPadding,
        border: InputBorder.none,
        suffixText: unit,
        suffixStyle: TextStyle(
          color: valueColor,
          fontSize: fontSize,
        ),
      ),
      style: TextStyle(
        color: valueColor,
        fontSize: fontSize,
      ),
    );
    return InkWell(
      onTap: onTap,
      child: Container(
        color: bgColor,
        margin: margin,
        child: Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: keyFlex,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  key,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: keyColor,
                    fontSize: fontSize,
                    fontWeight: keyFontWeight,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: valueFlex,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    //IgnorePointer
                    child:
                        readOnly ? IgnorePointer(child: textField) : textField,
                  ),
                  SizedBox(width: 10),
                  Visibility(
                    visible: showArrowRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
