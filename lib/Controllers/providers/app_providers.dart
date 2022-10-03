import 'dart:io';

import 'package:concard/Constants/Colors.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppProvider extends ChangeNotifier {
  var fNameControll = TextEditingController();
  var lNameControll = TextEditingController();
  var emailControll = TextEditingController();
  var numberControll = TextEditingController();
  var passwordControll = TextEditingController();
  var cPasswordControll = TextEditingController();
  var countrCode = '';

/////////////  COmpany SIgn Up ///////////////
  var companyNameControll = TextEditingController();
  var companyWebsiteControll = TextEditingController();

  void clearController() {
    fNameControll.clear();
    lNameControll.clear();
    emailControll.clear();
    passwordControll.clear();
    cPasswordControll.clear();
    numberControll.clear();
    companyNameControll.clear();
    companyWebsiteControll.clear();
    notifyListeners();
  }

  bool? isCheckedSms = false;
  bool? ischeckedEmail = false;
  
  setValue(bool value, String? type) {
    switch (type) {
      case 'sms':
        {
          isCheckedSms = value;
          ischeckedEmail = false;
          notifyListeners();
          break;
        }
      case 'email':
        {
          isCheckedSms = false;
          ischeckedEmail = value;
          notifyListeners();
          break;
        }
    }
    notifyListeners();
  }

  void setCC(value) {
    countrCode = value;
    notifyListeners();
  }

  String? userPosition = 'Select Position';
  setPosition(String value) {
    userPosition = value;
    notifyListeners();
  }

  String? compnayField; //='Company Fields';
  String? compnayId; //='Company Fields';
  setcompnayField(String value, String? id) {
    compnayField = value;
    compnayId = id;

    notifyListeners();
  }

  String? employeeNumber; //='Employee Numbers';
  String? employeeId; //='Employee Numbers';
  setemployeeNumber(String value, String? id) {
    employeeNumber = value;
    employeeId = id;

    notifyListeners();
  }

  String? branchNumber; //='Branch City';
  String? branchId; //='Branch City';
  setbranchNumber(String value, String? id) {
    branchNumber = value;
    branchId = id;

    notifyListeners();
  }

  String? headquarterLocation; //='Headquarter Location';
  String? headquarterId; //='Headquarter Location';
  setheadquarterLocation(String value, String? id) {
    headquarterLocation = value;
    headquarterId = id;
    notifyListeners();
  }

  bool? isLoading = false;
  setLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  
 
  setLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  IndiviualProfileModel? _indiviualProfileModel;
  IndiviualProfileModel? get indiviualProfileModel => _indiviualProfileModel;

  setIndvProfileObj(IndiviualProfileModel? obj) {
    _indiviualProfileModel = obj;
    notifyListeners();
  }

   File? _postImage;
    File? get postImage=>_postImage;
    setProfileImage(File? image){
      _postImage=image;
      notifyListeners();
    }
    ///AddCard
    var compNameControl= TextEditingController();
    var websiteControll= TextEditingController();
    var postionNameControl= TextEditingController();
    var workPhoneControl = TextEditingController();
    var mobileNumberControl= TextEditingController();
    var emailControl= TextEditingController();
    var cityControl= TextEditingController();
    var provinceControl= TextEditingController();
    var countryControl= TextEditingController();
    var postalCodeControl= TextEditingController();
    var addressControl= TextEditingController();

     void clearAllController() {
    compNameControl.clear();
    websiteControll.clear();
    postionNameControl.clear();
    workPhoneControl.clear();
    mobileNumberControl.clear();
    emailControl.clear();
    cityControl.clear();
    provinceControl.clear();
    countryControl.clear();
    postalCodeControl.clear();
    addressControl.clear();
    notifyListeners();
  }

}
