import '../../Models/Indiviuals/story_model.dart';
import '../../Services/network.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'dart:io';

class StoryController {
  ServicesClass services = ServicesClass();

  Future<void> addStory({String? text, File? file}) async {
    try {
      var formData = FormData.fromMap({'text': text, 'image': text == null || text == '' ? await MultipartFile.fromFile(file!.path.toString()) : ''});
      print("this is text--------------------");
      print(text);
      var response = await services.postResponse(url: '/story/store', formData: formData);
      if (response != null) {
        print("Story Uploaded");
        Globals.showToastMethod(msg: "Status Uploaded");
        return null;
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("Story exception:" + e.toString());
      return null;
    }
  }

  Future<StoryModel?> getStories() async {
    try {
      var formData = FormData.fromMap({});
      var response = await services.postResponse(url: '/story/list', formData: formData);
      if (response != null) {
        // debugPrint("this is story response");
        // print(response.toString());
        StoryModel storyModel = StoryModel.fromJson(response);
        Globals.storyModel = storyModel;
        return storyModel;
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("Story exception:" + e.toString());
      return null;
    }
  }
}
