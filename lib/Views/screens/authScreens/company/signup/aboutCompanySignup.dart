import 'dart:developer';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Models/country_city_list.dart';
import 'package:concard/Models/employee_count.dart';
import 'package:concard/Models/industries_list.dart';
import 'package:concard/Views/widgets/customDropDown.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import '../../../../widgets/customContainer.dart';
import 'companySignupHomeScreen.dart';

class AboutCompanySignup extends StatefulWidget {
  AboutCompanySignup({Key? key}) : super(key: key);

  @override
  State<AboutCompanySignup> createState() => _AboutCompanySignupState();
}

class _AboutCompanySignupState extends State<AboutCompanySignup> {
  var formKey = GlobalKey<FormState>();

  RegExp? regex;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  List<Cities>? citiesList = [];
  getCities(int? countryId) {
    // log(countryId.toString());
    Globals.cities?.clear();
    Globals.countries?.clear();
    citiesList!.clear();
    for (Countries? country in Globals.countryCityListModal!.countries!) {
      Globals.countries!.add(country!.title!);
      // debugPrint(city.title.toString());
      citiesList = country.cities!
          .where((element) => element.countryId == countryId.toString())
          .toList();
      for (Cities? city in citiesList!) {
        Globals.cities!.add(city!.title!);
        Globals.citiesIds!.add(city.id!.toString());
        // debugPrint(city.title.toString());
      }
    }
    // print('---------------------------------');
    // print(Globals.citiesIds!.toString());
    // print('---------------------------------');
    // print(Globals.cities!.toSet());
    // print('---------------------------------');
    // print(Globals.countries!.toSet());
    // print('---------------------------------');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        primaryblue,
                        primarycolor,
                        prmryblue,
                        primarygreen
                      ]),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: bckgrnd,
                              size: size.height * 0.03,
                            ),
                          ),
                          Text(
                            'Company Sign Up',
                            style: TextStyle(
                                fontSize: size.height * 0.025,
                                fontFamily: "Msemibold",
                                color: bckgrnd),
                          ),
                          Container(
                            // color:Colors.pink,
                            height: size.height * 0.03,
                            width: size.width * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                margin: EdgeInsets.only(top: size.height * 0.18),
                padding: EdgeInsets.only(
                    left: size.height * 0.03, right: size.height * 0.03),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    color: bckgrnd),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          "About the Company",
                          style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontFamily: "MBold"),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.07,
                      ),
                      SizedBox(
                        height: size.height * 0.09,
                        width: size.width * 0.8,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter company name";
                            }
                            return null;
                          },
                          controller: appPro.companyNameControll,
                          decoration: InputDecoration(
                              hintText: 'company',
                              contentPadding: const EdgeInsets.only(
                                  top: 0.0, left: 22.0, bottom: 2.0),
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.015,
                                  color: infocolor,
                                  fontFamily: "Stf"),
                              suffixIcon: Image.asset(
                                office,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        height: size.height * 0.09,
                        width: size.width * 0.8,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter website url";
                            }
                            return null;
                          },
                          controller: appPro.companyWebsiteControll,
                          decoration: InputDecoration(
                              hintText: 'website(https://)',
                              contentPadding: const EdgeInsets.only(
                                  top: 0.0, left: 22.0, bottom: 2.0),
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.015,
                                  color: infocolor,
                                  fontFamily: "Stf"),
                              suffixIcon: const Icon(Icons.link),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      CustomDropDownButton(
                          hint: "Select Headquarter",
                          listItems: Globals.countries!.toSet().toList(),
                          selectedValue: appPro.headquarterLocation,
                          onChanged: (value) {
                            print("HEad:" + value.toString());

                            List<Countries>? country = Globals
                                .countryCityListModal!.countries!
                                .where((element) =>
                                    element.title ==
                                    Globals.countries![int.parse(value!)])
                                .toList();
                            // log(country.first.id.toString());
                             print("Select Country:" + Globals.countries![int.parse(value!)]);
                            appPro.setheadquarterLocation(
                                value, country.first.id.toString());
                                
                            getCities(country.first.id);
                            // debugPrint(country.toString());
                            // debugPrint(country.first.id.toString());
                          }),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      CustomDropDownButton(
                          hint: "Select Branch Number",
                          listItems: Globals.cities!.toSet().toList(),
                          selectedValue: appPro.branchNumber,
                          onChanged: (value) {
                            // print("Select Branch id:" + value.toString());
                           
                            print("Select City:" + Globals.cities![int.parse(value!)].toString());
                            print("Select City id:" + Globals.citiesIds![int.parse(value)]);
                            // Globals.citiesIds![int.parse(value)];
                            // List<Cities>? cities = citiesList!
                            //     .where((element) =>
                            //         element.title ==
                            //         Globals.cities![int.parse(value!)])
                            //     .toList();
                            appPro.setbranchNumber(
                                value, Globals.citiesIds![int.parse(value)]);
                          }),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      CustomDropDownButton(
                          hint: "Select Company/ Field",
                          listItems: Globals.industries!.toSet().toList(),
                          selectedValue: appPro.compnayField,
                          onChanged: (value) {
                            List<Industries> industries = Globals
                                .industriesListModal!.industries!
                                .where((element) =>
                                    element.title ==
                                    Globals.industries![int.parse(value!)])
                                .toList();
                            appPro.setcompnayField(
                                value!, industries.first.id.toString());
                          }),
                      SizedBox(
                        height: size.height * 0.02,
                      ),

                      CustomDropDownButton(
                          hint: "Select Employee Number",
                          listItems: Globals.emploNumber!.toSet().toList(),
                          selectedValue: appPro.employeeNumber,
                          onChanged: (value) {
                            List<NoOfEmployees> noOfEmployees = Globals
                                .employeeCountListModal!.noOfEmployees!
                                .where((element) =>
                                    element.number ==
                                    Globals.emploNumber![int.parse(value!)])
                                .toList();
                            appPro.setemployeeNumber(
                                value!, noOfEmployees.first.id.toString());
                          }),

                      SizedBox(
                        height: size.height * 0.07,
                      ),

                      // CustomConatiner(
                      //   color1: txtcolr,
                      //   txt: 'Company field / industry',
                      //   color2: cgreen,
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // CustomConatiner(
                      //   color1: txtcolr,
                      //   txt: 'Employees number',
                      //   color2: cgreen,
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30),
                      //       gradient: LinearGradient(
                      //           begin: Alignment.topCenter,
                      //           end: Alignment.bottomCenter,
                      //           colors: [txtcolr, cgreen]),
                      //     ),
                      //     height: size.height * 0.05,
                      //     width: size.width * 0.8,
                      //     child: Padding(
                      //       padding: EdgeInsets.only(
                      //           left: size.width * 0.03, right: size.width * 0.04),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //         children: [
                      //           Image.asset(
                      //             office,
                      //             color: Colors.white,
                      //           ),
                      //           const SizedBox(
                      //             width: 6,
                      //           ),
                      //           Text(
                      //             'Branches number',
                      //             style: TextStyle(
                      //                 fontSize: size.height * 0.015,
                      //                 color: Colors.white,
                      //                 fontFamily: "Stf"),
                      //           ),
                      //           const Spacer(),
                      //           Image.asset(
                      //             downarrow_icon,
                      //             color: bckgrnd,
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // CustomConatiner(
                      //     txt: 'Headquarter locations',
                      //     color1: txtcolr,
                      //     color2: cgreen),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30),
                      //     gradient: LinearGradient(
                      //         begin: Alignment.topCenter,
                      //         end: Alignment.bottomCenter,
                      //         colors: [txtcolr, cgreen]),
                      //   ),
                      //   height: size.height * 0.05,
                      //   width: size.width * 0.8,
                      //   child: Padding(
                      //     padding: EdgeInsets.only(
                      //         left: size.width * 0.03, right: size.width * 0.04),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         Image.asset(
                      //           group,
                      //           color: Colors.white,
                      //         ),
                      //         const SizedBox(
                      //           width: 6,
                      //         ),
                      //         const Text(
                      //           'Branches number',
                      //           style:
                      //               const TextStyle(fontSize: 14, color: Colors.white),
                      //         ),
                      //         const Spacer(),
                      //         Image.asset(
                      //           downarrow_icon,
                      //           color: bckgrnd,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.07,
                      // ),
                      CustomNextButton(
                          text: 'Next',
                          image: frwd_arrow,
                          color1: signupclor_light,
                          color2: signupclor_dark,
                          onTap: () {
                            
                            if (formKey.currentState!.validate()) {
                              if (appPro.headquarterLocation != null &&
                                  appPro.compnayField != null &&
                                  appPro.employeeNumber != null &&
                                  appPro.branchNumber != null) {
                                Navigator.pushNamed(
                                    context, '/companyMobileVeri');
                              } else {
                                Globals.showToastMethod(
                                    msg: "Please select all the dropdownmenu");
                              }
                            }
                            // print("4444");
                            // pageController.nextPage(
                            //     duration: const Duration(microseconds: 200),
                            //     curve: Curves.bounceIn);
                          }),
                      SizedBox(
                        height: size.height * 0.1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
