import 'package:concard/Constants/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Twostepvarificatio extends StatefulWidget {
  const Twostepvarificatio({ Key? key }) : super(key: key);

  @override
  State<Twostepvarificatio> createState() => _TwostepvarificatioState();
}

class _TwostepvarificatioState extends State<Twostepvarificatio> {
  bool _twostep=false;
  bool _authenticor=false;
  bool _email=false;
  bool _sms=false;
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
              padding: EdgeInsets.only(left: size.width*0.04, right: size.width*0.04, top: size.height*0.03),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Set Two-Step Verification',
                        style: TextStyle(
                            fontSize: size.height * 0.018, fontFamily: 'MBold'),
                      ),
                      Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                            trackColor: Color(0xffD0D0D0),
                            activeColor: txtcolr,
                            value: _twostep,
                            onChanged: (values) {
                              setState(() {
                                _twostep = values;
                              });
                            }),
                      ),
                    ],
                  ),
                  Container(
                    height: size.height * 0.23,
                    width: size.width * 1.0,
                    decoration: BoxDecoration(
                      color: bckgrnd,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                           EdgeInsets.only(left: size.width*0.04,  top: size.height*0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Authenticator App',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: 'Stf',
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: CupertinoSwitch(
                                    trackColor: Color(0xffD0D0D0),
                                    activeColor: txtcolr,
                                    value: _authenticor,
                                    onChanged: (values) {
                                      setState(() {
                                        _authenticor = values;
                                      });
                                    }),
                              ),
                            ],
                          ),
                          Divider(
                            height: size.height * 0.01,
                            color: Color(0xffE6E6E6),
                          ),
                          SizedBox(
                            height: size.height * 0.010,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'By Email',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: 'Stf',
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: CupertinoSwitch(
                                    trackColor: Color(0xffD0D0D0),
                                    activeColor: txtcolr,
                                    value: _email,
                                    onChanged: (values) {
                                      setState(() {
                                        _email = values;
                                      });
                                    }),
                              ),
                            ],
                          ),
                          Divider(
                            height: size.height * 0.01,
                            color: Color(0xffE6E6E6),
                          ),
                          SizedBox(
                            height: size.height * 0.010,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'By SMS',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: 'Stf',
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: CupertinoSwitch(
                                    trackColor: Color(0xffD0D0D0),
                                    activeColor: txtcolr,
                                    value: _sms,
                                    onChanged: (values) {
                                      setState(() {
                                        _sms = values;
                                      });
                                    }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                        'Activate Two-step verification and select one of the 3 methods\nto enhance account security.',
                        style: TextStyle(fontSize: size.height*0.014,fontFamily: 'Stf'),),
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