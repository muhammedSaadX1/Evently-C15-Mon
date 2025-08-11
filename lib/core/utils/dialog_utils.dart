
import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtils {
  static void showLoading(
    BuildContext context, {
    String? message,
    bool dismissible = true,
  }) {
    showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder:
          (context) => PopScope(
            canPop: dismissible,
            child: CupertinoAlertDialog(
              content:
                  message == null
                      ? Center(child: CircularProgressIndicator())
                      : Row(
                        children: [
                          Text(message),
                          SizedBox(width: 8.w),
                          Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.blue,
                            ),
                          ),
                        ],
                      ),
            ),
          ),
    );
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
    BuildContext context, {
    required String message,
    String? posActionTitle,
    String? negActionTitle,
        VoidCallback? posAction,
        VoidCallback? negAction
  }) {
    showDialog(
      context: context,
      builder: (context) {
        List<Widget> actions = [];
        if(posActionTitle != null){
          actions.add(MaterialButton(

              onPressed: () {
            posAction?.call();

          }, child: Text(posActionTitle, style: TextStyle(fontSize: 14, color: ColorsManager.black),)));
        }
if(negActionTitle != null){
  actions.add(MaterialButton(

      onPressed: () {
    negAction?.call();
  }, child: Text(negActionTitle, style: TextStyle(fontSize: 14, color: ColorsManager.black),)));
}
        return CupertinoAlertDialog(
          content: Text(
            message,
            style: TextStyle(
              fontSize: 16,
              color: ColorsManager.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: actions,
        );
      },
    );
  }
}
