import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../../../../widgets/customNextButton.dart';
import '../../../../widgets/signupAppbar.dart';
import '../../individual/signup/codeVerification.dart';
import 'companySignupHomeScreen.dart';

class CompanyMobileVerification extends StatefulWidget {
  const CompanyMobileVerification({Key? key}) : super(key: key);

  @override
  _CompanyMobileVerificationState createState() => _CompanyMobileVerificationState();
}

class _CompanyMobileVerificationState extends State<CompanyMobileVerification> {
  PageController controller= PageController();

  bool? value=false;
  bool? hide=false;
  bool? isCheckedSms=false;
  bool? ischeckedEmail=false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
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

                SizedBox(height: size.height*0.35,),
                CustomNextButton(text: 'Verify', image: frwd_arrow, color1: signupclor_light, color2: signupclor_dark, onTap: (){
                  print("4444");
                  pageController.nextPage(duration: Duration(microseconds: 200), curve: Curves.bounceIn);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
