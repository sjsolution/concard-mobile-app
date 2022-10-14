import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Models/Company/ProductAndServicesModel.dart';

class ProductAndServicesController {
  ServicesClass services = ServicesClass();

  Future<ProductAndServicesModel?> getProductsAndServices() async {
    try {
      var formData = FormData.fromMap({});
      var response = await services.postResponse(url: '/product/list', formData: formData);
      if (response != null) {
        ProductAndServicesModel productAndServicesModel = ProductAndServicesModel.fromJson(response);
        Globals.productAndServicesModel = productAndServicesModel;
        return productAndServicesModel;
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("post list exception:" + e.toString());
      return null;
    }
  }

  Future<void> addProductAndServices({required String name}) async {
    try {
      var formData = FormData.fromMap({"name": name});
      var response = await services.postResponse(url: '/product/store', formData: formData);
      print(response);
      if (response != null) {
        Globals.showToastMethod(msg: "Record Added Successfully");
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
      }
    } catch (e) {
      debugPrint("post list exception:" + e.toString());
    }
  }
}
