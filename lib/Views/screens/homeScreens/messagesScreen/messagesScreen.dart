import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/OthersController/date_time.dart';
import 'package:concard/Controllers/indiviualController/chat_controller.dart';
import 'package:concard/Models/Indiviuals/conversations_model.dart';
import 'package:concard/Views/screens/homeScreens/messagesScreen/inboxChatScreen.dart';
import 'package:concard/Views/screens/homeScreens/messagesScreen/newMessageScreen.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Constants/colors.dart';
import '../notifications/notificationsScreen.dart';
import '../personalProfileViewScreen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

var isSelected = false;
var myClr = Colors.white;

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
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
                  // GestureDetector(
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: Icon(
                  //       Icons.arrow_back_ios,
                  //       size: 20,
                  //       color: bckgrnd,
                  //     )),
                  // SizedBox(width: 120,),
                  Row(
                    children: [
                      Image.asset(
                        msgs_icon,
                        color: bckgrnd,
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Messages',
                          style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontFamily: 'MBold',
                              color: bckgrnd),
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(width: 80,),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        const NotificationsScreen()));
                          },
                          child: Image.asset(
                            notify_icon,
                            height: 20,
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
                                      const PersonalProfileViewScreen()));
                        },
                        child: CircleAvatar(
                            radius: size.height * 0.02,
                            backgroundImage: const NetworkImage(
                              "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.13),
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                color: btnclr,
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Messages',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: 'MBold',
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const NewMessageScreen()));
                          },
                          child: Image.asset(
                            edit_icon,
                            color: cgreen,
                          ))
                    ],
                  ),
                  margin: const EdgeInsets.only(left: 15, right: 15),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    'Wednesday, 24 February 2022',
                    style: TextStyle(
                      fontSize: size.height * 0.015,
                      fontFamily: 'Msemibold',
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.04, right: size.width * 0.04),
                  height: size.height * 0.09,
                  width: size.width,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search messages',
                        contentPadding: const EdgeInsets.only(
                            top: 0.0, left: 22.0, bottom: 2.0),
                        fillColor: bckgrnd,
                        filled: true,
                        prefixIcon: Image.asset(srch_icon, color: infocolor),
                        hintStyle: TextStyle(
                            fontSize: size.height * 0.015, color: infocolor),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: bckgrnd)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: bckgrnd))),
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: size.height * 0.3),
              // height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: bckgrnd,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: FutureBuilder<ConversationsListModel?>(
                  future: ChatController().getConversationsList(),
                  builder: (context, snapshot) {
                    ConversationsListModel? conversationsList = snapshot.data;
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: size.height * 1.0,
                        width: size.width,
                        child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: conversationsList!.count,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              String? passTime = DateTimeManueplate()
                                  .giveDifferenceInTime(DateTime.parse(
                                      conversationsList
                                          .conversations![index].updatedAt
                                          .toString()));
                              return InkWell(
                                onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => InboxScreen(
                                                conversation: conversationsList
                                                    .conversations![index],
                                              )))
                                  // showMenu(context: context, position: , items: <PopupMenuEntry>);
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: size.height * 0.02,
                                        left: size.width * 0.04,
                                        right: size.width * 0.04),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                radius: size.height * 0.03,
                                                backgroundImage: NetworkImage(
                                                    conversationsList
                                                        .conversations![index]
                                                        .recipient!
                                                        .image!)),
                                            SizedBox(width: size.width * 0.03),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${conversationsList.conversations![index].recipient!.firstName} ${conversationsList.conversations![index].recipient!.lastName}',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: 'Mbold'),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.015,
                                                ),
                                                Text(
                                                  '${conversationsList.conversations![index].message!.text}',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: 'Stf'),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  radius: 8,
                                                  backgroundColor: cgreen,
                                                  child: Text(
                                                    '${conversationsList.conversations![index].unreadCounts}',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.018,
                                                        color: bckgrnd),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.015,
                                                ),
                                                Text(
                                                  passTime.toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: "Msemibold",
                                                      color: infocolor),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          thickness: 1,
                                        ),
                                      ],
                                    )),
                              );
                            }),
                      );
                    }
                    return const ShimmerLoadWidget();
                  }))
        ],
      ),
    ));
  }
}
