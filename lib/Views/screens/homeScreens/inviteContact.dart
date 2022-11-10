import 'package:concard/Constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';

class InviteContactToBecameConcardMember extends StatelessWidget {
  const InviteContactToBecameConcardMember({Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: bckgrnd,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        srchIcon,
                        color: bckgrnd,
                      ),
                      Stack(
                        children: [
                          SvgPicture.asset(bellIcon),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            child: SvgPicture.asset(notifyDot),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: size.height*0.03,
                        backgroundImage: NetworkImage(''),
                      )
                    ],
                  ),
                
                ],
              ),
            ),
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

                children: [
                  Text(
                    'Import Contact and Information',
                    style: TextStyle(
                        fontFamily: 'MBold', fontSize: size.height * 0.018),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Text(
                    'You can import contacts from other systems to Concard',
                    style: TextStyle(
                        fontFamily: 'Stf',
                        fontSize: size.height * 0.015,
                        color: signupclor_dark),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Container(
                    height: size.height*0.3,
                    width: size.width*0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: size.width*0.1,
                                child: SvgPicture.asset(linkedinone_icon)),
                              SizedBox(width: size.width*0.04,),
                              Text(
                                'Import from LinkedIn',
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Msemibold'
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*0.02,),
                          Row(
                            children: [
                              Container(
                                 width: size.width*0.1,
                                child: SvgPicture.asset(googletwo_icon,height: size.height*0.025,)),
                              SizedBox(width: size.width*0.04,),
                              Text(
                                'Import from Google contacts',
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Msemibold'
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*0.02,),
                          Row(
                            children: [
                              Container(
                                 width: size.width*0.1,
                                child: SvgPicture.asset(outlook_icon)),
                              SizedBox(width: size.width*0.04,),
                              Text(
                                'Import from Outlook contacts',
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Msemibold'
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*0.02,),
                          Row(
                            children: [
                              Container(
                                 width: size.width*0.1,
                                child: SvgPicture.asset(icloud_icon)),
                              SizedBox(width: size.width*0.04,),
                              Text(
                                'Import from ICloud contacts',
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Msemibold'
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*0.02,),
                          Row(
                            children: [
                              Container(
                                 width: size.width*0.1,
                                child: SvgPicture.asset(excelsheet_icon,height: size.height*0.03)),
                              SizedBox(width: size.width*0.04,),
                              Text(
                                'Import from  Excel sheet',
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Msemibold'
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
