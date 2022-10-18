import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Controllers/storyController/story_controller.dart';
import 'package:concard/Controllers/providers/story_provider.dart';

class TextStatusAdd extends StatefulWidget {
  const TextStatusAdd({Key? key}) : super(key: key);

  @override
  State<TextStatusAdd> createState() => _TextStatusAddState();
}

class _TextStatusAddState extends State<TextStatusAdd> {
  TextEditingController _statusController = TextEditingController();

  @override
  void dispose() {
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              SizedBox(
                height: size.height,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Insert your message",
                  ),
                  scrollPadding: EdgeInsets.all(20.0),
                  keyboardType: TextInputType.multiline,
                  textAlign: TextAlign.center,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  autofocus: true,
                  controller: _statusController,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontSize: size.width * 0.1,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_statusController.text.isNotEmpty) {
                      await StoryController().addStory(text: _statusController.text);
                      StoryProvider().getStories();
                      Navigator.pop(context);
                    } else {
                      Globals.showToastMethod(msg: "Status can't be Empty");
                    }
                  },
                  child: Text("Send"),
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
