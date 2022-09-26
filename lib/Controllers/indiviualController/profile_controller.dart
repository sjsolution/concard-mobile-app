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
      // debugPrint(response.toString());
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

  Future uplaodImage(String? image, String? key) async {
    try {
      var formData = FormData.fromMap({
        '$key': await MultipartFile.fromFile(image!),
      });
      var response = await services.postResponse(
          url: '/user/update-user', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
          Globals.showToastMethod(msg: "${response['message']}");
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

  Future updateProfile(
      {String? fName,
      String? lName,
      String? email,
      String? jobTitle,
      String? mobileNumber,
      // String? profile,
      // String? cardImg,
      // String? photo,
      // String? logo,

      String? compName,
      String? comWebsite,
      String? comField,
      String? workTel,
      String? city,
      String? state,
      String? country,
      String? postalCode,
      String? address,
      String? about,
      String? userType}) async {
    try {
      var formData = FormData.fromMap({
        'first_name': fName,
        'last_name': lName,
        'email': email,
        'job_title': jobTitle,
        'mobile_number': mobileNumber,
        'company_name': compName,
        'website': comWebsite,
        'company_field': comField,
        'work_tel': workTel,
        'city': city,
        'state': state,
        'country': country,
        'postal_code': postalCode,
        'address': address,
        'about': about,
        'user_type': userType,
      });
      var response = await services.postResponse(
          url: '/user/update-user', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
          Globals.showToastMethod(msg: "${response['message']}");
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
