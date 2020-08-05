import 'package:flutter/material.dart';

extension ExtensionTextEditingController on TextEditingController {

  ///设置TextField的值，并且将光标移动到最后
  void setValue(String value) {
    TextEditingController controller = this;
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
}
