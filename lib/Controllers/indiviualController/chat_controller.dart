import 'dart:developer';

import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Models/Indiviuals/chat_list_model.dart';
import 'package:concard/Models/Indiviuals/conversations_model.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatController {
  ServicesClass services = ServicesClass();
  LocalStorageClass localStorageClass = LocalStorageClass();
  Future getFollowings(String? email, String? password) async {
    try {
      var formData = FormData.fromMap({});

      var response = await services.postResponse(
          url: '/follow/following-list', formData: formData);
      if (response != null) {
        if (response['success']) {
          return response;
        } else {
          //status false
          Globals.showToastMethod(msg: response['message']);
          return null;
        }
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("login exception:" + e.toString());
      return null;
    }
  }

  Future getFollowers(String? email, String? password) async {
    try {
      var formData = FormData.fromMap({});

      var response = await services.postResponse(
          url: '/follow/follower-list', formData: formData);
      if (response != null) {
        if (response['success']) {
          return response;
        } else {
          //status false
          Globals.showToastMethod(msg: response['message']);
          return null;
        }
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("login exception:" + e.toString());
      return null;
    }
  }

  Future sendMessage(String? participantId, String? message) async {
    try {
      var formData = FormData.fromMap({
        'participant_id': participantId,
        'message': message,
      });

      var response = await services.postResponse(
          url: '/conversation/send-message', formData: formData);
          debugPrint("00000000000: "+response);
      if (response != null) {
        return true;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return false;
      }
    } catch (e) {
      debugPrint("send message exception:" + e.toString());
      return false;
    }
  }

  Future<ChatListModel?> getChatList(String? participentId) async {
    try {
      var formData = FormData.fromMap({"participant_id": participentId});
      var response = await services.postResponse(
          url: '/conversation/get-chat', formData: formData);

      if (response != null) {
        var finalList = ChatListModel.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      print("error in message :$e");
      return null;
    }
  }

  Future<ConversationsListModel?> getConversationsList() async {
    try {
      var formData = FormData.fromMap({
        
      });
      var response = await services.postResponse(
          url: '/conversation/list', formData: formData);

      if (response != null) {
        var finalList = ConversationsListModel.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      print("error in converstion:$e");
      return null;
    }
  }

  Future<ConversationsListModel?> searchConversationsList(String? search) async {
    try {
      var formData = FormData.fromMap({
        "search":search
      });
      var response = await services.postResponse(
          url: '/conversation/search-user', formData: formData);

      if (response != null) {
        var finalList = ConversationsListModel.fromJson(response);
        return finalList;
      }
      return null;
    } catch (e) {
      print("error in search converstion:$e");
      return null;
    }
  }

// Future<bool?> deleteConversation(int id,String tokenKey) async {

//       var tokenValue = await SharedPref().getToken(tokenKey);
//       try {
//       var response = await dio!.post('conversation/delete',
//           data: {'id': id},
//           options: Options(headers: {
//             'Authorization': 'Bearer $tokenValue',
//           }));
//       if (response.statusCode == 200) {
//         if (response.data['success']) {
//           return true;
//         } else {
//           return false;
//         }
//       }
//       return false;
//     } catch (e) {
//       print(e);
//       return false;
//     }
// }
}
