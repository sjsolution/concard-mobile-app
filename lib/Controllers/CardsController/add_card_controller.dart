import 'package:concard/Models/add_card_modal.dart';
import 'package:concard/Services/network.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AddCardController {
  ServicesClass services = ServicesClass();

  Future<AddCardModal?> addCard(
    String? companyName,
    String? website,
    String? positionName,
    String? workPhone,
    String? mobileNumber,
    String? email,
    String? city,
    String? province,
    String? country,
    String? postalCode,
    String? address,
  ) async {
    try {
      var formData = FormData.fromMap({
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
        'address': address
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
}
