import 'package:concard/Models/Cards/single_card_detail_modal.dart';
import 'package:concard/Models/Groups/add_card_to_group_modal.dart';
import 'package:concard/Models/Groups/group_card_list.dart';
import 'package:concard/Models/Groups/group_list_modal.dart';
import 'package:concard/Services/network.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GroupsController {
  ServicesClass services = ServicesClass();

  

  // Add new group
    Future addGroup(
   String groupName,
  ) async {
    try {
      var formData = FormData.fromMap({
        "name":groupName,
      });
      var response =
          await services.postResponse(url: '/group/save', formData: formData);
      if (response != null) {
        print('Group Name' +response .toString());

        return response;
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
// update Group 
 Future updateGroup(
   String groupName,
   int   groupId,
  ) async {
    try {
      var formData = FormData.fromMap({
        "name":groupName,
        "group_id":groupId
      });
      var response =
          await services.postResponse(url: '/group/update', formData: formData);
      if (response != null) {
        print('Group Name updated' +response .toString());

        return response;
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

// Group List

    Future<GroupListModal?> GroupsList(
      String sortBy,
      String searchGruop
  ) async {
    try {
      var formData = FormData.fromMap({
        'sort_by':sortBy,
        'search':searchGruop
      });
      var response =
          await services.postResponse(url: '/group/list', formData: formData);
      if (response != null) {
        print('Group Name' +response .toString());
         GroupListModal? groupListModal = GroupListModal.fromJson(response);
        Globals.groupListModal = groupListModal;
        print('Groups List' + groupListModal.toString());
        print('Group List ' + Globals.groupListModal.toString());
        return groupListModal;
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

  // search List 
  //  Future<GroupListModal?> searchGroupsList(
  //     String searchGruop
  // ) async {
  //   try {
  //     var formData = FormData.fromMap({
  //       'search':searchGruop
  //     });
  //     var response =
  //         await services.postResponse(url: '/group/list', formData: formData);
  //     if (response != null) {
  //       print('Group Name' +response .toString());
  //        GroupListModal? groupListModal = GroupListModal.fromJson(response);
  //       Globals.groupListModal = groupListModal;
  //       print('Groups List' + groupListModal.toString());
  //       print('Group List ' + Globals.groupListModal.toString());
  //       return groupListModal;
  //     } else {
  //       Globals.showToastMethod(
  //           msg: "There is something went worng. Please try again later");
  //       return null;
  //     }
  //   } catch (e) {
  //     debugPrint("post list exception:" + e.toString());
  //     return null;
  //   }
  // }

//Groups Cards List
Future<GroupCardsList?> groupsCardsList(
      int groupId,
      String searchGruop
  ) async {
    try {
      var formData = FormData.fromMap({
        'group_id':groupId,
        'search':searchGruop
      });
      var response =
          await services.postResponse(url: '/group/card-list', formData: formData);
      if (response != null) {
        print('Group Cards List' +response .toString());
         GroupCardsList? groupCardsList = GroupCardsList.fromJson(response);
        Globals.groupsCardsList = groupCardsList;
        print('Groups Cards List' + groupCardsList.toString());
        print('Group Cards List ' + Globals.groupsCardsList.toString());
        return groupCardsList;
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
// add Card to Group
Future<AddCardToGroupModal?> addCardToGroup(
      String groupId,
      String cardId
  ) async {
    try {
      var formData = FormData.fromMap({
        'group_id':groupId,
        'card_id':cardId
      });
      var response =
          await services.postResponse(url: '/group/card-list', formData: formData);
      if (response != null) {
        print('Group Cards List' +response .toString());
         AddCardToGroupModal? addCardToGroupModal = AddCardToGroupModal.fromJson(response);
        Globals.addCardsToGroupModal = addCardToGroupModal;
        print('Groups Cards List' + addCardToGroupModal.toString());
        print('Group Cards List ' + Globals.groupsCardsList.toString());
        return addCardToGroupModal;
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
