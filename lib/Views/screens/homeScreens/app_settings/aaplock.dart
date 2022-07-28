import 'package:concard/Constants/Colors.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/setpasswordlock.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/setpincode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Applockscreen extends StatefulWidget {
  const Applockscreen({Key? key}) : super(key: key);

  @override
  State<Applockscreen> createState() => _ApplockscreenState();
}

class _ApplockscreenState extends State<Applockscreen> {
  bool _applock = false;
  bool _biometric = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
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
              padding:  EdgeInsets.only(left: size.width*0.04, right: size.width*0.04, top: 0.02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'App lock',
                        style: TextStyle(
                            fontSize: size.height * 0.018, fontFamily: 'MBold'),
                      ),
                      Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                            trackColor: Color(0xffD0D0D0),
                            activeColor: txtcolr,
                            value: _biometric,
                            onChanged: (values) {
                              setState(() {
                                _biometric = values;
                              });
                            }),
                      ),
                    ],
                  ),
                          SizedBox(height: size.height*0.01,),

                  Container(
                    height: size.height * 0.25,
                    width: size.width * 1.0,
                    decoration: BoxDecoration(
                      color: bckgrnd,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                           EdgeInsets.only(left: size.width*0.04, top: size.height*0.02,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Biometric',
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
                                    value: _applock,
                                    onChanged: (values) {
                                      setState(() {
                                        _applock = values;
                                      });
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*0.01,),
                          Divider(
                            thickness: 1,
                            endIndent: size.width*0.05,
                            color: Color(0xffE6E6E6),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          Setpincodescreen())));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Set pin Code',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Stf',
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(right: size.width*0.04),
                                  child: Icon(Icons.arrow_forward_ios,size: size.height*0.02,),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: size.height*0.01,),

                          Divider(
                            thickness: 1,
                            endIndent: size.width*0.05,
                            color: Color(0xffE6E6E6),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => Setpasswordlock())));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Set Password lock',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Stf',
                                  ),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(right: size.width*0.04),
                                  child: Icon(Icons.arrow_forward_ios,size: size.width*0.04,),
                                )
                              ],
                            ),
                          ),
                        
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  Text(
                      'Protect your data with App Lock by selecting one of the three methods.\n\nConcard will not store or use your Biometric data for any other purposes.',
                      
                      style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.014

                      ),
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
