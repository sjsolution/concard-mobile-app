import 'dart:io';

import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Models/Indiviuals/social_links_model.dart';
import 'package:concard/Models/Indiviuals/team_detail_model.dart';
import 'package:concard/Models/Indiviuals/team_list_model.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TeamController {
  ServicesClass services = ServicesClass();
  LocalStorageClass localStorageClass = LocalStorageClass();

  Future addTeam({
    String? teamName,
    String? teamIcon,
    bool? inviteMembers,
    bool? addCards,
    bool? deleteSharedCard,
    bool? removeMembers,
  }) async {
    try {
      var formData = FormData.fromMap({
        'image': teamIcon!=''?await MultipartFile.fromFile(teamIcon!):teamIcon,
        'name': teamName,
        'invite_member': inviteMembers! ? 1 : 0,
        'add_card': addCards! ? 1 : 0,
        'delete_card': deleteSharedCard! ? 1 : 0,
        'delete_member': removeMembers! ? 1 : 0,
      });
      var response =
          await services.postResponse(url: '/team/store', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
          Globals.showToastMethod(msg: "${response['message']} Successfully!");

          // SocialLinksModel? socialLinksModel =
          //     SocialLinksModel.fromJson(response);
          return response;
        } else {
          //status false
          Globals.showToastMethod(msg: "Try again!");
          return null;
        }
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("add team exception:" + e.toString());
      return null;
    }
  }

  Future<TeamsListModel?> getTeamList() async {
    try {
      var formData = FormData.fromMap({});
      var response =
          await services.postResponse(url: '/team/list', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());
          Globals.teamsListModel = TeamsListModel.fromJson(response);
          return Globals.teamsListModel;
        } else {
          //status false
          Globals.showToastMethod(msg: "There is no team added yet");
          return null;
        }
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("get team exception:" + e.toString());
      return null;
    }
  }

  Future<TeamDetailModel?> getSingleTeamDetail(String? id) async {
    try {
      var formData = FormData.fromMap({});
      var response = await services.postResponse(
          url: '/team/show/$id', formData: formData);
      if (response != null) {
        debugPrint(response.toString());
        Globals.teamDetailModel = TeamDetailModel.fromJson(response);
        return Globals.teamDetailModel;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("get single team exception:" + e.toString());
      return null;
    }
  }

  Future joinTeam(String? id) async {
    try {
      var formData = FormData.fromMap({"id": id});
      var response = await services.postResponse(
          url: '/team/development-2', formData: formData);
      if (response != null) {
        if (response['data'] != null) {
          debugPrint(response.toString());

          // return socialLinksModel;
        } else {
          //status false
          Globals.showToastMethod(msg: "There is no team with that id");
          return null;
        }
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("join team exception:" + e.toString());
      return null;
    }
  }
}
