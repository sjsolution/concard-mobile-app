import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/company/signup/selectBuisness.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/indiviualSignUpHomeScreen.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/signupDetail.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:flutter/material.dart';

class SignupIndividual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 1.0,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                signupclor_light,
                signupclor_dark,
              ])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: size.height * 0.08),
                    child: Image.asset(
                      indiv_img,
                      height: size.height * 0.2,
                    )),
                SizedBox(
                  height: size.height * 0.03,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              IndiSignupHomeScreen()));
                    },
                    child: CustomButton(
                        text: "Individual",
                        color1: btnclr.withOpacity(0.3),
                        color2: btnclr.withOpacity(0.3),
                        textcolor1: Colors.white,
                        textcolor2: Colors.white)),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.04,left: size.width*0.11,right: size.width*0.11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(top: size.height*0.07,left: size.width*0.028),
                        height: size.height * 0.001,
                        width: size.width * 0.35,
                        color: Colors.white.withOpacity(0.3),
                      ),
                      Text(
                        'OR',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height*0.02,
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
                SizedBox(
                  height: size.height * 0.04,
                ),
                Image.asset(comimg, height: size.height * 0.25),
                SizedBox(
                  height: size.height * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SelectBuisness()));
                  },
                  child: CustomButton(
                      text: "Company",
                      color1: btnclr.withOpacity(0.3),
                      color2: btnclr.withOpacity(0.3),
                      textcolor1: bckgrnd,
                      textcolor2: bckgrnd),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
