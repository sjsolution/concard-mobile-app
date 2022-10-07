import 'package:concard/Models/Cards/add_card_modal.dart';
import 'package:concard/Models/Cards/card_list_modal.dart';
import 'package:concard/Services/network.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CardController {
  ServicesClass services = ServicesClass();

  Future<AddCardModal?> addCard(
    String? userName,
    String? jobTitle,
    String? companyName,
    String? website,
    String? positionName,
    String? workPhone,
    String? mobileNumber,
    String? email,
    String? city,
    String? province,
    String? country,
    String? day,
    String? month,
    String? year,
    String? postalCode,
    String? address,
    String? location,
    String? meetingDatetime,
  ) async {
    try {
      var formData = FormData.fromMap({
        'username':userName,
        'company_name': companyName,
        'website': website,
        'position_name': positionName,
        'work_phone': workPhone,
        'mobile_no': mobileNumber,
        'email': email,
        'city': city,
        'province': province,
        'country': country,
        'postal_code': postalCode,
        'address': address,
        'day':day,
        'month':month,
        'year':year,
        'location':location,
        'meeting_date_time':meetingDatetime
      });
      var response =
          await services.postResponse(url: '/card/save', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        AddCardModal? addCardModal = AddCardModal.fromJson(response);
        Globals.addCardModal = addCardModal;
        print('Filter By' + addCardModal.toString());
        print('Global var' + Globals.addCardModal.toString());

        return addCardModal;
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

    Future<CardListModal?> cardList(
   
  ) async {
    try {
      var formData = FormData.fromMap({
        
      });
      var response =
          await services.postResponse(url: '/card/list', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        CardListModal? cardListModal= CardListModal.fromJson(response);
        Globals.cardListModal = cardListModal;
        print('Card List' + cardListModal.toString());
        print('Global var' + Globals.addCardModal.toString());

        return cardListModal;
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
//Favourite Card List
   Future<CardListModal?> favouriteCardList(
   String? id
  ) async {
    try {
      var formData = FormData.fromMap({
        "id":id
      });
      var response =
          await services.postResponse(url: '/card/favourites', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        CardListModal? cardListModal= CardListModal.fromJson(response);
        Globals.cardListModal = cardListModal;
        print('Favourites Card Added SuccessFully' + cardListModal.toString());
        print('' + Globals.addCardModal.toString());

        return cardListModal;
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
