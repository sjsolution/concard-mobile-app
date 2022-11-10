import 'package:flutter/material.dart';
import 'package:concard/Controllers/about_controller.dart';

class AboutProvider extends ChangeNotifier {
  changeAbout({String? aboutId, required String AboutText}) {
    AboutController().changeAbout(aboutId: aboutId, text: AboutText);
    notifyListeners();
  }
}
