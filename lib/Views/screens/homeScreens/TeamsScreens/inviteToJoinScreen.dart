import 'package:concard/Constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';

class InviteToJoinScreen extends StatelessWidget {
  const InviteToJoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            height: size.height*0.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: [
                    signupclor_light,
                    signupclor_dark
                  ]
              ),
            ),
            child:  Padding(
              padding:  EdgeInsets.only(left: size.width*0.04, right: size.width*0.04,top: size.height*0.04),
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
                  // SizedBox(
                  //   width: 110,
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  Text(
                    'Invite to Join',
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: 'Msemibold',
                        color: bckgrnd),
                  ),
                  // SizedBox(
                  //   width: 110,
                  // ),
                  Container(
                    width: size.width*0.05,
                  )
                  // Image.asset(notify_icon),
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
              padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.03,),
                  Text('Invite new member to your created team',style: TextStyle(
                    fontSize: size.height*0.018,
                    fontFamily: 'MBold',
                  ),),
                  SizedBox(height: size.height*0.02,),
                  Text('Contrary to popular belief, Lorem Ipsum is not\nsimply random text. It has roots in a piece of\nclassical Latin literature from 45 BC, making it over\n2000 years old.',style: TextStyle(
                    fontSize: size.height*0.015,
                    fontFamily: 'Msemibold',
                  ),),
                  SizedBox(height: size.height*0.05,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(sms_icon,height: size.height*0.035,),
                      SizedBox(width: size.width*0.1,),
                      Text(
                        'Invite via SMS',
                        style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: 'Msemibold',
                            ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp,size: 12,),
                    ],
                  ),
                  SizedBox(height: size.height*0.01,),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: size.height*0.02,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(mail_icon,height: size.height*0.03,),
                      SizedBox(width: size.width*0.1,),
                      Text(
                        'Invite via Email',
                        style: TextStyle(
                          fontSize: size.height * 0.015,
                          fontFamily: 'Msemibold',
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp,size: 12,),
                    ],
                  ),
                  SizedBox(height: size.height*0.01,),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: size.height*0.02,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(link_icon,height: size.height*0.035,),
                      SizedBox(width: size.width*0.1,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Copy invitation link',
                            style: TextStyle(
                              fontSize: size.height * 0.015,
                              fontFamily: 'Msemibold',
                            ),
                          ),
                          Text(
                            'http://cc.co.61319hhya',
                            style: TextStyle(
                              fontSize: size.height * 0.015,
                              fontFamily: 'Msemibold',
                              color: signupclor_dark
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp,size: 12,),
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
