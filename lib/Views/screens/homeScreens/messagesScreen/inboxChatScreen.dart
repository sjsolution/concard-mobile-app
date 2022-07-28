import 'package:concard/Constants/colors.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/allCardsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants/images.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> messages = [
    {
      "from": "him",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "me",
      "msg": "Lorem ipsum dolor sit amet, consectetur",
      "time": "3:55pm",
      "read": false
    },
    {
      "from": "him",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": false
    },
    {
      "from": "me",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "him",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "me",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "him",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "me",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "him",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "me",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
    {
      "from": "him",
      "msg":
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac sapien tellus netus et.",
      "time": "3:55pm",
      "read": true
    },
  ];
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
                  padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
                  child: Row(
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
                      SizedBox(
                        width: size.width*0.03,
                      ),
                      Row(
                        children: [
                          Image.asset(drwrmyacunt_icon),
                          SizedBox(width: size.width*0.02,),
                          Text(
                            'Jack Bill',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "MBold",
                                color: bckgrnd),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset(phonecall_icon,color: bckgrnd,height:size.height*0.03,),
                          SizedBox(width: size.width*0.04,),
                          InkWell(
                              onTap: (){
                                _settingModalBottomSheet(context);
                              },
                              child: Icon(Icons.more_vert,color: bckgrnd,)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
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
            child:
            Padding(
              padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return messages[index]["from"] == "me"
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  // messages[index]["read"]
                                  //     ? SvgPicture.asset(downloading_icon,color: Colors.black,)
                                  //     : SizedBox(),
                                  Column(
                                    children: [
                                      Container(
                                        // alignment: messages[index]["from"]=="him"?Alignment.topLeft:Alignment.topRight,
                                          margin:
                                          EdgeInsets.only(bottom: size.height * .02),
                                          padding: EdgeInsets.only(
                                              left: size.height * .02,
                                              top: size.height * .02,
                                              right: size.height * .02,
                                              bottom: size.height * .02),
                                          // height: size.height * .17,
                                          width: size.height * .3,
                                          decoration: BoxDecoration(
                                            color: messages[index]["from"] == "him"
                                                ? bckgrnd
                                                : cgreen,
                                            borderRadius: BorderRadius.only(
                                              topLeft: messages[index]["from"] == "him"
                                                  ? Radius.circular(size.height * .0)
                                                  : Radius.circular(size.height * .02),
                                              topRight: messages[index]["from"] == "him"
                                                  ? Radius.circular(size.height * .02)
                                                  : Radius.circular(size.height * .0),
                                              bottomLeft:
                                              Radius.circular(size.height * .02),
                                              bottomRight:
                                              Radius.circular(size.height * .02),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                            messages[index]["from"] == "him"
                                                ? MainAxisAlignment.start
                                                : MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                messages[index]["msg"],
                                                style:TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: size.height * .015),
                                              ),
                                            ],
                                          )),
                                      Text(
                                        "3:55pm",
                                        style: TextStyle(
                                            fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                  ),
                                  SizedBox(width: size.width*0.02,),
                                  Container(
                                    child: Image.asset(drwrmyacunt_icon),
                                    margin: EdgeInsets.only(bottom: size.height*0.04),),
                                ],
                              ),

                            ],
                          )
                              : Row(
                                children: [
                                  Container(
                                      child: Image.asset(drwrmyacunt_icon),
                                  margin: EdgeInsets.only(bottom: size.height*0.04),),
                                  SizedBox(width: size.width*0.04,),
                                  Column(
                                    children: [
                                      Container(
                                        // alignment: messages[index]["from"]=="him"?Alignment.topLeft:Alignment.topRight,
                                          margin:
                                          EdgeInsets.only(bottom: size.height * .02),
                                          padding: EdgeInsets.only(
                                              left: size.height * .02,
                                              top: size.height * .02,
                                              right: size.height * .02,
                                              bottom: size.height * .02),
                                          // height: size.height * .17,
                                          width: size.height * .3,
                                          decoration: BoxDecoration(
                                            color: messages[index]["from"] == "him"
                                                ? bckgrnd
                                                : primarygreen,
                                            borderRadius: BorderRadius.only(
                                              topLeft: messages[index]["from"] == "him"
                                                  ? Radius.circular(size.height * .0)
                                                  : Radius.circular(size.height * .02),
                                              topRight: messages[index]["from"] == "him"
                                                  ? Radius.circular(size.height * .02)
                                                  : Radius.circular(size.height * .0),
                                              bottomLeft:
                                              Radius.circular(size.height * .02),
                                              bottomRight:
                                              Radius.circular(size.height * .02),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                            messages[index]["from"] == "him"
                                                ? MainAxisAlignment.start
                                                : MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                messages[index]["msg"],
                                                style:TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: size.height * .015),
                                              ),
                                            ],
                                          )),
                                      Text(
                                        "3:55pm",
                                        style: TextStyle(
                                          fontFamily: "Stf",
                                            color: infocolor),
                                      ),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                ],
                              );
                        },
                      )),
                ],
              ),
            ),
          ),
          Container(
            height:size.height*0.08,
            width: size.width,
            color: bckgrnd,
            child: Padding(
              padding: EdgeInsets.only(left: size.width*0.02,right:size.width*0.02,bottom: size.height*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * 0.05,
                    width: size.width*0.6,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Type your message',
                          contentPadding:
                          EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                          hintStyle:
                          TextStyle(fontSize: size.width * 0.04, color: infocolor),
                          border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                    ),
                  ),
                  Image.asset(chatgallery_icon),
                  Image.asset(chatcamera_icon),
                  Image.asset(chatmic),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
  void _settingModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)
            )
        ),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height *0.33,
                width: size.width,

                child: Wrap(
                  children: <Widget>[

                    new ListTile(
                        leading:Image.asset(contactbook),
                        title: new Text('View Card',style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height*0.018,

                        ),),
                        onTap: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>AllCardsScreen()))
                        }),
                    new ListTile(
                      leading:Image.asset(muteuser_icon,color: signupclor_dark,),
                      title: new Text('Mute messages',style: TextStyle(
                        fontFamily: 'Stf',
                        fontSize: size.height*0.018,
                      ),),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading:Image.asset(block_icon),
                      title: new Text('Block',style: TextStyle(
                          fontFamily: "Msemibold",
                          fontSize: size.height*0.018
                      ),),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading:SvgPicture.asset(recyclebin_icon,color: signupclor_dark,),
                      title: new Text('Delete',style: TextStyle(
                          fontFamily: "Msemibold",
                          fontSize: size.height*0.018
                      ),),
                      onTap: () => {},
                    ),
                    SizedBox(
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