import 'dart:async';

import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/mobileVerification.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:concard/Views/widgets/signupAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../Constants/colors.dart';
import 'deviceIDScreen.dart';

class CodeVerification extends StatefulWidget {
  CodeVerification({Key? key,}) : super(key: key);

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  var controll=TextEditingController();

  PageController controller= PageController();

  int _Counter=20;

  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  void startTimer(){
    _Counter=20;
    _timer=Timer.periodic(Duration(seconds: 2), (timer) {
      if( _Counter > 0 ) {
        setState(() {
          _Counter--;
        });
      }  else {
        _timer!.cancel();
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SignupAppbar(text: 'Sign UP'),

              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.18),
              height: size.height*0.9,
              width: size.width,
              decoration: BoxDecoration(
                  color: bckgrnd,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
              ),
              child: Column(
                children: [
                  SizedBox(height: size.height*0.025,),
                  Text('Enter the verification Code',
                    style:TextStyle(
                        color: Colors.black,
                        fontSize: size.height*0.02,
                        fontFamily: 'Stf'
                    ),),
                  SizedBox(height: size.height*0.04,),
                  Container(
                    height: size.height*0.025,
                    width: size. width*0.18,

                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmoothPageIndicator(
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
                  ),
                  SizedBox(height: size.height*0.17,),
              Container(
                height: size.height * 0.05,
                width: size.width*0.8,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText:'Verification Code',
                      contentPadding:
                      EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                      hintStyle:
                      TextStyle(fontSize: size.height*0.015, color: infocolor,
                          fontFamily: "Stf"),
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                ),
              ),
                  SizedBox(height: size.height*0.02,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.11,right: size.width*0.11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$_Counter:00',
                        style: TextStyle(
                          fontSize: size.height*0.015,
                          color: signupclor_dark,
                          fontFamily: "Stf"
                        ),),
                        Text('Resend Code',
                        style: TextStyle(
                          fontSize: size.height*0.015,
                          color: signupclor_dark,
                          fontFamily: "Stf"
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height*0.1,),
                  Container(
                    margin: EdgeInsets.only(left: size.width*0.1,right: size.width*0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('By clicking Agree & join, you agree to the',style: TextStyle(
                          fontSize: size.height*0.017,
                          fontFamily: 'MsemiBold'
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                          Text('Concard',style: TextStyle(
                              fontSize: size.height*0.017,
                              fontFamily: 'Msemibold'
                          ),),
                          SizedBox(width: size.width*0.01,),
                          Text('User agreement',style: TextStyle(
                            color: cgreen,
                            fontSize:size.height*0.017,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Msemibold'
                          ),),
                          SizedBox(width: size.width*0.01,),
                          Text('and',style: TextStyle(
                          fontSize: size.height*0.017,
                              fontFamily: 'Msemibold'
                          ),),
                          SizedBox(width: size.width*0.01,),
                          Text('privacy policy',style: TextStyle(
                              color: cgreen,
                              fontSize:size.height*0.017,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Msemibold'
                          ),)
                        ],),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height*0.15,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.05,
                      width: size.width*0.8,
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
                            padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: size.height*0.03,
                                  width: size.width*0.02,
                                ),
                                Text(
                                  'Agree & Join',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.height*0.02,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Msemibold'),
                                ),
                                // SizedBox(
                                //   width: size.width * 0.23,
                                // ),
                                SvgPicture.asset(frwd_arrow,height: size.height*0.018,),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.03,
                  ),
                  Text("Let's Connect !",style: TextStyle(
                      letterSpacing: 2,
                      fontSize: size.height*0.015,
                      color: signupclor_light,
                      fontFamily: 'Stf'
                  ),)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
