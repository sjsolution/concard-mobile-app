import 'package:concard/Controllers/storyController/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:concard/Models/Indiviuals/story_model.dart';
import 'package:concard/Constants/globals.dart' as Globals;

class StoryProvider extends ChangeNotifier {
  StoryModel? _storyModel = StoryModel();

  StoryModel? get storyProvider => _storyModel;

  getStories() async {
    _storyModel = await StoryController().getStories();
    Globals.storyModel = _storyModel;
    notifyListeners();
  }
}
