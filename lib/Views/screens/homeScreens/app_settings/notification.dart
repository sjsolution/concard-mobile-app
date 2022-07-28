import 'package:concard/Constants/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pushnotifications extends StatefulWidget {
  const Pushnotifications({ Key? key }) : super(key: key);

  @override
  State<Pushnotifications> createState() => _PushnotificationsState();
}

class _PushnotificationsState extends State<Pushnotifications> {
  bool _pushnotification=false;
  bool _complance=false;
  bool _expos=false;
  bool _messages=false;
  bool _connection=false;
  bool _metting=false;
  bool _contact=false;
  bool _position=false;
  bool _concard=false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: Color(0xffF7F7F7),
       body: Stack(
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
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.height * 0.02,
                      color: bckgrnd,
                    ),
                  ),
                  Text(
                    'App Settings',
                    style: TextStyle(
                      fontSize: size.height * 0.020,
                      color: bckgrnd,
                      fontFamily: 'Msemibold',
                    ),
                  ),
                  Container(
                    height: size.height * 0.02,
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
                      padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.03),
                
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Push Notifications',
                          style: TextStyle(
                              fontSize: size.height * 0.018, fontFamily: 'MBold'),
                        ),
                        Transform.scale(
                          scale: 0.6,
                          child: CupertinoSwitch(
                              trackColor: Color(0xffD0D0D0),
                              activeColor: txtcolr,
                              value: _pushnotification,
                              onChanged: (values) {
                                setState(() {
                                  _pushnotification = values;
                                });
                              }),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      height: size.height * 0.6,
                      width: size.width * 1.0,
                      decoration: BoxDecoration(
                        color: bckgrnd,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                              padding:  EdgeInsets.only(left: size.width*0.04,top: size.height*0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Posts from Companies you're following",
                                  style: TextStyle(
                                    fontSize: size.height * 0.017,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                                Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                            trackColor: Color(0xffD0D0D0),
                            activeColor: txtcolr,
                            value: _complance,
                            onChanged: (values) {
                              setState(() {
                                _complance = values;
                              });
                            }),
                      ),
                              ],
                            ),
                            Divider(
                              height: size.height * 0.01,
                              color: Color(0xffE6E6E6),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recognition languages ',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                                Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                            trackColor: Color(0xffD0D0D0),
                            activeColor: txtcolr,
                            value: _expos,
                            onChanged: (values) {
                              setState(() {
                                _expos = values;
                              });
                            }),
                      ),
                              ],
                            ),
                            Divider(
                              height: size.height * 0.01,
                              color: Color(0xffE6E6E6),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Messages ',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                                 Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                            trackColor: Color(0xffD0D0D0),
                            activeColor: txtcolr,
                            value: _messages,
                            onChanged: (values) {
                              setState(() {
                                _messages = values;
                              });
                            }),
                      ),
                              ],
                            ),
                            Divider(
                              height: size.height * 0.01,
                              color: Color(0xffE6E6E6),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Connection requests',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                                Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                            trackColor: Color(0xffD0D0D0),
                            activeColor: txtcolr,
                            value: _connection,
                            onChanged: (values) {
                              setState(() {
                                _connection = values;
                              });
                            }),
                      ),
                              ],
                            ),
                            Divider(
                              height: size.height * 0.01,
                              color: Color(0xffE6E6E6),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Meeting requests',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                                Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                            trackColor: Color(0xffD0D0D0),
                            activeColor: txtcolr,
                            value: _metting,
                            onChanged: (values) {
                              setState(() {
                                _metting = values;
                              });
                            }),
                      ),
                              ],
                            ),
                            Divider(
                              height: size.height * 0.01,
                              color: Color(0xffE6E6E6),
                            ),
                            SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Changes in contact's profiles",
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                                Transform.scale(
                                  scale: 0.6,
                                  child: CupertinoSwitch(
                                      activeColor: txtcolr,
                                      // thumbColor: Color(0xffF16522),
                                      trackColor: Color(0xffD0D0D0),
                                      value: _contact,
                                      onChanged: (value) {
                                        setState(() {
                                          _contact = value;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Divider(
                              height: size.height * 0.01,
                              color: Color(0xffE6E6E6),
                            ),
                             SizedBox(height: size.height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Position change',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                                Transform.scale(
                                  scale: 0.6,
                                  child: CupertinoSwitch(
                                      activeColor: txtcolr,
                                      // thumbColor: Color(0xffF16522),
                                      trackColor: Color(0xffD0D0D0),
                                      value: _position,
                                      onChanged: (value) {
                                        setState(() {
                                          _position = value;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            Divider(
                              height: size.height * 0.01,
                              color: Color(0xffE6E6E6),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Concard Recommendations',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                                Transform.scale(
                                  scale: 0.6,
                                  child: CupertinoSwitch(
                                      activeColor: txtcolr,
                                      // thumbColor: Color(0xffF16522),
                                      trackColor: Color(0xffD0D0D0),
                                      value: _concard,
                                      onChanged: (value) {
                                        setState(() {
                                          _concard = value;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
              ),
        ),
      ],
    ),
    );
  }
}