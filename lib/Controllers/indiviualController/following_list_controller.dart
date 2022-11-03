import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Models/following_list_modal.dart';
import 'package:concard/Services/network.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../Models/post_list_modal.dart';

class FollowingController {
  ServicesClass services = ServicesClass();
  Future<FollowingListModal?> getFollowingRequest(String? id) async {
    try {
      var formData = FormData.fromMap({'following_id': id});
      var response = await services.postResponse(url: '/posts/list', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        FollowingListModal? followingListModal = FollowingListModal.fromJson(response);
        Globals.followingListModal = followingListModal;
        return followingListModal;
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("Add Following Exception:" + e.toString());
      return null;
    }
  }
}
