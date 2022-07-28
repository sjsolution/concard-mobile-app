import 'package:concard/Views/screens/homeScreens/expoScreens/expoTopWatchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import '../personalProfileViewScreen.dart';

class ExpoBottomBarScreen extends StatelessWidget {
  const ExpoBottomBarScreen({Key? key}) : super(key: key);

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
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topCenter,
                          colors: [signupclor_light, signupclor_dark]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         Image.asset(more_icon),
                          Row(
                            children: [
                              SvgPicture.asset(
                                expo_icon,
                                height: size.height * 0.03,
                                color: bckgrnd,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                'Expo',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: "MBold",
                                    color: bckgrnd),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                srch_icon,
                                height: 30,
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                  child: Image.asset(
                                notify_icon,
                                height: 30,
                              )),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              PersonalProfileViewScreen()));
                                },
                                child: CircleAvatar(
                                    radius: size.height * 0.02,
                                    backgroundImage: NetworkImage(
                                      "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
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
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.width * 0.04,
                    ),

                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Container(
                                  margin: EdgeInsets.only(
                                      bottom: size.height * 0.1),
                                  child: Dialog(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    //this right here
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: btnclr,
                                      ),
                                      height: size.height * 0.5228,
                                      width: size.width * 0.9,
                                      child: Stack(
                                        children: [
                                          Column(
                                            children: <Widget>[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: size.width * 0.04,
                                                    right: size.width * 0.04,
                                                    top: size.height * 0.02),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      'Expo Badge',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.018,
                                                          fontFamily:
                                                              "Msemibold"),
                                                    ),
                                                    Spacer(),
                                                    Row(
                                                      children: [
                                                        SvgPicture.asset(
                                                            stylearrw_icon),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.03,
                                                        ),
                                                        InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              size:
                                                                  size.height *
                                                                      0.03,
                                                            ))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              PrettyQr(
                                                typeNumber: null,
                                                image: AssetImage(concard_icon),
                                                elementColor: signupclor_dark,
                                                size: size.height * 0.1,
                                                data: 'https://www.google.ru',
                                                errorCorrectLevel:
                                                    QrErrorCorrectLevel.M,
                                                roundEdges: true,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.03,
                                              ),
                                              Divider(
                                                thickness: 1,
                                                indent: size.width * 0.07,
                                                endIndent: size.width * 0.07,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              Image.asset(adpec,
                                                  height: size.height * 0.06),
                                              SizedBox(
                                                height: size.height * 0.04,
                                              ),
                                              Container(
                                                  width: size.width,
                                                  child: ClipRRect(
                                                    child: Image.asset(
                                                        badgebckgrnd,
                                                        fit: BoxFit.cover),
                                                  )),
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: size.height * 0.32),
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: size.height * 0.04,
                                                  backgroundImage: AssetImage(
                                                    prfle,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(
                                                  'Jhon Smith',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: "MBold",
                                                      color: bckgrnd),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(
                                                  'CEO',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: "Stf",
                                                      color: bckgrnd),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(
                                                  'Adipec',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: "MBold",
                                                      color: bckgrnd),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                      },
                      child: Container(
                        height: size.height * 0.055,
                        width: size.width * 0.7,
                        decoration: BoxDecoration(
                          border: Border.all(color: signupclor_dark),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(badge),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text('Expo Badge'),
                            ]),
                      ),
                    ),
                    // Row(

                    //   children: [
                    //   Container(
                    //     decoration: BoxDecoration(
                    //       // color: prmryblue,
                    //       border: Border.all(color: signupclor_dark),
                    //       borderRadius: BorderRadius.circular(30)
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           SvgPicture.asset(congreen_icon,color: signupclor_dark,),
                    //           Text('Watchlist',
                    //           style: TextStyle(
                    //             fontSize: size.height*0.015,
                    //             fontFamily: "Msemibold",

                    //           ),),
                    //           Container(
                    //             height: size.height*0.03,
                    //             width: size.width*0.02,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     height: size.height*0.05,
                    //     width: size.width*0.4,
                    //   ),

                    //   Container(
                    //     decoration: BoxDecoration(
                    //       color: signupclor_light,
                    //       borderRadius: BorderRadius.circular(30)
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.02),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Image.asset(exchg_icon,height: size.height*0.02,color: bckgrnd,),
                    //           Text('Expo Badge',
                    //           style: TextStyle(
                    //             fontSize: size.height*0.015,
                    //             color: bckgrnd,
                    //             fontFamily: "Msemibold"
                    //           ),),
                    //           Container(
                    //             height: size.height*0.03,
                    //             width: size.width*0.02,
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     height: size.height*0.05,
                    //     width: size.width*0.4,
                    //   ),
                    //   ],
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ExpoTopWatchScreen()));
                      },
                      child: Row(
                        children: [
                          Text(
                            'Top',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "MBold"),
                          ),
                          Spacer(),
                          Text(
                            'See all',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "Msemibold",
                                color: txtcolr),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width * 0.32,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // SizedBox(height: 20,),
                                    SvgPicture.asset(
                                      expo_icon,
                                      height: size.height * 0.035,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    Text(
                                      'ADIPEC EXPO',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Msemibold"),
                                    ),
                                    Text(
                                      'Abu Dhabi 2021',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Stf",
                                          color: infocolor),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      margin: EdgeInsets.only(
                        top: size.height * 0.01,
                      ),
                      height: size.height * 0.14,
                      width: size.width,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Nearby',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Mbold"),
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Msemibold",
                              color: txtcolr),
                        ),
                      ],
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width * 0.32,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      expo_icon,
                                      height: size.height * 0.035,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    Text(
                                      'ADIPEC EXPO',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Msemibold"),
                                    ),
                                    Text(
                                      'Abu Dhabi 2021',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Stf",
                                          color: infocolor),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      margin: EdgeInsets.only(
                        top: size.height * 0.01,
                      ),
                      height: size.height * 0.14,
                      width: size.width,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Ongoing',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "MBold"),
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Msemibold",
                              color: txtcolr),
                        ),
                      ],
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width * 0.32,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      expo_icon,
                                      height: size.height * 0.035,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    Text(
                                      'ADIPEC EXPO',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Msemibold"),
                                    ),
                                    Text(
                                      'Abu Dhabi 2021',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Stf",
                                          color: infocolor),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      margin: EdgeInsets.only(
                        top: size.height * 0.01,
                      ),
                      height: size.height * 0.14,
                      width: size.width,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          'Upcoming',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "MBold"),
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Msemibold",
                              color: txtcolr),
                        ),
                      ],
                    ),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              width: size.width * 0.32,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      expo_icon,
                                      height: size.height * 0.035,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    Text(
                                      'ADIPEC EXPO',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Msemibold"),
                                    ),
                                    Text(
                                      'Abu Dhabi 2021',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Stf",
                                          color: infocolor),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      margin: EdgeInsets.only(
                        top: size.height * 0.01,
                      ),
                      height: size.height * 0.14,
                      width: size.width,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
