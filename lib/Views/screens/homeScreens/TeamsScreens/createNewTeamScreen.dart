import 'dart:io';

import 'package:concard/Controllers/OthersController/image_picker_controller.dart';
import 'package:concard/Controllers/indiviualController/team_controllers.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/createTeamScreen.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/teamsFilterScreen.dart';
import 'package:concard/Views/widgets/imagePickerWidget.dart';
import 'package:concard/Views/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';

import '../../../../Constants/colors.dart';

class CreateNewTeamScreen extends StatefulWidget {
  CreateNewTeamScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewTeamScreen> createState() => _CreateNewTeamScreenState();
}

class _CreateNewTeamScreenState extends State<CreateNewTeamScreen> {
  bool? switchInvite = false;
  bool? switchAdd = false;
  bool? switchDelete = false;
  bool? switchRemove = false;
  File? teamIcon;
  var formKey = GlobalKey<FormState>();
  var teamNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, app, _) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height * 0.15,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [signupclor_light, signupclor_dark]),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.04),
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
                      'Create new team',
                      style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBold", color: bckgrnd),
                    ),
                    // SizedBox(
                    //   width: 110,
                    // ),
                    InkWell(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            context.read<AppProvider>().setLoadingTrue();
                            loaderWidget(context, size);
                            debugPrint(teamNameController.text.toString());
                            debugPrint("Add Memeber:" + switchAdd.toString());
                            debugPrint("Invite Memeber:" + switchInvite.toString());
                            debugPrint("Delete Memeber:" + switchDelete.toString());
                            debugPrint("Remove Memeber:" + switchRemove.toString());

                            await TeamController().addTeam(
                              teamIcon: teamIcon != null ? teamIcon!.path : '',
                              teamName: teamNameController.text.trim(),
                              inviteMembers: switchInvite,
                              addCards: switchAdd,
                              deleteSharedCard: switchDelete,
                              removeMembers: switchRemove,
                            );
                            context.read<AppProvider>().setLoadingFalse();
                            Navigator.pop(context);
                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const TeamsFilterScreen()));
                        },
                        child: Icon(
                          Icons.check,
                          size: size.height * 0.03,
                          color: bckgrnd,
                        ))
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
                padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Add new team',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: 'MBold',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            getImageType(
                              context,
                              () async {
                                Navigator.pop(context);
                                app.setProfileImage(teamIcon = await ImagePickerMethods().getImage(ImageSource.gallery));
                              },
                              () async {
                                Navigator.pop(context);
                                app.setProfileImage(teamIcon = await ImagePickerMethods().getImage(ImageSource.camera));
                              },
                              false,
                              () {},
                            );
                          },
                          child: teamIcon != null
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundColor: primaryblue,
                                  backgroundImage: FileImage(teamIcon!),
                                )
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundColor: primaryblue,
                                  backgroundImage: NetworkImage(''),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Form(
                      key: formKey,
                      child: SizedBox(
                        // height: size.height * 0.09,
                        width: size.width * 0.85,
                        child: TextFormField(
                          controller: teamNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter the team name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: bckgrnd,
                            hintText: 'Team name',
                            contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(color: bckgrnd)),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide(color: bckgrnd)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Text(
                      'Team permission',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: 'MBold',
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Row(
                      children: [
                        Text(
                          'Invite members',
                          style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015,
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: size.height * 0.001,
                          child: CupertinoSwitch(
                              activeColor: gradientgreen,
                              value: switchInvite!,
                              onChanged: (value) {
                                setState(() {
                                  switchInvite = value;
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
                          'Add Cards',
                          style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015,
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: size.height * 0.001,
                          child: CupertinoSwitch(
                              activeColor: gradientgreen,
                              value: switchAdd!,
                              onChanged: (value) {
                                setState(() {
                                  switchAdd = value;
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
                          'Delete Shared Cards',
                          style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015,
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: size.height * 0.001,
                          child: CupertinoSwitch(
                              activeColor: gradientgreen,
                              value: switchDelete!,
                              onChanged: (value) {
                                setState(() {
                                  switchDelete = value;
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
                          'Remove members',
                          style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015,
                          ),
                        ),
                        const Spacer(),
                        Transform.scale(
                          scale: size.height * 0.001,
                          child: CupertinoSwitch(
                              activeColor: gradientgreen,
                              value: switchRemove!,
                              onChanged: (value) {
                                setState(() {
                                  switchRemove = value;
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
    });
  }
}
