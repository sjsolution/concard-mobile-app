import 'dart:developer';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/globals.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/Authentication/authentication.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Models/Company/positions_model.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companySignupHomeScreen.dart';
import 'package:concard/Views/widgets/customDropDown.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:concard/Constants/colors.dart';
import 'package:concard/Controllers/compnayControllers/about_compnay.dart';
import 'package:concard/Models/country_city_list.dart';
import 'package:concard/Models/employee_count.dart';
import 'package:concard/Models/industries_list.dart';
import 'package:concard/Views/screens/authScreens/company/signup/aboutCompanySignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/cardDetails.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companMobileVerification.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companyAdminSignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companyCodeVerification.dart';
import 'package:concard/Views/screens/authScreens/company/signup/planSelection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import '../../../../widgets/fieldText.dart';

class CompanyAdminSignup extends StatefulWidget {
  CompanyAdminSignup({Key? key}) : super(key: key);

  @override
  State<CompanyAdminSignup> createState() => _CompanyAdminSignupState();
}

class _CompanyAdminSignupState extends State<CompanyAdminSignup> {
  List<String?> positionList = [
    'Select Position',
    'Manager',
    'CEO',
    'HR',
    'CTO'
  ];

  var formKey = GlobalKey<FormState>();

  RegExp? regex;

  getCities(int? countryId) {
    // log(countryId.toString());

    Globals.cities?.clear();
    Globals.countries?.clear();
    Globals.emploNumber?.clear();
    Globals.industries?.clear();

    for (Countries? country in Globals.countryCityListModal!.countries!) {
      Globals.countries!.add(country!.title!);
      // debugPrint(city.title.toString());
      List<Cities>? citiesList = country.cities!
          .where((element) => element.countryId == countryId.toString())
          .toList();
      for (Cities? city in citiesList) {
        Globals.cities!.add(city!.title!);
        // debugPrint(city.title.toString());
      }
    }
    for (NoOfEmployees? noOfEmployee
        in Globals.employeeCountListModal!.noOfEmployees!) {
      Globals.emploNumber!.add(noOfEmployee!.number!);
      // debugPrint(city.title.toString());
    }
    for (Industries? industries in Globals.industriesListModal!.industries!) {
      Globals.industries!.add(industries!.title!);
      // debugPrint(city.title.toString());
    }
    // debugPrint('---------------------------------');
    // print(Globals.cities!.toSet());
    // print('---------------------------------');

    // print(Globals.emploNumber!.toSet());

    // print('---------------------------------');
    // print(Globals.countries!.toSet());

    // print('---------------------------------');
    // print(Globals.industries!.toSet());
    // print('---------------------------------');
  }

  getPositions() async {
    Globals.positionsList?.clear();
    Globals.positionModel = await AboutCompnayController().getPositions();
    if (Globals.positionModel != null) {
      if (Globals.positionModel!.positions != null &&
          Globals.positionModel!.positions!.isNotEmpty) {
        for (Positions? posi in Globals.positionModel!.positions!) {
          Globals.positionsList!.add(posi!.title.toString());
        }
        debugPrint(Globals.positionsList.toString());
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  getSignUpData() async {
    Globals.countryCityListModal =
        await AboutCompnayController().getCountryCity();
    Globals.employeeCountListModal =
        await AboutCompnayController().getEmployeeCount();
    Globals.industriesListModal =
        await AboutCompnayController().getIndustryList();
    log(Globals.countryCityListModal.toString());
    getPositions();
    getCities(Globals.countryCityListModal!.countries!.first.id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getSignUpData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
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
                          Text(
                            "Who's the Admin",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontFamily: "MBold"),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          FieldText(
                              validate: (String? value) {
                                String pattern = r'^[A-Za-z]*$';
                                regex = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return "Enter first name";
                                } else if (!regex!.hasMatch(value)) {
                                  return 'Enter Valid name containes only letter';
                                }
                                return null;
                              },
                              hinttxt: "First Name",
                              controller: appPro.fNameControll,
                              textInputType: TextInputType.text,
                              pass: false),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          FieldText(
                              validate: (String? value) {
                                String pattern = r'^[A-Za-z]*$';
                                regex = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return "Enter last name";
                                } else if (!regex!.hasMatch(value)) {
                                  return 'Enter Valid name containes only letter';
                                }
                                return null;
                              },
                              hinttxt: "Last Name",
                              controller: appPro.lNameControll,
                              textInputType: TextInputType.text,
                              pass: false),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          FieldText(
                              validate: (String? value) {
                                //  String pattern = r'^[A-Za-z]*$';
                                //    regex = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return "Enter email";
                                } 
                                // else if (!value.contains('@gmail.com')) {
                                //   return 'Enter Valid email';
                                // }
                                return null;
                              },
                              hinttxt: "E-mail",
                              controller: appPro.emailControll,
                              textInputType: TextInputType.text,
                              pass: false),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          CustomDropDownButton(
                              hint: "Select Position",
                              listItems:
                                  Globals.positionsList!.toSet().toList(),
                              selectedValue: appPro.positionTitle,
                              onChanged: (value) {
                                String? id = Globals.positionModel!
                                    .positions![int.parse(value.toString())].id
                                    .toString();
                                print("position:" +
                                    value.toString() +
                                    "  ID:" +
                                    id);

                                appPro.setPostionStauts(value.toString(), id);
                              }),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: CountryCodePicker(
                                      padding: const EdgeInsets.all(0),
                                      onInit: (value) {
                                        // log(value.toString());
                                        // setInitCode(value.toString());
                                        // log("Before"+appPro.countrCode);
                                        appPro.countrCode = value.toString();
                                        // log("Afeter"+appPro.countrCode);
                                        //  context.read<AppProvider>().setCC(value);
                                      },
                                      onChanged: (value) {
                                        // log(value.toString());
                                        appPro.setCC(value.toString());
                                      },
                                      // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                      // initialSelection: 'IT',
                                      showFlag: false,
                                      favorite: const [
                                        '+961',
                                      ],
                                      textStyle: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: txtcolr),
                                      // optional. Shows only country name and flag
                                      showCountryOnly: false,
                                      // optional. Shows only country name and flag when popup is closed.
                                      showOnlyCountryWhenClosed: false,
                                      // optional. aligns the flag and the Text left
                                      // alignLeft: true,
                                    ),
                                    height: size.height * 0.05,
                                    width: size.width * 0.2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(color: infocolor)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Container(
                                height: size.height * 0.05,
                                width: size.width * 0.6,
                                child: FieldText(
                                    validate: (String? value) {
                                      String pattern = r'^[0-9]*$';
                                      regex = RegExp(pattern);
                                      if (value!.isEmpty) {
                                        return "Enter phone number";
                                      } else if (!regex!.hasMatch(value)) {
                                        return 'Enter Valid number containes only numbers';
                                      }
                                      return null;
                                    },
                                    hinttxt: "Phone Number",
                                    controller: appPro.numberControll,
                                    textInputType: TextInputType.phone,
                                    pass: false),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          FieldText(
                              validate: (String? value) {
                                String pattern = r'^[a-zA-Z0-9]*$';
                                regex = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return "Enter password";
                                }
                                // else if (!regex!.hasMatch(value)) {
                                //   return 'Enter Valid password (AlphaNummaric)';
                                // }
                                return null;
                              },
                              hinttxt: "Password",
                              controller: appPro.passwordControll,
                              textInputType: TextInputType.text,
                              pass: true),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          FieldText(
                              validate: (String? value) {
                                String pattern = r'^[A-Za-z0-9]*$';
                                regex = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return "Enter Confirm password";
                                }
                                //  else if (!regex!.hasMatch(value)) {
                                //   return 'Enter Valid password (AlphaNummaric)';
                                // }
                                else if (appPro.cPasswordControll.text !=
                                    appPro.passwordControll.text) {
                                  return 'Password not matched';
                                }
                                return null;
                              },
                              hinttxt: "Confirm Password",
                              controller: appPro.cPasswordControll,
                              textInputType: TextInputType.text,
                              pass: true),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          CustomNextButton(
                            text: 'Next',
                            image: frwd_arrow,
                            color1: signupclor_light,
                            color2: signupclor_dark,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                if (appPro.userPosition == 'Select Position') {
                                  showToastMethod(
                                      msg: "Please Select Position");
                                } else {
                                  context.read<AppProvider>().setLoadingTrue();
                                  var result = await AuthenticationClass()
                                      .verifyEmailExist(
                                          appPro.emailControll.text.trim());
                                  context.read<AppProvider>().setLoadingFalse();
                                  if (result != null) {
                                    if (!result['success']) {
                                      Navigator.pushNamed(
                                          context, '/aboutCompany');
                                    } else {
                                      Globals.showToastMethod(
                                          msg: result['message']);
                                    }
                                  } else {
                                    Globals.showToastMethod(
                                        msg:
                                            "Something went wrong try again later");
                                  }
                                }
                                // Navigator.pushNamed(context, '/indiCodeSend');
                              }

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AboutCompanySignup()));
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            context.read<AppProvider>().isLoading!
                ? Center(
                    child: SpinKitDualRing(color: primarygreen),
                  )
                : const SizedBox()
          ],
        ),
      );
    });
  }
}
