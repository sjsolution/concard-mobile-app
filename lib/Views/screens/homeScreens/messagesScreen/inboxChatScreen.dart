import 'dart:developer';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Controllers/OthersController/url_launcher_class.dart';
import 'package:concard/Controllers/indiviualController/chat_controller.dart';
import 'package:concard/Models/Indiviuals/chat_list_model.dart';
import 'package:concard/Models/Indiviuals/conversations_model.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/allCardsScreen.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:intl/intl.dart';
import 'package:concard/Controllers/indiviualController/chat_controller.dart';

import '../../../../Constants/images.dart';

class InboxScreen extends StatefulWidget {
  InboxScreen({Key? key, required this.conversation}) : super(key: key);
  Conversations? conversation;

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  var messageController = TextEditingController();
  bool isSend = false;

  onChange() async {
    if (messageController.text.isEmpty) {
      setState(() {
        isSend = false;
      });
    } else {
      setState(() {
        isSend = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    messageController.addListener(() {
      onChange();
    });
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
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
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Row(
                          children: [
                            Image.asset(drwrmyacunt_icon),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              'Jack Bill',
                              style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                  color: bckgrnd),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                await URLLauncherClass()
                                    .launchUrl("+92123456789");
                              },
                              child: SizedBox(
                                height: size.height * 0.04,
                                width: size.width * .08,
                                // color: Colors.red,
                                child: SvgPicture.asset(
                                  phonecall_icon,
                                  color: bckgrnd,
                                  height: size.height * 0.03,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            InkWell(
                                onTap: () {
                                  _settingModalBottomSheet(context);
                                },
                                child: Icon(
                                  Icons.more_vert,
                                  color: bckgrnd,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
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
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.04),
                child: Column(
                  children: [
                    Expanded(
                        child: FutureBuilder<ChatListModel?>(
                            future: ChatController().getChatList(
                                widget.conversation!.recipient!.id.toString()),
                            builder: (context, snapshot) {
                              ChatListModel? chatsList = snapshot.data;
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  itemCount: chatsList!.messages!.length,
                                  itemBuilder: (context, index) {
                                    log(Globals.userId.toString());
                                    return Globals.userId ==
                                            chatsList.messages![index].userId
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  // messages[index]["read"]
                                                  //     ? SvgPicture.asset(downloading_icon,color: Colors.black,)
                                                  //     : SizedBox(),
                                                  Column(
                                                    children: [
                                                      Container(
                                                          alignment: Globals
                                                                      .userId ==
                                                                  chatsList
                                                                      .messages![
                                                                          index]
                                                                      .userId
                                                              ? Alignment
                                                                  .topRight
                                                              : Alignment
                                                                  .topLeft,
                                                          margin: EdgeInsets.only(
                                                              bottom:
                                                                  size.height *
                                                                      .02),
                                                          padding: EdgeInsets.only(
                                                              left: size.height *
                                                                  .02,
                                                              top: size.height *
                                                                  .02,
                                                              right:
                                                                  size.height *
                                                                      .02,
                                                              bottom:
                                                                  size.height *
                                                                      .02),
                                                          // height: size.height * .17,
                                                          width:
                                                              size.height * .3,
                                                          decoration: BoxDecoration(
                                                            color: Globals
                                                                        .userId ==
                                                                    chatsList
                                                                        .messages![
                                                                            index]
                                                                        .userId
                                                                ? cgreen
                                                                : bckgrnd,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Globals
                                                                          .userId ==
                                                                      chatsList
                                                                          .messages![
                                                                              index]
                                                                          .userId
                                                                  ? Radius.circular(
                                                                      size.height *
                                                                          .02)
                                                                  : Radius.circular(
                                                                      size.height *
                                                                          .0),
                                                              topRight: Globals
                                                                          .userId ==
                                                                      chatsList
                                                                          .messages![
                                                                              index]
                                                                          .userId
                                                                  ? Radius.circular(
                                                                      size.height *
                                                                          .0)
                                                                  : Radius.circular(
                                                                      size.height *
                                                                          .02),
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      size.height *
                                                                          .02),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      size.height *
                                                                          .02),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment: Globals
                                                                        .userId ==
                                                                    chatsList
                                                                        .messages![
                                                                            index]
                                                                        .userId
                                                                ? MainAxisAlignment
                                                                    .end
                                                                : MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                chatsList
                                                                    .messages![
                                                                        index]
                                                                    .text!,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        size.height *
                                                                            .015),
                                                              ),
                                                            ],
                                                          )),
                                                      Text(
                                                        DateFormat.jm()
                                                            .format(DateTime
                                                                .parse(chatsList
                                                                    .messages![
                                                                        index]
                                                                    .createdAt!))
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontFamily: "Stf",
                                                            color: infocolor),
                                                      ),
                                                    ],
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.02,
                                                  ),
                                                  Container(
                                                    child: Image.asset(
                                                        drwrmyacunt_icon),
                                                    margin: EdgeInsets.only(
                                                        bottom:
                                                            size.height * 0.04),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                child: Image.asset(
                                                    drwrmyacunt_icon),
                                                margin: EdgeInsets.only(
                                                    bottom: size.height * 0.04),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.04,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                      alignment: Globals
                                                                  .userId ==
                                                              chatsList
                                                                  .messages![
                                                                      index]
                                                                  .userId
                                                          ? Alignment.topRight
                                                          : Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          bottom: size.height *
                                                              .02),
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              size.height * .02,
                                                          top:
                                                              size.height * .02,
                                                          right:
                                                              size.height * .02,
                                                          bottom: size.height *
                                                              .02),
                                                      // height: size.height * .17,
                                                      width: size.height * .3,
                                                      decoration: BoxDecoration(
                                                        color: Globals.userId ==
                                                                chatsList
                                                                    .messages![
                                                                        index]
                                                                    .userId
                                                            ? primarygreen
                                                            : bckgrnd,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft: Globals
                                                                      .userId ==
                                                                  chatsList
                                                                      .messages![
                                                                          index]
                                                                      .userId
                                                              ? Radius.circular(
                                                                  size.height *
                                                                      .02)
                                                              : Radius.circular(
                                                                  size.height *
                                                                      .0),
                                                          topRight: Globals
                                                                      .userId ==
                                                                  chatsList
                                                                      .messages![
                                                                          index]
                                                                      .userId
                                                              ? Radius.circular(
                                                                  size.height *
                                                                      .0)
                                                              : Radius.circular(
                                                                  size.height *
                                                                      .02),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  size.height *
                                                                      .02),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  size.height *
                                                                      .02),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: Globals
                                                                    .userId ==
                                                                chatsList
                                                                    .messages![
                                                                        index]
                                                                    .userId
                                                            ? MainAxisAlignment
                                                                .end
                                                            : MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            chatsList
                                                                .messages![
                                                                    index]
                                                                .text!,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize:
                                                                    size.height *
                                                                        .015),
                                                          ),
                                                        ],
                                                      )),
                                                  Text(
                                                    DateFormat.jm()
                                                        .format(DateTime.parse(
                                                            chatsList
                                                                .messages![
                                                                    index]
                                                                .createdAt!))
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: "Stf",
                                                        color: infocolor),
                                                  ),
                                                ],
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                              ),
                                            ],
                                          );
                                  },
                                );
                              }
                              return const ShimmerLoadWidget();
                            })),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.08,
              width: size.width,
              color: bckgrnd,
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.02,
                    right: size.width * 0.02,
                    bottom: size.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: !isSend ? size.width * 0.6 : size.width * 0.8,
                      child: TextFormField(
                        controller: messageController,
                        decoration: InputDecoration(
                            hintText: 'Type your message',
                            contentPadding: const EdgeInsets.only(
                                top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle: TextStyle(
                                fontSize: size.width * 0.04, color: infocolor),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25))),
                      ),
                    ),
                    !isSend
                        ? Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                Image.asset(chatgallery_icon),
                                const SizedBox(width: 15),
                                Image.asset(chatcamera_icon),
                                const SizedBox(width: 15),
                                Image.asset(chatmic),
                              ])
                        : Row(
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                                const SizedBox(width: 15),
                                InkWell(
                                  onTap: () async {
                                    print(messageController.text.trim());

                                    var result = await ChatController()
                                        .sendMessage(Globals.userId,
                                            messageController.text.trim());
                                    messageController.clear();
                                    if (result) {
                                      setState(() {});
                                    }
                                  },
                                  child: Icon(
                                    Icons.send,
                                    size: size.height * 0.03,
                                    color: signupclor_light,
                                  ),
                                )
                              ])
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void _settingModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 0.33,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: Image.asset(contactbook),
                        title: new Text(
                          'View Card',
                          style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.018,
                          ),
                        ),
                        onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AllCardsScreen()))
                            }),
                    new ListTile(
                      leading: Image.asset(
                        muteuser_icon,
                        color: signupclor_dark,
                      ),
                      title: new Text(
                        'Mute messages',
                        style: TextStyle(
                          fontFamily: 'Stf',
                          fontSize: size.height * 0.018,
                        ),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: Image.asset(block_icon),
                      title: new Text(
                        'Block',
                        style: TextStyle(
                            fontFamily: "Msemibold",
                            fontSize: size.height * 0.018),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: SvgPicture.asset(
                        recyclebin_icon,
                        color: signupclor_dark,
                      ),
                      title: new Text(
                        'Delete',
                        style: TextStyle(
                            fontFamily: "Msemibold",
                            fontSize: size.height * 0.018),
                      ),
                      onTap: () => {},
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
