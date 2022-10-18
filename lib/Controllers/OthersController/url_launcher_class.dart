import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncherClass {
  launchUrlMethod(String? url,String? type) async {
    if (!await launchUrl(Uri.parse(type!+":"+url!))) {
      throw 'Could not launch $url';
    }
  }
}
