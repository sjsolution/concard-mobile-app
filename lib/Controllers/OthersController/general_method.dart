import 'package:flutter/services.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class GeneralMethodsDart {
  copyData(String? text) async {
    await Clipboard.setData(ClipboardData(text: text!)).then((value) {
      Globals.showToastMethod(msg: "Copied invitation link");
    });
  }

  shareDataMethod(String? link, String? subject) async {
    await Share.share(link!, subject: subject,);
  }

  // launchUrlMethods(String? url) async {
  //   if (!await launchUrl(Uri.parse(url!))) {
  //     throw 'Could not launch $url';
  //   }
  // }
}
