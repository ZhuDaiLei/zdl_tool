
import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/3/31 10:45
/// email zdl328465042@163.com
/// description 设备信息相关工具类

class DeviceInfoUtil{

  static double screenWidth(BuildContext ctx) => MediaQuery.of(ctx).size.width;


  static double screenHeight(BuildContext ctx) => MediaQuery.of(ctx).size.height;
}