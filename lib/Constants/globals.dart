library my_prj.globals;

import 'package:concard/Models/Cards/card_list_modal.dart';
import 'package:concard/Models/Company/positions_model.dart';
import 'package:concard/Models/country_city_list.dart';
import 'package:concard/Models/employee_count.dart';
import 'package:concard/Models/Expo/expo_detail_model.dart';
import 'package:concard/Models/following_list_modal.dart';
import 'package:concard/Models/industries_list.dart';
import 'package:concard/Models/post_list_modal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/Cards/add_card_modal.dart';
import '../Models/Expo/expo_filter_list_modal.dart';
import '../Models/Expo/expobadge_list_model.dart';

// String? baseUrl='http://localhost/sj-solutions/concard/api';
String? baseUrl = 'https://salloumdesign.com/concard/api';
String? token = '';
String? userType = '';
String? userId = '';
String? businessType = '';
String? id='1';
PostsListModal? postsListModal;
CountryCityListModal? countryCityListModal;
PositionModel? positionModel;
List<String>? positionsList = [];
List<String>? cities = [];
List<String>? citiesIds = [];
List<String>? countries = [];
List<String>? emploNumber = [];
List<String>? industries = [];
EmployeeCountListModal? employeeCountListModal;
IndustriesListModal? industriesListModal;
FollowingListModal? followingListModal;
ExpoBadgeListModal? expoBadgeListModal;
ExpoDetailModel? expoDetailModel;
ExpoFilterListModal? expoFilterListModal;
AddCardModal? addCardModal;
CardListModal? cardListModal;

showToastMethod({
  String? msg,
 

  ToastGravity toastGravity = ToastGravity.BOTTOM,
}) {
  Fluttertoast.showToast(
      msg: msg!,
      gravity: toastGravity,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 2);
}


//models objects
