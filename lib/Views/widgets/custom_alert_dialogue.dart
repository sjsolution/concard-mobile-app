import 'package:flutter/material.dart';

customeAlertDialogue(
    {BuildContext? context,
    Function()? onTap1Btn,
    Function()? onTap2Btn,
    String? title,
    String? content,
    String? btn1text,
    String? btn2Text}) {
  showDialog(
    barrierDismissible: false,
    context: context!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("$title"),
        content: Text("$content"),
        actions: [
          TextButton(
            child: Text("$btn1text"),
            onPressed: onTap1Btn,
          ),
          TextButton(child: Text("$btn2Text"), onPressed: onTap2Btn),
        ],
      );
    },
  );
}
