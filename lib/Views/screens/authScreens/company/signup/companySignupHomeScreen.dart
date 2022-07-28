import 'package:concard/Constants/colors.dart';
import 'package:concard/Views/screens/authScreens/company/signup/aboutCompanySignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/cardDetails.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companMobileVerification.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companyAdminSignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companyCodeVerification.dart';
import 'package:concard/Views/screens/authScreens/company/signup/planSelection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
PageController pageController = PageController();
class CompanySignUpHomeScreen extends StatefulWidget {
  const CompanySignUpHomeScreen({Key? key}) : super(key: key);

  @override
  _CompanySignUpHomeScreenState createState() =>
      _CompanySignUpHomeScreenState();
}

class _CompanySignUpHomeScreenState extends State<CompanySignUpHomeScreen> {

  PageController _controller = new PageController();
  var lis = [
    Colors.red,
    Colors.green,
    Colors.purple,
  ];
  int sIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          //top
          Container(
            height: size.height * 0.25,
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
                  ]),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      top: size.height * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: bckgrnd,
                          size: size.height * 0.03,
                        ),
                      ),
                      Text(
                        'Company Sign Up',
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Msemibold",
                            color: bckgrnd),
                      ),
                      Container(
                        height: size.height * 0.03,
                        width: size.width * 0.02,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(top: size.height * 0.18),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                ),
                color: bckgrnd
            ),
            child: PageView.builder(
              itemCount: 4,
              reverse: false,
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  sIndex = value;
                });
              },
              itemBuilder: (context, position) {
                return sIndex == 0
                    ? CompanyAdminSignup()
                    : sIndex == 1
                    ? AboutCompanySignup()
                    : sIndex == 2
                    ? CompanyMobileVerification()
                    : CompanyCodeVerificationScreen();
              },
            ),
          ),
        ],
      ),
    );
  }
  void onAddButtonTapped(int index) {
print("rrr");
    // use this to animate to the page

    // or this to jump to it without animating
    pageController.jumpToPage(index);
  }
}
