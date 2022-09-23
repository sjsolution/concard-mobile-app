import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/signup_choice_class.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:concard/Views/widgets/socialButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
                    margin: EdgeInsets.only(top: size.height * 0.1),
                    child: Column(
                      children: [
                        SvgPicture.asset(con_icon,height: size.height*0.13,),
                        SizedBox(height: size.height*0.02,),
                        Text(
                          'C O N C A R D',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.02,
                              fontFamily: "MBold"),
                        ),
                        Text(
                          "Now You're Connected",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height*0.012,
                            fontFamily: "Stf"
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.36),
              height: size.height * 0.65,
              width: size.width,
              decoration: BoxDecoration(
                  color: bckgrnd,
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.025),
                    child: Text(
                      'Welcome to Concard',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height*0.018,
                          fontFamily: "MBold"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: Text(
                      'Here you can share your business card\n             between your colleagues',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: size.height*0.015,
                        fontFamily: "Stf"
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/choiceClass');
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext contect,)=> const SignupChoiceClass()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      child: CustomButton(
                        text: "Sign Up",
                        color1: signupclor_light,
                        color2: signupclor_dark,
                        textcolor1: bckgrnd,
                        textcolor2: bckgrnd,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  InkWell(
                    onTap: ()async{
                        Navigator.pushNamed(context, '/signIn');
                    },
                    child: CustomButton(
                      text: "Login",
                      color1: Colors.white,
                      color2: Colors.white,
                      textcolor2: signupclor_dark,
                      textcolor1: signupclor_dark,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.04,left: size.width*0.11,right:size.width*0.11 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(top: size.height*0.07,left: size.width*0.028),
                          height: size.height * 0.001,
                          width: size.width * 0.32,
                          color: Colors.grey,
                        ),
                        Text(
                          'Or',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: size.height*0.015,
                              fontFamily: "Msemibold"),
                        ),
                        Container(
                          // margin: EdgeInsets.only(top: size.height*0.07,left: size.width*0.028),
                          height: size.height * 0.001,
                          width: size.width * 0.32,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height*0.04,),
                  SocialButtons(
                    image: google_icon,
                    text: "Join with Google",
                    color1: bckgrnd,
                    color2: bckgrnd,
                    txtcolor1: Colors.black,
                    txtcolor2: Colors.black,
                  ),
                  SizedBox(height: size.height*0.02,),
                  SocialButtons(
                    image: linkedin_icon,
                    text: "Join with Linkedin",
                    color1: linkdinButton_color,
                    color2: linkdinButton_color,
                    txtcolor1: Colors.white,
                    txtcolor2: Colors.white,
                  ),
                  SizedBox(height: size.height*0.13,),
                  Text(
                    "Now You're Connected",
                    style: TextStyle(
                        color: signupclor_dark,
                        fontSize: size.height*0.015,
                        fontFamily: "Stf"
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
