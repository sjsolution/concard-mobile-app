import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;

class ServicesClass {
  Dio dio = Dio(BaseOptions(
    // baseUrl: globals.localHost,
    baseUrl: Globals.baseUrl!,
    connectTimeout: 60000,
    receiveTimeout: 60000,
  ));

  Future getResponse({required String url}) async {
    try {
      final response = await dio.get(url,
          options: Options(headers: {
            'Authorization': 'Bearer ${Globals.token}',
          }));
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future postResponse(
      {required String url, required FormData formData, var params}) async {
    debugPrint(url);
    debugPrint(formData.fields.toString());
    debugPrint(formData.boundary.toString());
    debugPrint(params.toString());
    try {
      final response = await dio.post(url,
          data: formData,
          queryParameters: params,
          options: Options(headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Globals.token}',
          }));
      if (response.statusCode == 200) {
        // log("Response ::: $response");
        return response.data;
      } else if (response.statusCode == 400) {
        // log("Response ::: $response");
        return response.data;
      } else if (response.statusCode == 500) {
        Globals.showToastMethod(msg: "Internal server error");
        return null;
      } else if (response.statusCode == 404) {
        Globals.showToastMethod(msg: "This url is not found");
        return null;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
