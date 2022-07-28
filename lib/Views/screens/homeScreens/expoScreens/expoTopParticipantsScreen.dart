import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';

class ExpoTopParticipantsScreen extends StatelessWidget {
  const ExpoTopParticipantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
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
                      padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios,size:size.height*0.02,color: bckgrnd,),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                expo_icon,
                                height: size.height*0.025,
                                color: bckgrnd,
                              ),
                              SizedBox(width: size.width*0.02,),
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
                                notify_icon,
                                height: 30,
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.13),
              // height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Top Participants',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "MBold",
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                        height: size.height * 0.25,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: bckgrnd,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:Padding(
                          padding:  EdgeInsets.only(left: size.height*0.04,right: size.width*0.1,top: size.height*0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: size.height*0.02,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            office,
                                            height: size.height*0.019,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                      Text(
                                        'Company',
                                        style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            fontFamily: "Msemibold"),
                                      ),
                                      Text(
                                        'Lorem ispum',
                                        style: TextStyle(
                                            fontSize: size.height * 0.01,
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: size.height*0.02,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            office,
                                            height: size.height*0.019,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                      Text(
                                        'Company',
                                        style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            fontFamily: "Msemibold"),
                                      ),
                                      Text(
                                        'Lorem ispum',
                                        style: TextStyle(
                                            fontSize: size.height * 0.01,
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: size.height*0.02,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            office,
                                            height: size.height*0.019,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                      Text(
                                        'Company',
                                        style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            fontFamily: "Msemibold"),
                                      ),
                                      Text(
                                        'Lorem ispum',
                                        style: TextStyle(
                                            fontSize: size.height * 0.01,
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: size.height*0.02,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            office,
                                            height: size.height*0.019,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                      Text(
                                        'Company',
                                        style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            fontFamily: "Msemibold"),
                                      ),
                                      Text(
                                        'Lorem ispum',
                                        style: TextStyle(
                                            fontSize: size.height * 0.01,
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height*0.03,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: size.height*0.02,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            office,
                                            height: size.height*0.019,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                      Text(
                                        'Company',
                                        style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            fontFamily: "Msemibold"),
                                      ),
                                      Text(
                                        'Lorem ispum',
                                        style: TextStyle(
                                            fontSize: size.height * 0.01,
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: size.height*0.02,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            office,
                                            height: size.height*0.019,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                      Text(
                                        'Company',
                                        style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            fontFamily: "Msemibold"),
                                      ),
                                      Text(
                                        'Lorem ispum',
                                        style: TextStyle(
                                            fontSize: size.height * 0.01,
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: size.height*0.02,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            office,
                                            height: size.height*0.019,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                      Text(
                                        'Company',
                                        style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            fontFamily: "Msemibold"),
                                      ),
                                      Text(
                                        'Lorem ispum',
                                        style: TextStyle(
                                            fontSize: size.height * 0.01,
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        radius: size.height*0.02,
                                        child: ClipRRect(
                                          child: Image.asset(
                                            office,
                                            height: size.height*0.019,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                      Text(
                                        'Company',
                                        style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            fontFamily: "Msemibold"),
                                      ),
                                      Text(
                                        'Lorem ispum',
                                        style: TextStyle(
                                            fontSize: size.height * 0.01,
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
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
