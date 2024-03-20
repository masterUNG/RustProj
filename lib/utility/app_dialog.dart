import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rutsproj/widgets/widget_button.dart';
import 'package:rutsproj/widgets/widget_text.dart';

class AppDialog {
  void normalDialog({
    required String title,
    Widget? iconWidget,
    Widget? contentWidget,
    Widget? firstWidget,
    Widget? secondWidget,
  }) {
    Get.dialog(
      AlertDialog(
        title: WidgetText(data: title),
        icon: iconWidget,
        content: contentWidget,
        actions: [
          secondWidget ?? const SizedBox(),
          firstWidget ??
              WidgetButton(
                text: secondWidget == null ? 'OK' : 'Cancel',
                pressFunc: () => Get.back(),
                gfButtonType: GFButtonType.outline,
              )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
