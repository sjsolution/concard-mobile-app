import 'package:concard/Views/screens/homeScreens/TeamsScreens/createTeamScreen.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/teamsFilterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';

import '../../../../Constants/colors.dart';

class CompanyMembersPermissions extends StatefulWidget {
  CompanyMembersPermissions({Key? key}) : super(key: key);

  @override
  State<CompanyMembersPermissions> createState() =>
      _CompanyMembersPermissionsState();
}

class _CompanyMembersPermissionsState extends State<CompanyMembersPermissions> {
  bool? isCardDetl = false;
  bool? isUploadCompPrfl = false;
  bool? isCompBroch = false;
  bool? isChngEmail = false;
  bool? isChngNbr = false;
  bool? isExportData = false;


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
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: bckgrnd,
                    ),
                  ),
                  // SizedBox(
                  //   width: 110,
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  Text(
                    'Company Members',
                    style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "MBold",
                        color: bckgrnd),
                  ),
                  Container(
                    height: 5,
                    width: 10,
                  )                
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.13),
            width: size.width,
            decoration: BoxDecoration(
                color: btnclr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Edit Members Permissions',
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      fontFamily: 'MBold',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Edit Cards Detail',
                        style: TextStyle(
                          fontFamily: 'Msemibold',
                          fontSize: size.height * 0.015,
                        ),
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: size.height * 0.001,
                        child: CupertinoSwitch(
                            activeColor: gradientgreen,
                            value: isCardDetl!,
                            onChanged: (value) {
                              setState(() {
                                isCardDetl = value;
                              });
                            }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Upload Company Profile',
                        style: TextStyle(
                          fontFamily: 'Msemibold',
                          fontSize: size.height * 0.015,
                        ),
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: size.height * 0.001,
                        child: CupertinoSwitch(
                            activeColor: gradientgreen,
                            value: isUploadCompPrfl!,
                            onChanged: (value) {
                              setState(() {
                                isUploadCompPrfl = value;
                              });
                            }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Upload Company Brochure',
                        style: TextStyle(
                          fontFamily: 'Msemibold',
                          fontSize: size.height * 0.015,
                        ),
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: size.height * 0.001,
                        child: CupertinoSwitch(
                            activeColor: gradientgreen,
                            value: isCompBroch!,
                            onChanged: (value) {
                              setState(() {
                                isCompBroch = value;
                              });
                            }),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Change Register Email',
                        style: TextStyle(
                          fontFamily: 'Msemibold',
                          fontSize: size.height * 0.015,
                        ),
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: size.height * 0.001,
                        child: CupertinoSwitch(
                            activeColor: gradientgreen,
                            value: isChngEmail!,
                            onChanged: (value) {
                              setState(() {
                                isChngEmail = value;
                              });
                            }),
                      )
                    ],
                  ),
                   SizedBox(height: size.height*0.02,),
                   Row(
                    children: [
                      Text('Change Register Phone Number',style: TextStyle(
                        fontFamily: 'Msemibold',
                        fontSize: size.height*0.015,
                      ),),
                      Spacer(),
                      Transform.scale(
                        scale: size.height*0.001,
                        child: CupertinoSwitch(
                          
                          activeColor: gradientgreen,
                          value: isChngNbr!, onChanged: (value){
                      
                          setState(() {
                            isChngNbr=value;
                          });
                        }),
                      )


                    ],
                  ),
                   SizedBox(height: size.height*0.02,),
                   Row(
                    children: [
                      Text('Export Data',style: TextStyle(
                        fontFamily: 'Msemibold',
                        fontSize: size.height*0.015,
                      ),),
                      Spacer(),
                      Transform.scale(
                        scale: size.height*0.001,
                        child: CupertinoSwitch(
                          
                          activeColor: gradientgreen,
                          value: isExportData!, onChanged: (value){
                      
                          setState(() {
                            isExportData=value;
                          });
                        }),
                      )


                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
