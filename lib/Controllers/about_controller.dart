import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:flutter/material.dart';

class AboutController {
  ServicesClass services = ServicesClass();

  Future<void> changeAbout({required String text, String? aboutId}) async {
    var formData = FormData.fromMap({'about_id': aboutId, 'text': text});
    try {
      var response = await services.postResponse(url: '/user/about', formData: formData);
      if (response != null) {
        print("About Updated Successfully");
        Globals.showToastMethod(msg: "About Updated Successfully");
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
      }
    } catch (e) {
      debugPrint("About changing exception: " + e.toString());
    }
  }
}
