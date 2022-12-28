import 'package:concard/Models/notifications_model.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:concard/Constants/globals.dart' as Globals;
class NotificationControll{
  ServicesClass services = ServicesClass();
  Future<NotificationsListModel?> notificationList()async{
    try{
      var formData =FormData.fromMap({});
      var response = await services.postResponse(url: "/notification/list", formData: formData);
      if(response!=null){
        debugPrint(response.toString());
        NotificationsListModel notificationsListModel = NotificationsListModel.fromJson(response);
        Globals.notificationsListModel =notificationsListModel;
        print('new List'+notificationsListModel.toString());
        return notificationsListModel;
      }else{
        Globals.showToastMethod(msg: "There is something wnt wrong");
        return null;
      }
    } catch(e){
      debugPrint('New List of Notifications'+ e.toString());
    }
    return null;
  }
}

// class NotificationController {
//   ServicesClass services = ServicesClass();
//   Future<NotificationsListModel?> getNotification() async {
//     try {
//       var formData = FormData.fromMap({});
//       var response = await services.postResponse(
//           url: '/notification/list', formData: formData);
//       if (response != null) {
//       debugPrint(response.toString());
//       NotificationsListModel notificationsListModel= NotificationsListModel.fromJson(response);
//       Globals.notificationsListModel=notificationsListModel;
//        print('Notifications...' + notificationsListModel.toString());
//         print('Global var' + Globals.notificationsListModel.toString());
//         // Globals.showToastMethod(msg: response['message']);
//         return response;
//       } else {
//         Globals.showToastMethod(
//             msg: "There is something went worng. Please try again later");
//         return null;
//       }
//     } catch (e) {
//       debugPrint("set favourite  exception:" + e.toString());
//       return null;
//     }
//   }
// }