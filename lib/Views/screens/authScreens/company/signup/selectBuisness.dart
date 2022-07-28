import 'package:concard/Views/screens/authScreens/company/signup/companyAdminSignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companySignupHomeScreen.dart';
import 'package:concard/Views/screens/authScreens/company/singnin/compnaySignInScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../../../../widgets/customButton.dart';

class SelectBuisness extends StatelessWidget {
  const SelectBuisness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Container(
        height: size.height * 1.1,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  signupclor_light,
                  signupclor_dark,
                ])),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                children: [
                  SizedBox(height: size.height*0.07,),
                  Text('Company Sign up',style: TextStyle(
                    color: bckgrnd,
                    fontSize: size.height*0.02,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MBold'
                  )),
                  SizedBox(height: size.height*0.001,),
                  Text('Connect your employees',
                      style: TextStyle(
                          fontSize: size.height*0.015,
                        color: bckgrnd
                      ),),
                  SizedBox(height: size.height*0.025,),
                  Image.asset(small_b,height: size.height*0.2,),
                  SizedBox(height: size.height*0.02,),
                  Text('Small Buisness',style: TextStyle(
                      color: bckgrnd,
                      fontSize: size.height*0.02,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MBold'
                  )),
                  SizedBox(height: size.height*0.001,),
                  Text('Fewer than 200 employees',
                    style: TextStyle(
                        fontSize: size.height*0.015,
                        fontFamily: "Stf",
                        color: bckgrnd
                    ),),
                  SizedBox(height: size.height*0.02,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext cotext)=>CompanySignUpHomeScreen()));
                    },
                    child: CustomButton(
                        text: "Select",
                        color1: btnclr.withOpacity(0.3),
                        color2: btnclr.withOpacity(0.3),
                        textcolor1: bckgrnd,
                        textcolor2: bckgrnd),
                  ),
                  SizedBox(height: size.height*0.04,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.1,right: size.width*0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(top: size.height*0.07,left: size.width*0.028),
                          height: size.height * 0.001,
                          width: size.width * 0.35,
                          color: Colors.white.withOpacity(0.3)
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.045,
                              fontFamily: "Msemibold"),
                        ),
                        Container(
                          // margin: EdgeInsets.only(top: size.height*0.07,left: size.width*0.028),
                          height: size.height * 0.001,
                          width: size.width * 0.35,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Image.asset(circle,height: 150,),
                  SizedBox(height: 15),
                  Text('Medium to Large Business',style: TextStyle(
                      color: bckgrnd,
                      fontSize: size.height*0.02,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MBold'
                  )),
                  SizedBox(height: size.height*0.001,),
                  Text('More than 200 employees',
                    style: TextStyle(
                        fontSize: size.height*0.017,
                        color: bckgrnd
                    ),),
                  SizedBox(height: size.height*0.02
                    ,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>CompanySignUpHomeScreen()));
                    },
                    child: CustomButton(
                        text: "Select",
                        color1: btnclr.withOpacity(0.3),
                        color2: btnclr.withOpacity(0.3),
                        textcolor1: bckgrnd,
                        textcolor2: bckgrnd),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top:size.height*0.18),
                  child: Image.asset(large_b,height:size.height*0.13,))
            ],
          ),
        )
    ),
      ),
    );
  }
}
