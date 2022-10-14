import 'package:concard/Models/Company/positions_model.dart';
import 'package:concard/Models/country_city_list.dart';
import 'package:concard/Models/employee_count.dart';
import 'package:concard/Models/industries_list.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:flutter/cupertino.dart';

class AboutCompnayController {
  ServicesClass services = ServicesClass();

  Future getPositions() async {
    try {
      var formData = FormData.fromMap({});

      var response = await services.postResponse(url: '/postion/list', formData: formData);
      if (response != null) {
        // print("Countr: "+response);
        Globals.positionModel = PositionModel.fromJson(response);
        var finalList = PositionModel.fromJson(response);
        return finalList;
      }
    } catch (e) {
      debugPrint("positions exception:" + e.toString());
      return null;
    }
  }

  Future getCountryCity() async {
    try {
      var formData = FormData.fromMap({});

      var response = await services.postResponse(url: '/countries', formData: formData);
      if (response != null) {
        // print("Countr: "+response);
        Globals.countryCityListModal = CountryCityListModal.fromJson(response);
        var finalList = CountryCityListModal.fromJson(response);
        return finalList;
      }
    } catch (e) {
      debugPrint("countries exception:" + e.toString());
      return null;
    }
  }

  Future getEmployeeCount() async {
    try {
      var formData = FormData.fromMap({});

      var response = await services.postResponse(url: '/no-of-employees', formData: formData);
      if (response != null) {
        // print("Employee: "+response);
        Globals.employeeCountListModal = EmployeeCountListModal.fromJson(response);
        var finalList = EmployeeCountListModal.fromJson(response);
        return finalList;
      }
    } catch (e) {
      debugPrint("employees exception:" + e.toString());
      return null;
    }
  }

  Future getIndustryList() async {
    try {
      var formData = FormData.fromMap({});

      var response = await services.postResponse(url: '/industries', formData: formData);
      if (response != null) {
        // print("Industries: "+response);

        Globals.industriesListModal = IndustriesListModal.fromJson(response);
        var finalList = IndustriesListModal.fromJson(response);
        return finalList;
      }
    } catch (e) {
      debugPrint("industries exception:" + e.toString());
      return null;
    }
  }
}
