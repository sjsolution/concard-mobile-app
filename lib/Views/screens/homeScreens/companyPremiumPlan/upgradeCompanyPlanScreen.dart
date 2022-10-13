import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/companyPremiumPlan/manageCompanyPremiumPlan.dart';
import 'package:concard/Views/screens/homeScreens/individualPremium/manageMembershipScreen.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';
import '../../../widgets/customButton.dart';

class UpgradeCompanyPlanScreen extends StatefulWidget {
  UpgradeCompanyPlanScreen({Key? key}) : super(key: key);

  @override
  State<UpgradeCompanyPlanScreen> createState() =>
      _UpgradeCompanyPlanScreenState();
}

class _UpgradeCompanyPlanScreenState extends State<UpgradeCompanyPlanScreen> {
  bool? isColrChnge = false;
  bool? isClrchng = false;
  bool? isChng = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height * 0.15,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [signupclor_light, signupclor_dark]),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.04, right: size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.height * 0.02,
                      color: bckgrnd,
                    )),
                Row(
                  children: [
                    Image.asset(premium_icon),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      child: Text(
                        'CONCARD Premium',
                        style: TextStyle(
                            fontFamily: "MBold",
                            fontSize: size.height * 0.018,
                            color: bckgrnd),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.03,
                  width: size.width * 0.08,
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.13),
          // height: size.height*0.8,
          width: size.width,
          decoration: BoxDecoration(
              color: bckgrnd,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.04,
                right: size.width * 0.04,
                top: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Company XXX,',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: "Mbold",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Thanks for being a Premium member,',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: "Mbold",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Premium member since:',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Mbold",
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      '02 Apr 2022',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Stf",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Premium membership:',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Mbold",
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      '\$ 5/month/user',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Stf",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Number of Premium Accounts:',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Mbold",
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      '10',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Stf",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Next billing date:',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Mbold",
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      'Apr 16, 2022',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Stf",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                InkWell(
                  onTap: () {},
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ManageCompanyPremiumPlan()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Manage membership',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Mbold",
                              color: gradientgreen),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: size.height * 0.02,
                          color: gradientgreen,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  height: size.height * 0.35,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      color: btnclr, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.03),
                      Text(
                        'Are you enjoying our App?',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "Mbold",
                            color: signupclor_light),
                      ),
                      Text(
                        'Upgrade your Premium Membership',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "Mbold",
                            color: signupclor_light),
                      ),
                      Text(
                        'and save money \$\$\$',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "Mbold",
                            color: signupclor_light),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: infocolor,
                            height: size.height * 0.001,
                            width: size.width * 0.2,
                          ),
                          Text(
                            'Choose the plan you like',
                            style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Mbold",
                            ),
                          ),
                          Container(
                            color: infocolor,
                            height: size.height * 0.001,
                            width: size.width * 0.2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.03, right: size.width * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isColrChnge = true;
                                  isClrchng = false;
                                  isChng = false;
                                });
                              },
                              child: Container(
                                height: size.height * 0.13,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    border: Border.all(color: gradientgreen),
                                    gradient: isColrChnge!
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                                signupclor_light,
                                                signupclor_dark
                                              ])
                                        : LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [btnclr, btnclr]),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Monthly',
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          fontFamily: "Mbold",
                                          color: isColrChnge!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '5 ',
                                          style: TextStyle(
                                              fontSize: size.height * 0.022,
                                              fontFamily: "Msemibold",
                                              color: isColrChnge!
                                                  ? bckgrnd
                                                  : gradientgreen),
                                        ),
                                        Text(
                                          'USD',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: "Stf",
                                              color: isColrChnge!
                                                  ? bckgrnd
                                                  : gradientgreen),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'per user',
                                      style: TextStyle(
                                          fontSize: size.height * 0.011,
                                          fontFamily: "Stf",
                                          color: isColrChnge!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                    Text(
                                      'Automatic renewal',
                                      style: TextStyle(
                                          fontSize: size.height * 0.011,
                                          fontFamily: "Stf",
                                          color: isColrChnge!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isClrchng = true;
                                  isColrChnge = false;
                                  isChng = false;
                                });
                              },
                              child: Container(
                                height: size.height * 0.13,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    border: Border.all(color: gradientgreen),
                                    gradient: isClrchng!
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                                signupclor_light,
                                                signupclor_dark
                                              ])
                                        : LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [btnclr, btnclr]),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Annually',
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          fontFamily: "Mbold",
                                          color: isClrchng!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '30 ',
                                          style: TextStyle(
                                              fontSize: size.height * 0.022,
                                              fontFamily: "Msemibold",
                                              color: isClrchng!
                                                  ? bckgrnd
                                                  : gradientgreen),
                                        ),
                                        Text(
                                          'USD',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: "Stf",
                                              color: isClrchng!
                                                  ? bckgrnd
                                                  : gradientgreen),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'per user',
                                      style: TextStyle(
                                          fontSize: size.height * 0.011,
                                          fontFamily: "Stf",
                                          color: isClrchng!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                    Text(
                                      'Automatic renewal',
                                      style: TextStyle(
                                          fontSize: size.height * 0.011,
                                          fontFamily: "Stf",
                                          color: isClrchng!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isChng = true;
                                  isClrchng = false;
                                  isColrChnge = false;
                                });
                              },
                              child: Container(
                                height: size.height * 0.13,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                    border: Border.all(color: gradientgreen),
                                    gradient: isChng!
                                        ? LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                                signupclor_light,
                                                signupclor_dark
                                              ])
                                        : LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [btnclr, btnclr]),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      '5 Years',
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          fontFamily: "Mbold",
                                          color: isChng!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '100 ',
                                          style: TextStyle(
                                              fontSize: size.height * 0.022,
                                              fontFamily: "Msemibold",
                                              color: isChng!
                                                  ? bckgrnd
                                                  : gradientgreen),
                                        ),
                                        Text(
                                          'USD',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: "Stf",
                                              color: isChng!
                                                  ? bckgrnd
                                                  : gradientgreen),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'per user',
                                      style: TextStyle(
                                          fontSize: size.height * 0.011,
                                          fontFamily: "Stf",
                                          color: isChng!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                    Text(
                                      'Non-subscription',
                                      style: TextStyle(
                                          fontSize: size.height * 0.011,
                                          fontFamily: "Stf",
                                          color: isChng!
                                              ? bckgrnd
                                              : gradientgreen),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [signupclor_light, signupclor_dark]),
                        border: Border.all(color: Colors.grey),
                        color: bckgrnd,
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      // margin: EdgeInsets.only(left: size.width*0.04),
                      alignment: Alignment.center,
                      child: Text(
                        'Upgrade Plan',
                        style: TextStyle(
                            color: bckgrnd,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Msemibold'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
