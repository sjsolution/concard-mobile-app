import 'dart:async';
import 'dart:developer';

import 'package:concard/Controllers/Authentication/authentication.dart';
import 'package:concard/Controllers/Authentication/phone_number_verification.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/company/singnin/companySignIn.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../../individual/signin/singIn.dart';
import 'companySignupHomeScreen.dart';

class CompanyCodeVerificationScreen extends StatefulWidget {
  const CompanyCodeVerificationScreen(
      {Key? key,
      required this.sentCode,
      required this.type,
      required this.verifType})
      : super(key: key);
  final String? sentCode;
  final String? type;
  final String? verifType;

  @override
  _CompanyCodeVerificationScreenState createState() =>
      _CompanyCodeVerificationScreenState();
}

class _CompanyCodeVerificationScreenState
    extends State<CompanyCodeVerificationScreen> {
  var pinCodeController = TextEditingController();
  int _Counter = 20;
  PageController controller = PageController();
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    _Counter = 20;
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_Counter > 0) {
        setState(() {
          _Counter--;
        });
      } else {
        _timer!.cancel();
      }
    });
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
                    margin: EdgeInsets.only(top: size.height * 0.18),
                    height: size.height * 0.9,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: bckgrnd,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: const Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Text(
                          'Enter the verification Code',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.height * 0.02,
                              fontFamily: 'Stf'),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Container(
                          height: size.height * 0.025,
                          width: size.width * 0.18,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: 3,
                              axisDirection: Axis.horizontal,
                              effect: ScrollingDotsEffect(
                                spacing: 10.0,
                                radius: 4.0,
                                dotWidth: 7.0,
                                dotHeight: 7.0,
                                paintStyle: PaintingStyle.fill,
                                strokeWidth: 1.1,
                                dotColor: cgreen,
                                activeDotColor: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.17,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 40.0, bottom: 10),
                          child: Row(
                            children: [Text(widget.type.toString())],
                          ),
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.8,
                          child: TextField(
                            controller: pinCodeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Verification Code',
                                contentPadding: const EdgeInsets.only(
                                    top: 0.0, left: 22.0, bottom: 2.0),
                                hintStyle: TextStyle(
                                    fontSize: size.height * 0.015,
                                    color: infocolor,
                                    fontFamily: "Stf"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25))),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.11,
                              right: size.width * 0.11),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$_Counter:00',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    color: signupclor_dark,
                                    fontFamily: "Stf"),
                              ),
                              InkWell(
                                onTap: () {
                                  if (!context.read<AppProvider>().isLoading!) {
                                    resendCode(widget.type!);
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  // width:120,
                                  height: 30,
                                  // color:Colors.red,
                                  child: Text(
                                    'Resend Code',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        color: signupclor_dark,
                                        fontFamily: "Stf"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: size.width * 0.1, right: size.width * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'By clicking Agree & join, you agree to the',
                                style: TextStyle(
                                    fontSize: size.height * 0.017,
                                    fontFamily: 'MsemiBold'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Concard',
                                    style: TextStyle(
                                        fontSize: size.height * 0.017,
                                        fontFamily: 'Msemibold'),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Text(
                                    'User agreement',
                                    style: TextStyle(
                                        color: cgreen,
                                        fontSize: size.height * 0.017,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Msemibold'),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Text(
                                    'and',
                                    style: TextStyle(
                                        fontSize: size.height * 0.017,
                                        fontFamily: 'Msemibold'),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Text(
                                    'privacy policy',
                                    style: TextStyle(
                                        color: cgreen,
                                        fontSize: size.height * 0.017,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Msemibold'),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.15,
                        ),
                        InkWell(
                          onTap: () {
                            if (!context.read<AppProvider>().isLoading!) {
                              context.read<AppProvider>().setLoadingTrue();
                              verifiedTheCodeMatching();
                            }
                            // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height * 0.05,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      signupclor_light,
                                      signupclor_dark,
                                    ]),
                                border: Border.all(color: Colors.grey),
                                color: bckgrnd,
                                borderRadius: BorderRadius.circular(35)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.04,
                                      right: size.width * 0.04),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: size.height * 0.03,
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        'Agree & Join',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.height * 0.02,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Msemibold'),
                                      ),
                                      // SizedBox(
                                      //   width: size.width * 0.23,
                                      // ),
                                      SvgPicture.asset(
                                        frwd_arrow,
                                        height: size.height * 0.018,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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

  resendCode(String phoneNumber) async {
    if (context.read<AppProvider>().ischeckedEmail!) {
    } else {
      sendVerificationCode(phoneNumber);
    }
  }

  sendVerificationCode(String phoneNumber) async {
    context.read<AppProvider>().setLoadingTrue();
    if (context.read<AppProvider>().ischeckedEmail!) {
    } else {
      PhoneNumberVerification phone = PhoneNumberVerification();
      await phone.verifyPhoneNumber(phoneNumber, context, "2");
    }
  }

  void verifiedTheCodeMatching() async {
    var appPro = Provider.of<AppProvider>(context, listen: false);
    if (widget.verifType == "phone") {
      PhoneNumberVerification phone = PhoneNumberVerification();
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.sentCode!, smsCode: pinCodeController.text);
      // Sign the user in (or link) with the credential
      UserCredential userCredential =
          await phone.auth.signInWithCredential(credential);
      log("User :" + userCredential.user!.uid);
      log("User :" + userCredential.user!.toString());
      if (userCredential.user != null) {
        var result = await AuthenticationClass().companyRegistrtion(
            appPro.fNameControll.text.trim(),
            appPro.lNameControll.text.trim(),
            appPro.emailControll.text.trim(),
            appPro.countrCode + appPro.numberControll.text.trim(),
            appPro.passwordControll.text.trim(),
            Globals.userType,
            appPro.userPosition,
            appPro.companyWebsiteControll.text.trim(),
            appPro.companyNameControll.text.trim(),
            Globals.businessType,
            appPro.compnayId,
            appPro.employeeId,
            appPro.branchId,
            appPro.headquarterId);
        context.read<AppProvider>().setLoadingFalse();
        if (result!) {
          appPro.clearController();
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (BuildContext context) => SignIn()));
          Navigator.pushNamedAndRemoveUntil(
              context, '/signIn', (route) => false);
        } else {
          Globals.showToastMethod(
              msg: "Something went wrong. Resend code and try again");
        }
      } else {
        context.read<AppProvider>().setLoadingFalse();
      }
    } else {
      var result 
      = await AuthenticationClass()
          .verifyOTP(widget.type!.trim(), pinCodeController.text.trim());
      context.read<AppProvider>().setLoadingFalse();
      if (result != null) {
        if (result['success']) {
          context.read<AppProvider>().setLoadingTrue();
          var result = await AuthenticationClass().companyRegistrtion(
              appPro.fNameControll.text.trim(),
              appPro.lNameControll.text.trim(),
              appPro.emailControll.text.trim(),
              appPro.countrCode + appPro.numberControll.text.trim(),
              appPro.passwordControll.text.trim(),
              Globals.userType,
              appPro.userPosition,
              appPro.companyWebsiteControll.text.trim(),
              appPro.companyNameControll.text.trim(),
              Globals.businessType,
              appPro.compnayId,
              appPro.employeeId,
              appPro.branchId,
              appPro.headquarterId);
          context.read<AppProvider>().setLoadingFalse();
          if (result!) {
            appPro.clearController();
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (BuildContext context) => SignIn()));
            Navigator.pushNamedAndRemoveUntil(
                context, '/signIn', (route) => false);
          }
        } else {
          Globals.showToastMethod(msg: result['message']);
        }
      } else {
        Globals.showToastMethod(
            msg: "4: Something went wrong. Resend code and try again");
      }
      setState(() {});

      // print("email verify");
    }
  }
}
