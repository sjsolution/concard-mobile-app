import 'dart:async';
import 'dart:developer';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/globals.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/Authentication/authentication.dart';
import 'package:concard/Controllers/Authentication/phone_number_verification.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/codeVerification.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:concard/Views/widgets/signupAppbar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NumberVerification extends StatefulWidget {
  const NumberVerification({Key? key}) : super(key: key);

  //  const NumberVerification({Key? key,required this.email,required this.fName,required this.lName,required this.phoneNumber,required this.password,}) : super(key: key);
  // final String? fName;
  // final String? lName;
  // final String? email;
  // final String? phoneNumber;
  // final String? password;
  @override
  State<NumberVerification> createState() => _NumberVerificationState();
}

class _NumberVerificationState extends State<NumberVerification> {
  PageController controller = PageController();

  bool? value = false;
  bool? hide = false;

  @override
  void initState() {
    // TODO: implement initState
    // setValue();
    super.initState();
  }

  setValue() {
    var appPro = Provider.of<AppProvider>(context, listen: false);
    appPro.numberControll.text = appPro.countrCode + appPro.numberControll.text;
    appPro.emailControll.text = appPro.emailControll.text;
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
              Column(
                children: [
                  SignupAppbar(text: 'Sign Up'),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.18),
                // height: size.height * 0.8,
                width: size.width,
                decoration: BoxDecoration(
                    color: bckgrnd,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.1, right: size.width * 0.1),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        'choose a verification method',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: size.height * 0.02,
                            fontFamily: 'Stf'),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.025,
                        width: size.width * 0.18,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10)),
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
                      // Container(
                      //   height: size.height*0.06,
                      //   width: size.width,
                      //   child: Row(
                      //     children: [
                      //       Container(),
                      //       TextFormField(
                      //         maxLines: 1,
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: size.height * 0.1),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                           height: size.height * 0.09,
                          width: size.width * 0.85,
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
                                  value: appPro.isCheckedSms,
                                  shape: const CircleBorder(),
                                  onChanged: (bool? value) {
                                    context
                                        .read<AppProvider>()
                                        .setValue(value!, "sms");
                                  },
                                ),
                                prefixIcon: SizedBox(
                                  width: 130,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                          width: size.width * 0.85,
                          child: TextFormField(
                            controller: appPro.emailControll,
                            decoration: InputDecoration(
                                hintText: '....37@gmail.com',
                                contentPadding: const EdgeInsets.only(
                                    top: 0.0, left: 22.0, bottom: 2.0),
                                hintStyle: TextStyle(
                                    fontSize: size.height * 0.015,
                                    color: infocolor,
                                    fontFamily: "Stf"),
                                suffixIcon: Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(txtcolr),
                                  value: appPro.ischeckedEmail,
                                  shape: const CircleBorder(),
                                  onChanged: (bool? value) {
                                    context
                                        .read<AppProvider>()
                                        .setValue(value!, "email");
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
                      context.read<AppProvider>().isLoading!
                          ? Center(
                              child: SpinKitDualRing(color: primarygreen),
                            )
                          : CustomNextButton(
                              text: 'Verify',
                              image: frwd_arrow,
                              color1: signupclor_light,
                              color2: signupclor_dark,
                              onTap: () {
                                if (appPro.isCheckedSms! ||
                                    appPro.ischeckedEmail!) {
                                  //   log("Email:" +
                                  //     context
                                  //         .read<AppProvider>()
                                  //         .ischeckedEmail
                                  //         .toString());
                                  // log("SMS:" +
                                  //     context
                                  //         .read<AppProvider>()
                                  //         .isCheckedSms
                                  //         .toString());
                                  context.read<AppProvider>().setLoadingTrue();
                                  sendVerificationCode();
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => CodeVerification(sentCode: "",type: "",)));
                                } else {
                                  showToastMethod(
                                      msg:
                                          "Please choose where you want verificaation code");
                                }
                              },
                            ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "Almost There !",
                        style: TextStyle(
                            letterSpacing: 2,
                            fontSize: size.height * 0.015,
                            color: signupclor_light,
                            fontFamily: 'Stf'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  sendVerificationCode() async {
    if (context.read<AppProvider>().ischeckedEmail!) {
      var result = await AuthenticationClass().verifyEmailAndSendOTP(
          context.read<AppProvider>().emailControll.text.trim());
      context.read<AppProvider>().setLoadingFalse();
      if (result != null) {
        if (result['success']) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CodeVerification(
                      sentCode: '',
                      type:
                          context.read<AppProvider>().emailControll.text.trim(),
                      verifType: "email")));
          showToastMethod(msg: result['message']);
        } else {
          showToastMethod(msg: 'Mail not exist');
        }
      } else {
        showToastMethod(msg: 'Something went wrong. Try again later');
      }
    } else {
      PhoneNumberVerification phone = PhoneNumberVerification();
      await phone.verifyPhoneNumber(
          context.read<AppProvider>().countrCode +
              context.read<AppProvider>().numberControll.text,
          context,
          "1");
    }
  }
}
