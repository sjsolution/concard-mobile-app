import 'dart:developer';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/globals.dart';
import 'package:concard/Constants/images.dart';import 'package:concard/Controllers/Authentication/authentication.dart';
import 'package:concard/Controllers/Authentication/phone_number_verification.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/mobileVerification.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:concard/Views/widgets/signupAppbar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndividualBasicDetail extends StatelessWidget {
  // PageController controller= PageController();
  int cIndex = 0;

  IndividualBasicDetail({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  RegExp? regex;
  setInitCode(String value) {}
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
                  Column(
                    children: [
                      SignupAppbar(
                        text: 'Sign up',
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.18),
                    height: size.height * 0.9,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: bckgrnd,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        )),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Text(
                            'Enter the following \n  details to sign up',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontFamily: 'Stf'),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          // Container(
                          //   height: size.height*0.025,
                          //   width: size. width*0.18,
                          //
                          //   decoration: BoxDecoration(
                          //       color: Colors.grey.withOpacity(0.15),
                          //       borderRadius: BorderRadius.circular(10)
                          //   ),
                          //   child:    Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: SmoothPageIndicator(
                          //       controller: controller,
                          //       count:  3,
                          //       axisDirection: Axis.horizontal,
                          //       effect:  ScrollingDotsEffect(
                          //         spacing:  10.0,
                          //         radius:  4.0,
                          //         dotWidth:  7.0,
                          //         dotHeight:  7.0,
                          //         paintStyle:  PaintingStyle.fill,
                          //         strokeWidth:  1.1,
                          //         // dotColor: Colors.grey.withOpacity(0.25),
                          //         activeDotColor:  cIndex>=inde?cgreen:Colors.grey.withOpacity(0.25),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: size.height * 0.05,
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
                                } else if (!value.contains('@gmail.com')) {
                                  return 'Enter Valid email';
                                }
                                return null;
                              },
                              hinttxt: "E-mail",
                              controller: appPro.emailControll,
                              textInputType: TextInputType.text,
                              pass: false),
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
                                // String pattern = r'^[a-zA-Z0-9]*$';
                                // regex = RegExp(pattern);
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
                                // String pattern = r'^[A-Za-z0-9]*$';
                                // regex = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return "Enter Confirm password";
                                }
                                // else if (!regex!.hasMatch(value)) {
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
                            height: size.height * 0.1,
                          ),
                          CustomNextButton(
                            text: "Next",
                            image: frwd_arrow,
                            color1: signupclor_light,
                            color2: signupclor_dark,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                context.read<AppProvider>().setLoadingTrue();
                                var result = await AuthenticationClass()
                                    .verifyEmailExist(
                                        appPro.emailControll.text.trim());
                                context.read<AppProvider>().setLoadingFalse();
                                if (!result['success']) {
                                  Navigator.pushNamed(context, '/indiCodeSend');
                                } else {
                                  showToastMethod(msg: result['message']);
                                }
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>const NumberVerification()));

                              }
                            },
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            "Let's Connect !",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: size.height * 0.015,
                                color: signupclor_light,
                                fontFamily: 'Stf'),
                          )
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
