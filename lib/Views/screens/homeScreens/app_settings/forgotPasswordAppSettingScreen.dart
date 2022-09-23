import 'package:concard/Views/screens/authScreens/individual/signin/resetPasswordScreen.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/appSettingsScreen.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';

class ForgetPasswordAppSettingScreen extends StatefulWidget {
   ForgetPasswordAppSettingScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordAppSettingScreen> createState() => _ForgetPasswordAppSettingScreenState();
}

class _ForgetPasswordAppSettingScreenState extends State<ForgetPasswordAppSettingScreen> {
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
                   height: size.height * 0.09,
                          width: size.width * 0.85,
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
                            builder: (BuildContext context) => AppSettingsScreen()));
                            _sendcodeModalBottomSheet(context);
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
  void _sendcodeModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 0.55,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                        padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.03),
                    
                          
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'The code has been sent\nto your Email/Phone Number',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'MBold',
                                    color: signupclor_dark),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Current password',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "Stf",
                                  color: infocolor),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'New password',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "Stf",

                                  color:infocolor),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Retype new password',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "Stf",

                                  color: infocolor),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("02:00",style: TextStyle(
                              fontFamily: "Stf",
                              fontSize: size.height*0.015,
                              color: signupclor_dark
                            ),),
                            Text("Resend code",style: TextStyle(
                              fontFamily: "Stf",
                              fontSize: size.height*0.015,
                            color: signupclor_dark
                            ),),
                          ],
                        ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AppSettingsScreen())));
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          bottom: size.height * 0.1),
                                      // width: size.width*1.0,
                                      child: AlertDialog(
                                        insetPadding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
                                        backgroundColor: Color(0xffF7F7F7),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        title: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: txtcolr,
                                          child: Icon(Icons.check,size: size.height*0.03,color: bckgrnd,),
                                        ),
                                        content: Text(
                                          'Your Password has been successfully changed',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: 'Stf'),
                                        ),
                                        actions: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          AppSettingsScreen())));
                                            },
                                            child: Container(
                                              height: size.height * 0.05,
                                              width: size.width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: signupclor_dark),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.018,
                                                    fontFamily: 'MBold',
                                                    color: signupclor_dark),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.3),
                              height: size.height * 0.06,
                              width: size.width * 1.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    signupclor_light,
                                    signupclor_dark,
                                  ],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Reset',
                                  style: TextStyle(
                                    color: bckgrnd,
                                    fontFamily: 'MBold',
                                    fontSize: size.height * 0.018,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
