import 'dart:async';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),()=> Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                SignupScreen()),
            (Route<dynamic> route) => false));
   var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bckgrnd,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height*1.0,
              width: size.width*1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(con_icon,height: size.height*0.1,),
                  SizedBox(height: size.height*0.02,),
                  Text('C O N C A R D',
                  style: TextStyle(
                    fontSize: size.height*0.03,
                    fontFamily: "MBold",
                    color: signupclor_dark
                  ),),
                  Text("Now You're Connected",
                  style: TextStyle(
                    fontSize: size.height*0.018,
                    fontFamily: "MBold",
                    color: signupclor_dark
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
