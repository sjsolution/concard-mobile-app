import 'dart:convert';
import 'dart:io' as Io;

import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileController {
  ServicesClass services = ServicesClass();
  LocalStorageClass localStorageClass = LocalStorageClass();

  Future<IndiviualProfileModel?> getIndiviualProfile(String? id) async {
    try {
      var formData = FormData.fromMap({
        'id': id,
      });
      var response = await services.postResponse(
          url: '/user/user-profile', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
          IndiviualProfileModel? profileModel =
              IndiviualProfileModel.fromJson(response);
          return profileModel;
        } else {
          //status false
          Globals.showToastMethod(msg: "User not exist");
          return null;
        }
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("login exception:" + e.toString());
      return null;
    }
  }

  Future uplaodImage(String? image) async {
    try {
      var formData = FormData.fromMap({
        'image':  MultipartFile.fromString(base64.encode(utf8.encode(image!))),
      });
      var response = await services.postResponse(
          url: '/user/image-upload', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
          // IndiviualProfileModel? profileModel =
          //     IndiviualProfileModel.fromJson(response);
          return response;
        } else {
          //status false
          Globals.showToastMethod(msg: "User not exist");
          return null;
        }
      } else {
        Globals.showToastMethod(
            msg: "There is something went wrong. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("image uplaod exception: " + e.toString());
      return null;
    }
  }
}
