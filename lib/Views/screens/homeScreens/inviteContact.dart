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
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.03),
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
                  Container(
                    width: size.width * 0.32,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          radius: size.height * 0.03,
                          backgroundImage: NetworkImage(''),
                        )
                      ],
                    ),
                  ),
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
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text(
                    "Let's Invite XXX to become a Concard Member",
                    style: TextStyle(
                        fontFamily: 'Msemibold', fontSize: size.height * 0.018),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Text(
                    "Invite Via",
                    style: TextStyle(
                        fontFamily: 'MBold', fontSize: size.height * 0.018),
                  ),
                  Container(
                    height: size.height * 0.3,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset(inviteViaSms),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Invite via SMS',
                                        style: TextStyle(
                                            fontSize: size.height * 0.018,
                                            fontFamily: "Stf"),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: size.height * 0.02,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset(inviteViaEmail),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Invite via Email',
                                        style: TextStyle(
                                            fontSize: size.height * 0.018,
                                            fontFamily: "Stf"),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: size.height * 0.02,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset(inviteViaLink),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Invite via Invitation link',
                                        style: TextStyle(
                                            fontSize: size.height * 0.018,
                                            fontFamily: "Stf"),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: size.height * 0.02,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset(inviteViaShare),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Share with other apps',
                                        style: TextStyle(
                                            fontSize: size.height * 0.018,
                                            fontFamily: "Stf"),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: size.height * 0.02,
                                  ),
                                ],
                              ),
                            ],
                          ),
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
