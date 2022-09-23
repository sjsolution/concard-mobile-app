import 'package:concard/Constants/colors.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/images.dart';

class UpgradeToPremiumCompanyScreen extends StatefulWidget {
  UpgradeToPremiumCompanyScreen({Key? key}) : super(key: key);

  @override
  State<UpgradeToPremiumCompanyScreen> createState() =>
      _UpgradeToPremiumCompanyScreenState();
}

class _UpgradeToPremiumCompanyScreenState
    extends State<UpgradeToPremiumCompanyScreen> {
  bool? isColrChnge = false;
  bool? isClrchng = false;
  bool? isChng = false;
  TextEditingController controller=TextEditingController();
  List<String> imgList = [scancard, cloudbackup, premscrtrymode, premiumteam];
  List<String> txtList = [
    "scan Unlimited\n          Cards",
    "Cloud Backup\n(private cloud)",
    "Secretary mode",
    "Teams",
  ];
  List<String> fpList = [
    "scan Unlimited Cards",
    "Export Data",
    "Secretary mode",
    "Cloud Backup\n(private cloud)",
    "Teams",
    "Get Verified",
    "No Ads",
    "Share",
    "Multi device",
    "Upload Business\ncard template",
    "Expo",
    "Expo Badge",
    "Calender",
    "Upload Company\nProfile & Brochure",
  ];
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
                color: btnclr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: ListView(
              padding: EdgeInsets.all(0),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      top: size.height * 0.03),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: size.height * 0.05,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                                border: Border.all(color: signupclor_dark),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text('Have Redemption Code?',
                                  style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      fontFamily: "MBold",
                                      color: signupclor_dark)),
                            ),
                          ),
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
                              left: size.width * 0.03,
                              right: size.width * 0.03),
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
                                      border:
                                          Border.all(color: gradientgreen),
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
                                      borderRadius:
                                          BorderRadius.circular(10)),
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
                                      border:
                                          Border.all(color: gradientgreen),
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
                                      borderRadius:
                                          BorderRadius.circular(10)),
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
                                            '35 ',
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
                                      border:
                                          Border.all(color: gradientgreen),
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
                                      borderRadius:
                                          BorderRadius.circular(10)),
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
                                            '120 ',
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
                        ),
                          SizedBox(
                    height: size.height*0.02,
                  ),
                  Center(child: FieldText( validate: (String? value){
                        return '';
                      },hinttxt: "Number of accounts (Minimum 5 accounts)", controller: controller, textInputType: TextInputType.number, pass: false)),
                   SizedBox(
                    height: size.height*0.04,
                  ),
                  Center(
                    child: Container(
                      height: size.height*0.05,
                      width: size.width*0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            gradientgreen,
                            primarygreen
                          ]
                        ),
                      ),
                      child: Center(
                        child: Text('TOTAL= \$ 150',
                        style: TextStyle(
                          color: bckgrnd,
                          fontSize: size.height*0.018,
                          fontFamily: "Stf"
                        ),),
                      ),
                    ),
                  ),
                        SizedBox(
                          height: size.height * 0.02,
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
                                    colors: [
                                      signupclor_light,
                                      signupclor_dark
                                    ]),
                                border: Border.all(color: Colors.grey),
                                color: bckgrnd,
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              // margin: EdgeInsets.only(left: size.width*0.04),
                              alignment: Alignment.center,
                              child: Text(
                                'Upgrade to Premium',
                                style: TextStyle(
                                    color: bckgrnd,
                                    fontSize: size.height * 0.02,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Msemibold'),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          'Premium Features',
                          style: TextStyle(
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Msemibold',
                          ),
                        ),
                        Container(
                          height: size.height * 0.4,
                          width: size.width * 1.0,
                          margin: EdgeInsets.only(
                              left: size.width * 0.05,
                              right: size.width * 0.05),
                          child: GridView.builder(
                            padding: EdgeInsets.all(0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 2,
                                childAspectRatio: 4 / 4,
                                // mainAxisExtent: 150,
                              ),
                              itemCount: imgList.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(

                                    // height: size.height*0.15,
                                    // width: size.width*0.25,
                                    // alignment: Alignment.center,
                                    child: Card(
                                  color: bckgrnd,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          imgList[index],
                                          height: size.height * 0.1,
                                        ),
                                        SizedBox(height: size.height * 0.02),
                                        Text(txtList[index],
                                            style: TextStyle(
                                                fontFamily: "Stf",
                                                fontSize:
                                                    size.height * 0.015))
                                      ]),
                                ));
                              }),
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
                              width: size.width * 0.32,
                            ),
                            Text(
                              'Compare',
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "Mbold",
                              ),
                            ),
                            Container(
                              color: infocolor,
                              height: size.height * 0.001,
                              width: size.width * 0.32,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: size.width * 0.1,
                            ),
                            Text(
                              'Free',
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "MBold",
                                color: gradientgreen,
                              ),
                            ),
                            SizedBox(width: size.width * 0.18),
                            Text(
                              'Premium',
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "MBold",
                                color: signupclor_dark,
                              ),
                            ),
                            Container(
                              width: size.width * 0.07,
                            ),
                          ],
                        ),
                        Container(
                          height: size.height * 0.4,
                          width: size.width,
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                              scrollDirection: Axis.vertical,
                              itemCount: fpList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: size.width * 0.35,
                                          child: Text(
                                            fpList[index],
                                            style: TextStyle(
                                                fontSize: size.height * 0.015,
                                                fontFamily: "MBold"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width*0.08,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.close,
                                              size: 25,
                                              color: crs_clr,
                                            ),

                                            //  Container(width: size.width*0.05,),
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width*0.24,
                                        ),
                                        Icon(
                                          Icons.check,
                                          size: 25,
                                          color: tick_clr,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                  ],
                                );
                              }),
                        ),
                        SizedBox(
                          height: size.height*0.1,
                        ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
