import 'package:concard/Models/Expo/expo_detail_model.dart';
import 'package:concard/Services/network.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../Models/Expo/expo_filter_list_modal.dart';
import '../../Models/Expo/expobadge_list_model.dart';
import '../OthersController/sharedPrefController.dart';

class ExpoController {
  ServicesClass services = ServicesClass();
   Future<ExpoDetailModel?> getExpoBadgeDetail(String? id) async {
    try {
      var formData = FormData.fromMap({'id': id});
      var response = await services.postResponse(
          url: '/expobadge/detail', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        ExpoDetailModel? expoDetailModel =
            ExpoDetailModel.fromJson(response);
        Globals.expoDetailModel = expoDetailModel;
        // print('my badge' + expoDetailModel.toString());
        // print('Global var' + Globals.expoDetailModel.toString());

        return expoDetailModel;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      // debugPrint("post list exception:" + e.toString());
      return null;
    }
  }

  Future<ExpoBadgeListModal?> getExpoBadgeList() async {
    try {
      var formData = FormData.fromMap({});
      var response = await services.postResponse(
          url: '/expobadge/list', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        ExpoBadgeListModal? expoBadgeListModal =
            ExpoBadgeListModal.fromJson(response);
        Globals.expoBadgeListModal = expoBadgeListModal;
        print('my badge' + expoBadgeListModal.toString());
        print('Global var' + Globals.expoBadgeListModal.toString());

        return expoBadgeListModal;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      // debugPrint("post list exception:" + e.toString());
      return null;
    }
  }

  Future<ExpoFilterListModal?> expoBadgeFilter(String? filter) async {
    try {
      var formData = FormData.fromMap({'filter_by': filter});
      var response = await services.postResponse(
          url: '/expobadge/filter', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        ExpoFilterListModal? expoFilterListModal =
            ExpoFilterListModal.fromJson(response);
        Globals.expoFilterListModal = expoFilterListModal;
        // print('Filter By'+expoFilterListModal.toString());
        // print('Global var'+Globals.expoBadgeListModal.toString());

        return expoFilterListModal;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      // debugPrint("post list exception:" + e.toString());
      return null;
    }
  }
}
