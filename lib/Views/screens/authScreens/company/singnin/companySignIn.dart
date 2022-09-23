import 'package:concard/Views/screens/authScreens/individual/signin/forgetPassword.dart';
import 'package:concard/Views/screens/homeScreens/bottomNavBar.dart';
import 'package:concard/Views/screens/homeScreens/companyProfileScreen.dart';
import 'package:concard/Views/screens/homeScreens/homepge.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';

class CompanySignInScreen extends StatefulWidget {
  CompanySignInScreen({Key? key}) : super(key: key);

  @override
  State<CompanySignInScreen> createState() => _CompanySignInScreenState();
}

class _CompanySignInScreenState extends State<CompanySignInScreen> {
  bool? isSelected = false;
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
                    margin: EdgeInsets.only(top: size.height * 0.07),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          con_icon,
                          height: size.height * 0.1,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'C O N C A R D',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.02,
                              fontFamily: "Mbold"),
                        ),
                        Text(
                          "Now You're Connected",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.015,
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
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: "Msemibold",
                        color: txtcolr),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: size.height * 0.055,
                    width: size.width * 0.85,
                    child: TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: infocolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: infocolor),
                          ),
                          prefixIcon: Image.asset(
                            email_icon,
                            color: Colors.grey,
                          ),
                          hintText: 'Email',
                          contentPadding: EdgeInsets.only(
                              top: 0.0, left: 22.0, bottom: 2.0),
                          hintStyle: TextStyle(
                              fontSize: size.height * 0.015,
                              fontFamily: "Msemibold",
                              color: infocolor)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: size.height * 0.055,
                    width: size.width * 0.85,
                    child: TextFormField(
                      obscureText: true,
                      maxLines: 1,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: infocolor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: infocolor),
                          ),
                          prefixIcon: Image.asset(
                            paswrd_icon,
                            color: Colors.grey,
                          ),
                          hintText: 'Password',
                          contentPadding: EdgeInsets.only(
                              top: 0.0, left: 22.0, bottom: 2.0),
                          hintStyle: TextStyle(
                              fontSize: size.height * 0.015,
                              fontFamily: "Msemibold",
                              color: infocolor)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, right: size.width * 0.09),
                    child: Row(
                      children: [
                        Checkbox(
                          // checkColor: Colors.white,
                          fillColor: MaterialStateProperty.all(signupclor_dark),
                          value: isSelected,
                          shape: CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected = value!;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              fontSize: size.height * 0.015,
                              color: infocolor,
                              fontFamily: "Msemibold"),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgetPassword()));
                          },
                          child: Text(
                            'Forget password?',
                            style: TextStyle(
                                fontSize: size.height * 0.015,
                                fontFamily: "Msemibold",
                                color: txtcolr),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CompanyProfileScreen(),
                          ),
                        );
                      },
                      child: CustomButton(
                          text: 'Sign in',
                          color1: signupclor_light,
                          color2: signupclor_dark,
                          textcolor1: bckgrnd,
                          textcolor2: bckgrnd)),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "Now You're Connected !",
                    style: TextStyle(
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
