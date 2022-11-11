import 'dart:io';

import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Models/Indiviuals/social_links_model.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SocialLinksController {
  ServicesClass services = ServicesClass();
  LocalStorageClass localStorageClass = LocalStorageClass();

  Future addSocialLink({
    String? url,
    String? icon,
    String? title,
  }) async {
    try {
      var formData = icon != null
          ? FormData.fromMap({
              'url': url,
              'icon': await MultipartFile.fromFile(icon),
              'title': title,
            })
          : FormData.fromMap({
              'url': url,
              // 'icon': await MultipartFile.fromFile(icon!),
              'title': title,
            });
      var response = await services.postResponse(url: '/social/store', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
          Globals.showToastMethod(msg: "${response['message']}");
          // SocialLinksModel? socialLinksModel =
          //     SocialLinksModel.fromJson(response);
          return response;
        } else {
          //status false
          Globals.showToastMethod(msg: "Try again!");
          return null;
        }
      } else {
        Globals.showToastMethod(msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("login exception:" + e.toString());
      return null;
    }
  }

  Future<SocialLinksModel?> getSocialLink() async {
    try {
      var formData = FormData.fromMap({});
      var response = await services.postResponse(url: '/socials/list', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
          SocialLinksModel? socialLinksModel = SocialLinksModel.fromJson(response);
          return socialLinksModel;
        } else {
          //status false
          Globals.showToastMethod(msg: "There is no link added yet");
          return null;
        }
      } else {
        Globals.showToastMethod(msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("Social Link Exception:" + e.toString());
      return null;
    }
  }
}
