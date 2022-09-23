import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLLauncherClass {
  launchUrl(String? url) async {
    if (!await launchUrl(url!)) {
      throw 'Could not launch $url';
    }
  }
}
