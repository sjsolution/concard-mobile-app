import 'package:concard/Models/Cards/add_card_modal.dart';
import 'package:concard/Models/Cards/card_list_modal.dart';
import 'package:concard/Models/Cards/single_card_detail_modal.dart';
import 'package:concard/Models/RatingsModal/add_user_rating_modal.dart';
import 'package:concard/Models/RatingsModal/rating_list_modal.dart';
import 'package:concard/Services/network.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RatingController {
  ServicesClass services = ServicesClass();
  // Add rating
  Future<AddUserRatingModal?> addUserRating(
    String? commentText,
    String? rating,
    String? userId,
  ) async {
    try {
      var formData = FormData.fromMap({
        "text": commentText,
        "rate": rating,
        "user_id": userId,
      });
      var response =
          await services.postResponse(url: '/ratings/add', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        AddUserRatingModal? addUserRatingModal =
            AddUserRatingModal.fromJson(response);
        Globals.addUserRatingModal = addUserRatingModal;
        print('Add reviews' + addUserRatingModal.toString());
        print('Add Your Reviews' + Globals.addUserRatingModal.toString());

        return addUserRatingModal;
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

  //Rating List
  Future<RatingListModal?> ratingList(
    String? userId,
  ) async {
    try {
      var formData = FormData.fromMap({
        "user_id": userId,
      });
      var response =
          await services.postResponse(url: '/ratings/list', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        RatingListModal? ratingListModal =
            RatingListModal.fromJson(response);
        Globals.ratingListModal = ratingListModal;
        print('view reviews' + ratingListModal.toString());
        print('view' + Globals.ratingListModal.toString());

        return ratingListModal;
      } else {
        Globals.showToastMethod(
            msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("post list exception:" + e.toString());
      return null;
    }
  }
}
