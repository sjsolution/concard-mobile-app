import 'package:flutter/services.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:share_plus/share_plus.dart';

class GeneralMethodsDart {
  copyData(String? text) async {
    await Clipboard.setData(ClipboardData(text: text!)).then((value) {
      Globals.showToastMethod(msg: "Copied invitation link");
    });
  }

  shareData(String? link, String? subject) async {
    await Share.share(link!, subject: subject,);
  }
}
