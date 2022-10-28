import 'package:concard/Constants/globals.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;

class FollowController {
  ServicesClass _services = ServicesClass();
  sendFollowRequest({required String id}) async {
    print(Globals.token.toString());
    print("this is ID: ---------");
    print(id);
    var formData = FormData.fromMap({
      'id': id,
    });
    try {
      var response = await _services.postResponse(url: '/follow/send-request', formData: formData);
      if (response['data']['status'] == 0) {
        print("User Excluded_____________" + response['data']['status'].toString());
        showToastMethod(msg: "User Excluded");
      } else if (response['data']['status'] == 1) {
        print("user Added_____________" + response['data']['status'].toString());
        print(response['data']['status'].toString());
        showToastMethod(msg: "User Added");
      } else {
        print("something is fishy here");
      }
      return null;
    } catch (e) {
      showToastMethod(msg: "Something went wrong, Please try again Later");
      print("Follow Request Exception: " + e.toString());
      return null;
    }
  }
}
