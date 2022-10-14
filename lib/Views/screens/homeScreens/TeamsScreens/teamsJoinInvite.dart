import 'package:concard/Controllers/indiviualController/team_controllers.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Models/Indiviuals/team_detail_model.dart';
import 'package:concard/Models/Indiviuals/team_list_model.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/inviteToJoinScreen.dart';
import 'package:concard/Views/screens/homeScreens/addCardsToGroupScreen.dart';
import 'package:concard/Views/screens/homeScreens/addCompanyCards.dart';
import 'package:concard/Views/screens/homeScreens/addContactCardsScreen.dart';
import 'package:concard/Views/screens/homeScreens/editMyCardScreen.dart';
import 'package:concard/Views/widgets/custom_alert_dialogue.dart';
import 'package:concard/Views/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import 'package:concard/Constants/globals.dart' as Globals;

class TeamsJoinInviteScreen extends StatelessWidget {
  TeamsJoinInviteScreen({Key? key, required this.teamData}) : super(key: key);
  final TeamData? teamData;

  // getTeamDetails() async {
  //   Globals.teamDetailModel =
  //       await TeamController().getSingleTeamDetail(teamData!.id.toString());
  // }
  List<TeamMembers>? teamMembers;
  @override
  Widget build(BuildContext context) {
    teamMembers = Globals.teamDetailModel!.teamDetailData!.teamMembers;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                      teamData!.teamName!.toUpperCase(),
                      style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "MBold",
                          color: bckgrnd),
                    ),
                    // SizedBox(
                    //   width: 110,
                    // ),
                    Container(
                      width: size.width * 0.05,
                    ),
                    // Image.asset(notify_icon),
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
                  borderRadius: const BorderRadius.only(
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
                    Row(
                      children: [
                        Text(
                          'All teams',
                          style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontFamily: 'MBold',
                              color: infocolor),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: size.height * 0.02,
                          color: infocolor,
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                          teamData!.teamName!.toUpperCase(),
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: 'MBold',
                              color: signupclor_dark),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: size.height * 0.09,
                          width: size.width * 0.85,
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: signupclor_dark,
                              ),
                              filled: true,
                              fillColor: bckgrnd,
                              focusColor: bckgrnd,
                              hintText: 'Search Teams',
                              contentPadding: const EdgeInsets.only(
                                  top: 0.0, left: 22.0, bottom: 2.0),
                              hintStyle: TextStyle(
                                  fontSize: size.width * 0.04,
                                  color: infocolor),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: bckgrnd)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: bckgrnd)),
                            ),
                          ),
                        ),
                        SvgPicture.asset(sort_icon)
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Team members (${Globals.teamDetailModel!.teamDetailData!.teamMembers!.length.toString()})',
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: 'MBold',
                          ),
                        ),
                        Globals.teamDetailModel!.teamDetailData!.inviteMember ==
                                "1"
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              InviteToJoinScreen(
                                                inviteLink: Globals
                                                    .teamDetailModel!
                                                    .teamInviteLink,
                                              )));
                                },
                                child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            gradientgreen,
                                            primarygreen,
                                          ]),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      'Invite to Join',
                                      style: TextStyle(
                                          fontFamily: 'MBold',
                                          fontSize: size.height * 0.015,
                                          color: bckgrnd),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    teamMembers!.isNotEmpty
                        ? Container(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                itemCount: teamMembers!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.03),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onLongPress: () async {
                                            //long press to delete memebers
                                            //if delete card permission is 1 then delete
                                            if (Globals
                                                    .teamDetailModel!
                                                    .teamDetailData!
                                                    .deleteCard ==
                                                "1" || teamData!.userId == teamMembers![index].id.toString()) {
                                              customeAlertDialogue(
                                                context: context,
                                                title: "Delete Memeber?",
                                                content:
                                                    "Are you sure you want to delete this member ?.",
                                                btn1text: "Delete?",
                                                btn2Text: "Cancel",
                                                onTap1Btn: () async {
                                                  Navigator.pop(context);
                                                  context
                                                      .read<AppProvider>()
                                                      .setLoadingTrue();
                                                  loaderWidget(context, size);
                                                  await TeamController()
                                                      .removeMemberFormTeam(
                                                          teamMembers![index]
                                                              .id
                                                              .toString(),
                                                          teamData!.id
                                                              .toString());
                                                  teamMembers!.removeAt(index);
                                                  Navigator.pop(context);
                                                  context
                                                      .read<AppProvider>()
                                                      .setLoadingFalse();
                                                },
                                                onTap2Btn: () async {
                                                  Navigator.pop(context);
                                                },
                                              );
                                            } else {
                                              Globals.showToastMethod(
                                                  msg:
                                                      "You don't have permission to delete members");
                                            }
                                          },
                                          onTap: () {
                                            //single click to open profile
                                            Navigator.push(context, MaterialPageRoute(builder:(context)=>EditMyCardScreen()));
                                          },
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundImage: NetworkImage(
                                              teamMembers![index].profileImage!,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          '${teamMembers![index].firstName} ${teamMembers![index].lastName}',
                                          style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: 'MBold'),
                                        ),
                                        Text(
                                          '${teamMembers![index].jobTitle}',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              color: infocolor,
                                              fontFamily: 'MBold'),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            margin: EdgeInsets.only(
                              top: size.height * 0.02,
                            ),
                            height: size.height * 0.15,
                            width: size.width * 0.9,
                          )
                        : const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Center(
                              child: Text("There is no members added yet"),
                            ),
                          ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shared cards',
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: 'MBold',
                          ),
                        ),
                        Globals.teamDetailModel!.teamDetailData!.addCard == "1"
                            ? InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const AddContactCardsScreen()));
                                },
                                child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: gradientgreen),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      'Add Cards',
                                      style: TextStyle(
                                          fontFamily: "MBold",
                                          fontSize: size.height * 0.018,
                                          color: gradientgreen),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),

                    //put delete card permission
                    SizedBox(
                      height: size.height * 1.0,
                      width: size.width,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             TeamsJoinInviteScreen()));
                        },
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: 1,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        mycard_icon,
                                        height: size.height * 0.07,
                                        width: size.width * 0.2,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.08,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Team 1',
                                            style: TextStyle(
                                                fontSize: size.height * 0.017,
                                                fontFamily: 'Mbold'),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            'Lorem ispum dolor sit amet',
                                            style: TextStyle(
                                                fontSize: size.height * 0.015,
                                                fontFamily: 'Stf'),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Text(
                                            'Lorem ispum dolor sit amet',
                                            style: TextStyle(
                                                fontSize: size.height * 0.015,
                                                fontFamily: 'Stf'),
                                          ),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      const Spacer(),
                                      InkWell(
                                          onTap: () {
                                            _optionsModalBottomSheet(context);
                                          },
                                          child: Icon(
                                            Icons.more_vert,
                                            color: signupclor_dark,
                                          ))
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _optionsModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return SizedBox(
                height: size.height * 0.26,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'Options',
                                  style: TextStyle(
                                    fontFamily: "MBold",
                                    fontSize: size.height * 0.018,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(Icons.close)),
                              ]),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    grptwo_icon,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    'Groups',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    msgs_icon,
                                    color: signupclor_dark,
                                    height: size.height * 0.04,
                                  ),
                                  Text(
                                    'Message',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    email_icon,
                                    color: signupclor_dark,
                                    height: size.height * 0.04,
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    favoutline_icon,
                                    color: signupclor_dark,
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),
                                  Text(
                                    'Favorites',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.01,
                                right: size.width * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      share_icon,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.022,
                                    ),
                                    Text(
                                      'Share',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Stf"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      reminder,
                                      color: signupclor_dark,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.013,
                                    ),
                                    Text(
                                      'Reminder',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Stf"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      meeting,
                                      color: signupclor_dark,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      'Meeting',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Stf"),
                                    ),
                                  ],
                                ),
                                Globals.teamDetailModel!.teamDetailData!
                                            .deleteCard ==
                                        "1"
                                    ? Column(
                                        children: [
                                          SvgPicture.asset(
                                            recyclebin_icon,
                                            color: signupclor_dark,
                                            height: size.height * 0.03,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.025,
                                          ),
                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                                fontSize: size.height * 0.015,
                                                fontFamily: "Stf"),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
