import 'package:concard/Constants/globals.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';

class FollowController {
  Future<void>? sendFollowRequest({required String id}) {
    ServicesClass _services = ServicesClass();
    try {
      var formData = FormData.fromMap({
        'id': id,
      });
      var response = _services.postResponse(url: '/follow/send-request', formData: formData);
      return response;
    } catch (e) {
      showToastMethod(msg: "Something went wrong, Please try again Later");
      print("Follow Request Exception: " + e.toString());
      return null;
    }
  }
}
