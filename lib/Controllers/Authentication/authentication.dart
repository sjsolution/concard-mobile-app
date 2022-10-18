import 'dart:developer';

import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthenticationClass {
  ServicesClass services = ServicesClass();
  LocalStorageClass localStorageClass = LocalStorageClass();
  Future login(String? email, String? password) async {
    try {
      var formData = FormData.fromMap({
        'email': email,
        'password': password,
      });

      var response = await services.postResponse(url: '/login', formData: formData);
      if (response != null) {
        print(response.toString());
        if (response['success']) {
          Globals.token = response['token'];

          Globals.userType = response['user_type'];

          Globals.userId = response['user']['id'].toString();

          Globals.profilePic = response['user']['profileImage'].toString();

          localStorageClass.setData(localStorageClass.tokenKey, response['token']);

          localStorageClass.setData(localStorageClass.userTypeKey, response['user_type']);

          localStorageClass.setData(localStorageClass.userIdKey, response['user']['id'].toString());

          Globals.showToastMethod(msg: "${response['message']}");
          return response;
        } else {
          //status false
          Globals.showToastMethod(msg: response['message']);
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

  Future<bool>? registrtion(String? firstName, String? lastName, String? email, String? phoneNumber, String? password, String? userType) async {
    try {
      var formData = FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'mobile_number': phoneNumber,
        'email': email,
        'password': password,
        'user_type': userType,
      });
      var response = await services.postResponse(url: '/register', formData: formData);
      if (response != null) {
        if (response['success']) {
          Globals.token = response['token'];

          Globals.userType = response['user_type'];

          Globals.userId = response['user']['id'].toString();

          localStorageClass.setData(localStorageClass.tokenKey, response['token']);

          localStorageClass.setData(localStorageClass.userTypeKey, response['user_type']);

          localStorageClass.setData(localStorageClass.userIdKey, response['user']['id'].toString());

          Globals.showToastMethod(msg: "${response['message']}");
          return true;
        } else {
          //if email or phone is allready exist
          Globals.showToastMethod(msg: "${response['message']}");
          return false;
        }
      } else {
        //if server or url not found or something else is happen
        Globals.showToastMethod(msg: "There is something went worng. Please try again later");
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool>? companyRegistrtion(
      String? firstName,
      String? lastName,
      String? email,
      String? phoneNumber,
      String? password,
      String? userType,
      String? position,
      String? webUrl,
      String? companytitle,
      String? businesstype,
      String? industriesId,
      String? emplNoId,
      String? branchId,
      String? headQuaterId) async {
    try {
      var formData = FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'mobile_number': phoneNumber,
        'password': password,
        'user_type': userType,
        'title': companytitle,
        'web_url': webUrl,
        'position': position,
        'business_type': businesstype,
        'industry_id': industriesId,
        'emp_no_id': emplNoId,
        'branch_id': branchId,
        'headquater_id': headQuaterId,
      });
      var response = await services.postResponse(url: '/register', formData: formData);
      if (response != null) {
        if (response['success']) {
          Globals.token = response['token'];
          Globals.userType = response['user_type'];
          localStorageClass.setData(localStorageClass.tokenKey, response['token']);
          localStorageClass.setData(localStorageClass.userTypeKey, response['user_type']);
          Globals.showToastMethod(msg: "${response['message']}");
          return true;
        } else {
          //if email or phone is allready exist
          Globals.showToastMethod(msg: "${response['message']}");
          return false;
        }
      } else {
        //if server or url not found or something else is happen
        Globals.showToastMethod(msg: "There is something went worng. Please try again later");
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  verifyEmailExist(String? email) async {
    try {
      var formData = FormData.fromMap({'email': email});
      final response = await services.postResponse(formData: formData, url: '/email-exist');
      // print( '${globals.baseurl}Customer/VerifyEmailAddress?email=$email');

      if (response != null) {
        print(response);
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // sendCode(String? email) async {
  //   try {
  //     var formData = FormData.fromMap({'email': email});
  //     final response =
  //         await service.postResponse(formData: formData, url: 'send-email-otp');
  //     // print( '${globals.baseurl}Customer/VerifyEmailAddress?email=$email');

  //     if (response != null) {
  //       return response;
  //     }
  //     return null;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

// forgetPassword
  verifyEmailAndSendOTP(String? email) async {
    try {
      var formData = FormData.fromMap({'email': email});
      final response = await services.postResponse(formData: formData, url: '/sendotp');
      // print( '${globals.baseurl}Customer/VerifyEmailAddress?email=$email');

      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  verifyOTP(String? email, String? otp) async {
    try {
      var formData = FormData.fromMap({'email': email, 'otp': otp});
      final response = await services.postResponse(formData: formData, url: '/verifyotp');
      // print( '${globals.baseurl}Customer/VerifyEmailAddress?email=$email');

      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  createNewPassword(String? email, String? password, String? cPassword) async {
    try {
      var formData = FormData.fromMap({'email': email, 'password': password, 'confirm_password': password});
      print(formData.fields);
      final response = await services.postResponse(formData: formData, url: '/reset-password');
      if (response != null) {
        return response;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
