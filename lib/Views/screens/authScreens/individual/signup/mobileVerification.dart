import 'dart:async';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/codeVerification.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:concard/Views/widgets/signupAppbar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NumberVerification extends StatefulWidget {
   NumberVerification({Key? key}) : super(key: key);

  @override
  State<NumberVerification> createState() => _NumberVerificationState();
}

class _NumberVerificationState extends State<NumberVerification> {
  PageController controller= PageController();

  bool? value=false;
bool? hide=false;
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
                SignupAppbar(text: 'Sign Up'),
              ],
            ),
          Container(
            margin: EdgeInsets.only(top: size.height*0.18),
            height: size.height*0.8,
            width: size.width,
            decoration: BoxDecoration(
                color: bckgrnd,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
            ),
            child: Padding(
              padding: EdgeInsets.only(left: size.width*0.1,right: size.width*0.1),
              child: Column(
                children: [
                  SizedBox(height: size.height*0.025,),
                  Text('choose a verification method',
                    style:TextStyle(
                        color: Colors.black,
                        fontSize: size.height*0.02,
                        fontFamily: 'Stf'
                    ),),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: size.height*0.025,
                    width: size. width*0.18,

                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:    SmoothPageIndicator(
                      controller: controller,
                      count:  3,

                      axisDirection: Axis.horizontal,
                      effect:  ScrollingDotsEffect(
                        spacing:  10.0,
                        radius:  4.0,
                        dotWidth:  7.0,
                        dotHeight:  7.0,

                        paintStyle:  PaintingStyle.fill,
                        strokeWidth:  1.1,
                        dotColor: cgreen,
                        activeDotColor:  Colors.grey,
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
                  SizedBox(height: size.height*0.1),
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
                  SizedBox(height: size.height*0.3,),
                  CustomNextButton(text: 'Verify', image: frwd_arrow, color1: signupclor_light, color2: signupclor_dark, onTap: ()=>   Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeVerification())),),
                  SizedBox(height: size.height*0.03,),
                  Text("Almost There !",style: TextStyle(
                      letterSpacing: 2,
                      fontSize: size.height*0.015,
                      color: signupclor_light,
                      fontFamily: 'Stf'
                  ),)
                ],
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
