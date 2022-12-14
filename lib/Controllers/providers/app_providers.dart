import 'package:concard/Constants/globals.dart' as Globals;
import 'dart:io';
import 'package:concard/Controllers/indiviualController/follow_controller.dart';
import 'package:concard/Models/Company/ProductAndServicesModel.dart';
import 'package:concard/Controllers/compnayControllers/product_and_services_controller.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Models/Indiviuals/team_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Models/post_list_modal.dart';
import '../compnayControllers/postController.dart';

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

  String? positionTitle;
  String? positionId;
  setPostionStauts(String value, String? id) {
    positionTitle = value;
    positionId = id;
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

  String? _isFollowing;

  get isFollowing => _isFollowing;

  set isFollowingUser(String id) {
    _isFollowing = id;
  }

  sendFollowRequest({String? id}) async {
    _isFollowing = await FollowController().sendFollowRequest(id: id.toString());
    notifyListeners();
  }

  ProductAndServicesModel? _productAndServices;

  ProductAndServicesModel? get productAndServicesModel => _productAndServices;

  getProductAndServices() async {
    _productAndServices = await ProductAndServicesController().getProductsAndServices();
    notifyListeners();
  }

  // PostsListModal? _postModel;
  List<Comments>? _comments;
  List<Comments>? get comments => _comments;
  set commentsSetter(List<Comments>? comment) {
    _comments = comment;
    notifyListeners();
  }

  IndividualProfileModel? _individualProfileModel;
  IndividualProfileModel? get individualProfileModel => _individualProfileModel;

  set setIndividualProfileModelProfileObj(IndividualProfileModel? obj) {
    _individualProfileModel = obj;
    notifyListeners();
  }

  PostsListModal? _postModel;
  PostsListModal? get postModel => _postModel;

  Future<PostsListModal?> getPostData(BuildContext context) async {
    _postModel = await PostController().getPostList(context);
    notifyListeners();
    return _postModel;
  }

  File? _postImage;
  File? get postImage => _postImage;
  setProfileImage(File? image) {
    _postImage = image;
    notifyListeners();
  }

  ///AddCard

  List<int>? isCommentLikeList = [];
  // Color commentLikeColor=Colors.blue;
  Color commentLikeColor = Colors.black;
  setCommentValue(int index, int value) {
    isCommentLikeList![index] = value;
    value == 1 ? commentLikeColor = Colors.blue : commentLikeColor = Colors.black;

    notifyListeners();
  }
}
