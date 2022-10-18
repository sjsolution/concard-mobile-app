import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:flutter/cupertino.dart';

class FavouriteController {
  ServicesClass services = ServicesClass();
  Future setFavourite(String? id) async {
    try {
      var formData = FormData.fromMap({"card_id": id});
      var response = await services.postResponse(
          url: '/card/favourites', formData: formData);
      if (response != null) {
      debugPrint(response.toString());
        Globals.showToastMethod(msg: response['message']);
        return response;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("set favourite  exception:" + e.toString());
      return null;
    }
  }
}
