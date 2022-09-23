library my_prj.globals;

import 'package:concard/Models/country_city_list.dart';
import 'package:concard/Models/employee_count.dart';
import 'package:concard/Models/industries_list.dart';
import 'package:concard/Models/post_list_modal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// String? baseUrl='http://localhost/sj-solutions/concard/api';
String? baseUrl = 'https://salloumdesign.com/concard/api';
String? token = '';
String? userType = '';
String? userId = '';
String? businessType = '';

PostsListModal? postsListModal;
CountryCityListModal? countryCityListModal;
List<String>? cities = [];
List<String>? citiesIds = [];
List<String>? countries = [];
List<String>? emploNumber = [];
List<String>? industries = [];
EmployeeCountListModal? employeeCountListModal;
IndustriesListModal? industriesListModal;

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
