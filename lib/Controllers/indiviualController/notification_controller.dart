import 'dart:io';

import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Models/Indiviuals/social_links_model.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotificationController {
  ServicesClass services = ServicesClass();
  LocalStorageClass localStorageClass = LocalStorageClass();

  Future getNotification() async {
    try {
      var formData = FormData.fromMap({
      });
      var response =
          await services.postResponse(url: '/notification/list', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
         
          // return socialLinksModel;
        } else {
          //status false
          Globals.showToastMethod(msg: "There is no notification here");
          return null;
        }
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("get notification exception:" + e.toString());
      return null;
    }
  }


}
