import 'package:concard/Models/Cards/single_card_detail_modal.dart';
import 'package:concard/Services/network.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AddNotesController {
  ServicesClass services = ServicesClass();

  

  // Single Card Detail
    Future addNotes(
   String notesText,
   String? userId,
   String? noteId,
  ) async {
    try {
      var formData = FormData.fromMap({
        "text":notesText,
        "user_id":userId,
        "note_id":noteId
      });
      var response =
          await services.postResponse(url: '/notes/add', formData: formData);
      if (response != null) {
        print('My Notes' +response .toString());

        return response;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      // debugPrint("post list exception:" + e.toString());
      return null;
    }
  }


   
}
