import 'dart:async';
import 'dart:developer';

import 'package:concard/Constants/globals.dart';
import 'package:concard/Controllers/Authentication/authentication.dart';
import 'package:concard/Controllers/Authentication/phone_number_verification.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../../../../widgets/customButton.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen(
      {Key? key,
      required this.sentCode,
      required this.type,
      required this.verifType})
      : super(key: key);
  final String? sentCode;
  final String? type;
  final String? verifType;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool? isSelected = false;

  int _Counter = 20;

  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    _Counter = 20;
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_Counter > 0) {
        setState(() {
          _Counter--;
        });
      } else {
        _timer!.cancel();
      }
    });
  }

  bool? isCodeOk = false;
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: Stack(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: size.height * 0.4,
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
                          ])),
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.07),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print("abc");
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 25,
                                // width: 30,
                                // color:Colors.red,
                                  margin:
                                      EdgeInsets.only(left: size.width * 0.04),
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: size.height * 0.025,
                                  )),
                            ),
                            SvgPicture.asset(
                              con_icon,
                              height: size.height * 0.1,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'C O N C A R D',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.02,
                                  fontFamily: "Mbold"),
                            ),
                            Text(
                              "Now You're Connected",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.015,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 230),
                      height: size.height * 0.8,
                      width: size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15))),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Text(
                            'The code has been sent to your ${widget.verifType}',
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontFamily: "Msemibold",
                                color: txtcolr),
                          ),
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          Visibility(
                            visible: !isCodeOk!,
                            child: FieldText(
                                validate: (String? value) {
                                  return '';
                                },
                                hinttxt: 'Enter Code',
                                controller: pinCodeController,
                                textInputType: TextInputType.phone,
                                pass: false),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Visibility(
                            visible: isCodeOk!,
                            child: Column(
                              children: [
                                FieldText(
                                    validate: (String? value) {
                                      return '';
                                    },
                                    hinttxt: 'Enter Your Register Email',
                                    controller: emailController,
                                    textInputType: TextInputType.phone,
                                    pass: false),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                FieldText(
                                    validate: (String? value) {
                                      return '';
                                    },
                                    hinttxt: 'New Password',
                                    controller: appPro.passwordControll,
                                    textInputType: TextInputType.phone,
                                    pass: false),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                FieldText(
                                    validate: (String? value) {
                                      return '';
                                    },
                                    hinttxt: 'Confirm New Password',
                                    controller: appPro.cPasswordControll,
                                    textInputType: TextInputType.phone,
                                    pass: false),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: !isCodeOk!,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.11,
                                  right: size.width * 0.11),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$_Counter:00',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        color: signupclor_dark,
                                        fontFamily: "Stf"),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (!context
                                          .read<AppProvider>()
                                          .isLoading!) {
                                        resendCode(widget.type!);
                                      }
                                    },
                                    child: Text(
                                      'Resend Code',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          color: signupclor_dark,
                                          fontFamily: "Stf"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.09),
                          //   child: Row(
                          //     children: [
                          //       Checkbox(
                          //         // checkColor: Colors.white,
                          //         fillColor: MaterialStateProperty.all(signupclor_dark),
                          //         value: isSelected,
                          //         shape: CircleBorder(),
                          //         onChanged: (bool? value) {
                          //           setState(() {
                          //             isSelected = value!;
                          //           });
                          //         },
                          //       ),
                          //       Text('Remember me',
                          //         style: TextStyle(
                          //             fontSize: size.height*0.015,
                          //             color: infocolor,
                          //             fontFamily: "Msemibold"
                          //         ),),
                          //       Spacer(),
                          //       GestureDetector(
                          //         onTap: () {
                          //           Navigator.of(context).push(MaterialPageRoute(
                          //               builder: (BuildContext context) => SignIn()));
                          //         },
                          //         child: Text('Forget password?',
                          //           style: TextStyle(
                          //               fontSize: size.height*0.015,
                          //               fontFamily: "Msemibold",
                          //               color: txtcolr
                          //           ),),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: size.height * 0.1,
                          ),
                          GestureDetector(
                              onTap: () {
                                if (!context.read<AppProvider>().isLoading!) {
                                  if (!isCodeOk!) {
                                    if (pinCodeController.text.trim().isEmpty ||
                                        pinCodeController.text == '') {
                                      showToastMethod(msg: "Please enter code");
                                    } else {
                                      context
                                          .read<AppProvider>()
                                          .setLoadingTrue();
                                      verifiedTheCodeMatching();
                                    }
                                  } else {
                                    if (appPro.passwordControll.text.isEmpty ||
                                        appPro.cPasswordControll.text.isEmpty ||
                                        emailController.text.isEmpty) {
                                      showToastMethod(
                                          msg: "Please fill all fields");
                                    } else if (appPro.passwordControll.text !=
                                        appPro.cPasswordControll.text) {
                                      showToastMethod(
                                          msg: "Password doesn't matched");
                                    } else {
                                      createNewPasswordFun(
                                          emailController.text,
                                          appPro.passwordControll.text,
                                          appPro.cPasswordControll.text,
                                          context);
                                    }
                                  }
                                }
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) => SignIn(),
                                //   ),
                                // );
                              },
                              child: CustomButton(
                                  text: isCodeOk!
                                      ? 'Change Password'
                                      : 'Verify Code',
                                  color1: signupclor_light,
                                  color2: signupclor_dark,
                                  textcolor1: bckgrnd,
                                  textcolor2: bckgrnd)),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            "Now You're Connected !",
                            style: TextStyle(
                                letterSpacing: 2,
                                fontSize: size.height * 0.015,
                                color: signupclor_dark,
                                fontFamily: 'Stf'),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
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
      await phone.verifyPhoneNumber(phoneNumber, context, "1");
    }
  }

  void verifiedTheCodeMatching() async {
    if (widget.verifType == "phone") {
      var appPro = Provider.of<AppProvider>(context, listen: false);
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
        context.read<AppProvider>().setLoadingFalse();
        setState(() {
          isCodeOk = true;
        });

        // Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false);

      } else {
        context.read<AppProvider>().setLoadingFalse();
      }
    } else {
      //for email verifcation
    }
  }

  createNewPasswordFun(String? email, String? password, String? cPassword,
      BuildContext context) async {
    context.read<AppProvider>().setLoadingTrue();
    var result = await AuthenticationClass()
        .createNewPassword(email, password, cPassword);
    context.read<AppProvider>().setLoadingFalse();
    if (result != null) {
      if (result['success']) {
        AppProvider().clearController();
        Navigator.pushNamedAndRemoveUntil(context, '/signIn', (route) => false);
        showToastMethod(msg: "Successfully Changed the password");
      } else {
        showToastMethod(msg: result['message']);
      }
    } else {
      showToastMethod(msg: "Email doesn't exist",toastGravity: ToastGravity.TOP);
    }
  }
}
