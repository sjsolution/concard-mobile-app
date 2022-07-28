import 'package:concard/Views/screens/authScreens/company/singnin/companySignIn.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../../individual/signin/singIn.dart';
import 'companySignupHomeScreen.dart';

class CompanyCodeVerificationScreen extends StatefulWidget {
  const CompanyCodeVerificationScreen({Key? key}) : super(key: key);

  @override
  _CompanyCodeVerificationScreenState createState() => _CompanyCodeVerificationScreenState();
}

class _CompanyCodeVerificationScreenState extends State<CompanyCodeVerificationScreen> {
  var controll=TextEditingController();
  PageController controller= PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Stack(
        children: [
          Column(
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
              Text('Resend Code',
                style: TextStyle(
                    fontSize: size.height*0.015,
                    color: signupclor_dark,
                    fontFamily: "Stf"
                ),),
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
             CustomNextButton(text: 'Agree & Join', image: frwd_arrow, color1: signupclor_light, color2: signupclor_dark, onTap:  (){
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CompanySignInScreen()));
             })
            ],
          ),

        ],
      ),
    );
  }
}
