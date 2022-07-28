import 'package:concard/Views/screens/authScreens/individual/signin/resetPasswordScreen.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/appSettingsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../../../../widgets/customButton.dart';

class ForgetPassword extends StatefulWidget {
   ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
   bool? isCheckedSms=false;
   bool? ischeckedEmail=false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: size.width*0.04),
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.arrow_back_ios,color: Colors.white,size: size.height*0.025,)),
                        ),
                        Image.asset(
                          forgtpsrd_icon,height: size.height*0.08,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Forget your password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.02,
                              fontFamily: "MBold"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "We got you back,",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height*0.015,
                              fontFamily: "Stf"
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Please enter your email or phone number",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height*0.015,
                            fontFamily: "Stf"
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 230),
              height: size.height * 0.7,
              width: size.width,
              decoration: BoxDecoration(
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
                    height: size.height*0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width*0.8,
                      child: TextFormField(
                        cursorColor: Colors.black,
                        showCursor: true,

                        decoration: InputDecoration(
                            hintText: 'oo ooo ooo 8892',
                            contentPadding: EdgeInsets.only(
                                top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle: TextStyle(
                                fontSize: size.height*0.015,
                                color: infocolor,
                                fontFamily: "Stf"),
                            suffixIcon:Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(txtcolr),
                              value: isCheckedSms,
                              shape: CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheckedSms = value!;
                                  ischeckedEmail=false;
                                });
                              },
                            ),
                            prefixIcon: Container(
                              width: 130,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Padding(
                                    padding:  EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(viasms_icon),
                                        SizedBox(width: 15,),
                                        Text("Via Sms",style: TextStyle(
                                          fontSize: size.height*0.015,
                                          color: txtcolr,
                                          fontFamily: "Msemibold"
                                        ),),
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
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width*0.8,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: '....37@gmail.com',
                            contentPadding: EdgeInsets.only(
                                top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                                TextStyle(fontSize: size.height*0.015, color: infocolor,
                                fontFamily: "Stf"),
                            suffixIcon:Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(txtcolr),
                              value: ischeckedEmail,
                              shape: CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  ischeckedEmail = value!;
                                  isCheckedSms=false;
                                });
                              },
                            ),
                            prefixIcon: Container(
                              width: 130,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Padding(
                                    padding:  EdgeInsets.only(left: 5),
                                    child: Row(
                                      children: [
                                        Image.asset(email_icon),
                                        SizedBox(width: 10,),
                                        Text("Via E-mail",style: TextStyle(
                                            fontSize: size.height*0.015,
                                            color: txtcolr,
                                          fontFamily: "Msemibold"
                                        ),),
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
                    height: size.height*0.3,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => ResetPasswordScreen()));
                      },
                      child: CustomButton(
                          text: 'Send Code',
                          color1: signupclor_light,
                          color2: signupclor_dark,
                          textcolor1: bckgrnd,
                          textcolor2: bckgrnd)),
                  SizedBox(
                    height: size.height*0.02,
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
  }
}
