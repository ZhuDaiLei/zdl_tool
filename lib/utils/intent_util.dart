import 'package:flutter/material.dart';

/// @author zdl
/// date 2020/7/15 15:21
/// email zdl328465042@163.com
/// description 路由跳转工具类
class IntentUtil {
  static Future fishPush(
    BuildContext ctx, {
    String routeName,
    dynamic intentData,
    bool finish = false,
    bool removeAll = false,
  }) {
    return _pushByName(ctx,
        routeName: routeName,
        intentData: intentData,
        finish: finish,
        removeAll: removeAll);
  }

  static Future _pushByName(
    BuildContext ctx, {
    String routeName,
    dynamic intentData,
    bool finish,
    bool removeAll,
  }) {
    if (removeAll) {
      return Navigator.of(ctx)
          .pushNamedAndRemoveUntil(routeName, (route) => route == null);
    } else {
      if (finish) {
        return Navigator.of(ctx).pushReplacementNamed(routeName);
      } else {
        return Navigator.of(ctx).pushNamed(routeName);
      }
    }
  }
}
