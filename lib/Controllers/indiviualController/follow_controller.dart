import 'package:concard/Constants/globals.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';

class FollowController {
  ServicesClass _services = ServicesClass();
  sendFollowRequest({required String id}) async {
    var formData = FormData.fromMap({
      'following_id': id,
    });
    try {
      var response = await _services.postResponse(url: '/follow/send-request', formData: formData);
      if (response['data']['status'] == 0) {
        showToastMethod(msg: "User Excluded");
      } else if (response['data']['status'] == 1) {
        showToastMethod(msg: "User Added");
      }
      return null;
    } catch (e) {
      showToastMethod(msg: "Something went wrong, Please try again Later");
      print("Follow Request Exception: " + e.toString());
      return null;
    }
  }
}
