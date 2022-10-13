import '../../Models/Indiviuals/story_model.dart';
import '../../Services/network.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:concard/Constants/globals.dart' as Globals;

class StoryController {
  ServicesClass services = ServicesClass();

  Future<StoryModel?> getStories() async {
    try {
      var formData = FormData.fromMap({});
      var response =
          await services.postResponse(url: '/story/list', formData: formData);
      if (response != null) {
        debugPrint("this is story response");
        print(response.toString());
        StoryModel storyModel = StoryModel.fromJson(response);
        Globals.storyModel = storyModel;
        return storyModel;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("Story exception:" + e.toString());
      return null;
    }
  }
}
