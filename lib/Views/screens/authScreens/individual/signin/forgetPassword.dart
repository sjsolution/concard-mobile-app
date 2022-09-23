import 'package:concard/Constants/globals.dart';
import 'package:concard/Controllers/Authentication/authentication.dart';
import 'package:concard/Controllers/Authentication/phone_number_verification.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/resetPasswordScreen.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/appSettingsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../../../../widgets/customButton.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  bool? isCheckedSms = false;
  bool? ischeckedEmail = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
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
                      margin: EdgeInsets.only(top: size.height * 0.08),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin:
                                    EdgeInsets.only(left: size.width * 0.04),
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: size.height * 0.025,
                                )),
                          ),
                          Image.asset(
                            forgtpsrd_icon,
                            height: size.height * 0.08,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Forget your password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.02,
                                fontFamily: "MBold"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              "We got you back,",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Stf"),
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          Text(
                            "Please enter your email or phone number",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.015,
                                fontFamily: "Stf"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 230),
                height: size.height * 0.7,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Text(
                    //   'Sign In',
                    //   style: TextStyle(
                    //       fontSize: size.height * 0.025,
                    //       fontFamily: "Msemibold",
                    //       color: txtcolr),
                    // ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                      height: size.height * 0.09,
                        width: size.width * 0.8,
                        child: TextFormField(
                          controller: appPro.numberControll,
                          cursorColor: Colors.black,
                          showCursor: true,
                          decoration: InputDecoration(
                              hintText: 'oo ooo ooo 8892',
                              contentPadding: const EdgeInsets.only(
                                  top: 0.0, left: 22.0, bottom: 2.0),
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.015,
                                  color: infocolor,
                                  fontFamily: "Stf"),
                              suffixIcon: Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.all(txtcolr),
                                value: isCheckedSms,
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCheckedSms = value!;
                                    ischeckedEmail = false;
                                  });
                                },
                              ),
                              prefixIcon: Container(
                                width: 130,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Image.asset(viasms_icon),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Via Sms",
                                            style: TextStyle(
                                                fontSize: size.height * 0.015,
                                                color: txtcolr,
                                                fontFamily: "Msemibold"),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              // Row(
                              //   children: [
                              //     Image.asset(viasms_icon),
                              //     // Text("Via SMS",style: TextStyle(color: txtcolr),)
                              //   ],
                              // ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                         height: size.height * 0.09,
                        width: size.width * 0.8,
                        child: TextFormField(
                          controller: appPro.emailControll,
                          decoration: InputDecoration(
                              hintText: 'abc@gmail.com',
                              contentPadding: const EdgeInsets.only(
                                  top: 0.0, left: 22.0, bottom: 2.0),
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.015,
                                  color: infocolor,
                                  fontFamily: "Stf"),
                              suffixIcon: Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.all(txtcolr),
                                value: ischeckedEmail,
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    ischeckedEmail = value!;
                                    isCheckedSms = false;
                                  });
                                },
                              ),
                              prefixIcon: Container(
                                width: 130,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Image.asset(email_icon),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Via E-mail",
                                            style: TextStyle(
                                                fontSize: size.height * 0.015,
                                                color: txtcolr,
                                                fontFamily: "Msemibold"),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.3,
                    ),
                    GestureDetector(
                        onTap: () {
                          
                          if (isCheckedSms!) {
                            if (appPro.numberControll.text.isNotEmpty) {
                              if (appPro.numberControll.text.startsWith("+")) {
                                //move to nect screen with phone number and send code on it
                                context.read<AppProvider>().setLoadingTrue();
                                sendVerificationCode();
                              } else {
                                showToastMethod(
                                    msg:
                                        "Please enter country code with number");
                              }
                            } else {
                              showToastMethod(
                                  msg:
                                      "Please enter phone number or contineue to forgot password");
                            }
                          } else if (ischeckedEmail!) {
                            if (appPro.emailControll.text.isNotEmpty) {
                              if (appPro.emailControll.text.contains(".com")) {
                                context.read<AppProvider>().setLoadingTrue();
                                sendVerificationCode();
                                //move to next screen with mail and send code on it
                              } else {
                                showToastMethod(
                                    msg: "Please enter correct mail");
                              }
                            } else {
                              showToastMethod(
                                  msg:
                                      "Please enter email or contineue  to forgot password");
                            }
                          } else {
                            showToastMethod(
                                msg:
                                    "Please choose option by which you want to forgot password");
                          }

                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (BuildContext context) =>
                          //         const ResetPasswordScreen()));
                        },
                        child: context.read<AppProvider>().isLoading!
                            ? SizedBox(
                                // height: 20,
                                // width: 20,
                                child: Center(
                                    child: SpinKitCubeGrid(
                                  color: primarygreen,
                                )))
                            : CustomButton(
                                text: 'Send Code',
                                color1: signupclor_light,
                                color2: signupclor_dark,
                                textcolor1: bckgrnd,
                                textcolor2: bckgrnd)),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      "Return to Concard",
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: size.height * 0.015,
                          color: signupclor_dark,
                          fontFamily: 'Stf'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  sendVerificationCode() async {
    if (ischeckedEmail!) {
      print("email");
      var result = await AuthenticationClass().verifyEmailAndSendOTP(
          context.read<AppProvider>().emailControll.text.trim());
          context.read<AppProvider>().setLoadingFalse();
      if (result != null) {
        if (result['success']) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResetPasswordScreen(
                      sentCode: '',
                      type:
                          context.read<AppProvider>().emailControll.text.trim(),
                      verifType: "email")));
          showToastMethod(msg: result['message']);
        }
         else{
        showToastMethod(msg: 'Mail not exist');
      }
      }
      else{
        showToastMethod(msg: 'Something went wrong. Try again later');
      }
    } else {
      print("phone");

      PhoneNumberVerification phone = PhoneNumberVerification();
      await phone.verifyPhoneNumber(
          context.read<AppProvider>().numberControll.text, context, "3");
    }
  }
}
