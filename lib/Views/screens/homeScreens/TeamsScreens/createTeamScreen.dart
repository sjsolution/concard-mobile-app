import 'package:concard/Controllers/indiviualController/team_controllers.dart';
import 'package:concard/Models/Indiviuals/team_list_model.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/createNewTeamScreen.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/teamsFilterScreen.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/teamsJoinInvite.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({Key? key}) : super(key: key);

  @override
  _CreateTeamScreenState createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
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
                  Row(
                    children: [
                      Image.asset(
                        group,
                        color: bckgrnd,
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Text(
                        'Teams',
                        style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontWeight: FontWeight.bold,
                            color: bckgrnd),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                    width: size.width * 0.03,
                  )
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
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All teams',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: 'MBold',
                            color: signupclor_dark),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      CreateNewTeamScreen()));
                        },
                        child: Container(
                          height: size.height * 0.04,
                          width: size.width * 0.45,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    gradientgreen,
                                    primarygreen,
                                  ]),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.02,
                                right: size.width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: bckgrnd,
                                ),
                                Text(
                                  'Create new Team',
                                  style: TextStyle(
                                      fontFamily: 'MBold',
                                      fontSize: size.height * 0.018,
                                      color: bckgrnd),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                        height: size.height * 0.055,
                        width: size.width * 0.8,
                        child: TextField(
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
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {}, child: SvgPicture.asset(sort_icon))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: size.width,
                      child: FutureBuilder<TeamsListModel?>(
                          future: TeamController().getTeamList(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const ShimmerLoadWidget();
                            }
                            List<TeamDetail>? teamDetail =
                                snapshot.data!.teamDetail;
                            return ListView.builder(
                                padding: const EdgeInsets.all(0),
                                itemCount: teamDetail!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    TeamsJoinInviteScreen(
                                                        teamName:
                                                            teamDetail[index]
                                                                .teamName)));
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      CircleAvatar(
                                                          radius: size.height *
                                                              .035,
                                                          backgroundColor:
                                                              primaryblue,
                                                          backgroundImage:
                                                              NetworkImage(
                                                            teamDetail[index]
                                                                        .image !=
                                                                    null
                                                                ? teamDetail[
                                                                        index]
                                                                    .image!
                                                                : "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                                          )),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '${teamDetail[index].teamName}',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.018,
                                                            fontFamily:
                                                                'Mbold'),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.01,
                                                      ),
                                                      Text(
                                                        DateFormat.yMMMMd()
                                                            .format(DateTime
                                                                .parse(teamDetail[
                                                                        index]
                                                                    .createdAt!))
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.015,
                                                            color: infocolor,
                                                            fontFamily: 'Stf'),
                                                      ),
                                                    ],
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: const [
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
                                                    size: 15,
                                                  )
                                                ],
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 12),
                                          const Divider(
                                            thickness: 1,
                                            indent: 10,
                                            endIndent: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Center(
          //   child: Text(
          //     'Please create a team and add members to\nmanage your cards',
          //     style: TextStyle(color: infocolor, fontSize: size.height * 0.02),
          //   ),
          // )
          // Expanded(
          //     child: ListView.builder(
          //   itemCount: 4,
          //   itemBuilder: (context, index) {
          //     return Text("");
          //   },
          // ))
        ],
      ),
    );
  }
}
