import 'dart:ui';

import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> showBottomSheet(BuildContext context,
      {required Widget widget,
        bool isDismissible = true,
        bool enableDrag = true,}) async {
    await showModalBottomSheet<void>(
        backgroundColor: Colors.black,
        context: context,
        barrierColor: Colors.black,
        enableDrag: enableDrag,
        isScrollControlled: true,
        isDismissible: isDismissible,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15),),),
        builder: (BuildContext context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), child: widget,);
        },);
  }


}
