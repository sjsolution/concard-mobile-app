library my_prj.globals;

import 'package:concard/Models/Cards/card_list_modal.dart';
import 'package:concard/Models/Cards/get_cards_for_team_specifically.dart';
import 'package:concard/Models/Cards/single_card_detail_modal.dart';
import 'package:concard/Models/Company/positions_model.dart';
import 'package:concard/Models/Cards/add_card_modal.dart';
import 'package:concard/Models/Groups/add_card_to_group_modal.dart';
import 'package:concard/Models/Groups/add_group_modal.dart';
import 'package:concard/Models/Groups/added_group_cards_list.dart';
import 'package:concard/Models/Groups/group_card_list.dart';
import 'package:concard/Models/Groups/group_list_modal.dart';
import 'package:concard/Models/Groups/search_groups_from_list.dart';
import 'package:concard/Models/Indiviuals/team_detail_model.dart';
import 'package:concard/Models/Indiviuals/team_list_model.dart';
import 'package:concard/Models/RatingsModal/add_user_rating_modal.dart';
import 'package:concard/Models/country_city_list.dart';
import 'package:concard/Models/employee_count.dart';
import 'package:concard/Models/Expo/expo_detail_model.dart';
import 'package:concard/Models/following_list_modal.dart';
import 'package:concard/Models/industries_list.dart';
import 'package:concard/Models/post_list_modal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Models/Cards/get_cards_for_groups_modals.dart';
import '../Models/Expo/expo_filter_list_modal.dart';
import '../Models/Expo/expobadge_list_model.dart';
import '../Models/Indiviuals/story_model.dart';
import 'package:concard/Models/Company/ProductAndServicesModel.dart';

import '../Models/RatingsModal/rating_list_modal.dart';
import '../Models/notifications_model.dart';

// String? baseUrl = 'http://localhost/sj-solutions/concard/api';

// String? baseUrl = 'https://salloumdesign.com/concard/api';
String? baseUrl = 'https://sjsolutionz.com/concard/api';
String? token = '';
String? userType = '';
String? userId = '';
String? businessType = '';
String? id = '1';
String? profilePic = '';
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
AddCardModel? addCardModal;
GetCardsForTeam? getCardListForTeam;
GetCardsForGroup? getCardListForGroup;
CardListModal? cardListModal;
TeamsListModel? teamsListModel;
TeamDetailModel? teamDetailModel;
SingleCardDetailModal? singleCardDetailModal;
StoryModel? storyModel;
ProductAndServicesModel? productAndServicesModel;
AddUserRatingModal? addUserRatingModal;
RatingListModal? ratingListModal;
AddGroupModal? addGroup;
GroupListModal? groupListModal;
SearchGroupsFromList? searchGroupsFromListModal;
GroupCardsList? groupsCardsList;
AddCardToGroupModal? addCardsToGroupModal;
AddedCardsToGroupListModal? addedCardsToGroupListModal;
NotificationsListModel? notificationsListModel;
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
