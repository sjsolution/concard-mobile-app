import 'dart:async';
import 'dart:developer';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Controllers/indiviualController/team_controllers.dart';
import 'package:concard/Views/screens/authScreens/signupScreen.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/createTeamScreen.dart';
import 'package:concard/Views/screens/homeScreens/bottomNavBar.dart';
import 'package:concard/Views/screens/homeScreens/companyProfileScreen.dart';
import 'package:concard/Views/screens/homeScreens/homepge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uni_links/uni_links.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalStorageClass localStorageClass = LocalStorageClass();
//ADD THIS FUNCTION TO HANDLE DEEP LINKS
  Future<void> initUniLinks() async {
    try {
      Uri? initialLink = await getInitialUri();
      debugPrint("-------- initialLink :" + initialLink.toString());
      debugPrint("-------- hasQuery :" + initialLink!.hasQuery.toString());
      debugPrint("-------- team :" +
          initialLink.toString().contains("team").toString());
      debugPrint("-------- hasQuery :" +
          initialLink.toString().split('=')[1]);

          
      if (initialLink != null) {
        // String? type=initialLink.toString().split(pattern)
        if (initialLink.toString().contains("team")) {
          debugPrint("----------- is in team link");
          String? teamName = initialLink.toString().split("=")[1];
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  CreateTeamScreen(type:"link",teamName: teamName,)));
        }

        // if(initialLink.toString().contains("team")){

        // }

      } else {}
    } on PlatformException {
      debugPrint('platfrom exception unilink');
    }
  }

  @override
  void initState() {
    //CALL THE FUNCTION
    getLocalValues();

    // TODO: implement initState

    super.initState();
  }

  getLocalValues() async {
    String? tokenValue =
        await localStorageClass.getData(localStorageClass.tokenKey);

    String? userType =
        await localStorageClass.getData(localStorageClass.userTypeKey);

    String? userId =
        await localStorageClass.getData(localStorageClass.userIdKey);

    if (tokenValue != null || tokenValue != '') {
      Globals.token = tokenValue;

      Globals.userType = userType;

      Globals.userId = userId;

      log(tokenValue.toString());
      log(userType.toString());
      log(userId.toString());
      countDown();
    } else {
      countDown();
      log("null");
    }
  }

  countDown() async {
    // Timer(const Duration(seconds: 1), () {
    if (Globals.token != null && Globals.token != '') {
      if (Globals.userType == "1") {
        initUniLinks();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    const BottomNavigationScreen()),
            (Route<dynamic> route) => false);
      } else if (Globals.userType == "2") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    const CompanyProfileScreen()),
            (Route<dynamic> route) => false);
      }
    } else {
      // print("00000000001212");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const SignupScreen()),
          (Route<dynamic> route) => false);
    }
    // });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bckgrnd,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 1.0,
              width: size.width * 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    con_icon,
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'C O N C A R D',
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        fontFamily: "MBold",
                        color: signupclor_dark),
                  ),
                  Text(
                    "Now You're Connected",
                    style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "MBold",
                        color: signupclor_dark),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
