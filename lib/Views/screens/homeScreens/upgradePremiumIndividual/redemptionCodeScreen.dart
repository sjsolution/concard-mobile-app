import 'package:concard/Constants/colors.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:concard/Views/screens/globals.dart' as globals;

class RedemptionCodeScreen extends StatefulWidget {
  RedemptionCodeScreen({Key? key}) : super(key: key);

  @override
  State<RedemptionCodeScreen> createState() => _RedemptionCodeScreenState();
}

class _RedemptionCodeScreenState extends State<RedemptionCodeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMenuScreen(),
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
                  left: size.width * 0.04, right: size.width * 0.04),
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
                      )),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.01),
                    child: Text(
                      'Code Redemption',
                      style: TextStyle(
                          fontFamily: "MBold",
                          fontSize: size.height * 0.018,
                          color: bckgrnd),
                    ),
                  ),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.08,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.13),
            // height: size.height*0.8,
            width: size.width,
            decoration: BoxDecoration(
                color: bckgrnd,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.8,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: btnclr,
                              filled: true,
                              hintText: 'Please enter your redemption code',
                              contentPadding: EdgeInsets.only(
                                  left: 22.0, top: 20, bottom: 0, right: 0),
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.015,
                                  color: infocolor,
                                  fontFamily: "Stf"),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: btnclr)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: btnclr))),
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: infocolor,
                        height: size.height * 0.001,
                        width: size.width * 0.1,
                      ),
                      Text(
                        'Are you a Premium Company Member?',
                        style: TextStyle(
                          fontSize: size.height * 0.016,
                          fontFamily: "Mbold",
                        ),
                      ),
                      Container(
                        color: infocolor,
                        height: size.height * 0.001,
                        width: size.width * 0.1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Your company Admin will need your device ID to',
                    style: TextStyle(
                      fontSize: size.height * 0.015,
                      fontFamily: "Stf",
                    ),
                  ),
                  Text(
                    'authorize your usage of ConCard Premium.',
                    style: TextStyle(
                      fontSize: size.height * 0.015,
                      fontFamily: "Stf",
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Container(
                                  margin: EdgeInsets.only(
                                      bottom: size.height * 0.1),
                                  child: Dialog(
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    //this right here
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: btnclr,
                                      ),
                                      height: size.height * 0.26,
                                      width: size.width * 0.9,
                                      child: Padding(
                                         padding: EdgeInsets.only(
                                                left: size.width * 0.04,
                                                right: size.width * 0.04,
                                                top: size.height * 0.02),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text(
                                                  'Device ID',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height *
                                                              0.018,
                                                      fontFamily:
                                                          "Msemibold"),
                                                ),
                                                Spacer(),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(
                                                          context);
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      size:
                                                          size.height *
                                                              0.03,
                                                    )),
                                              ],
                                            ),
                                           SizedBox(height: size.height*0.03,),
                                           Text('Your Device ID is CID-123A456Z22',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily: "Stf",
                                           ),),
                                         Text('share it with your company admin to have access',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily: "Stf",
                                           ),),
                                            Text('to your premium features.',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily: "Stf",
                                           ),),
                                           SizedBox(height: size.height*0.04,),
                                           Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: size.height*0.05,
                                                width: size.width*0.3,
                                                decoration:BoxDecoration(
                                                  border: Border.all(color: signupclor_dark),
                                                  borderRadius: BorderRadius.circular(20),
                                                  color:btnclr
                                                ),
                                                child: Center(
                                                  child: Text('Send via email',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily: "Msemibold",
                                            color: signupclor_dark
                                           ),),
                                                ), 
                                              ),
                                              Container(
                                                height: size.height*0.05,
                                                width: size.width*0.3,
                                                decoration:BoxDecoration(
                                                  border: Border.all(color: signupclor_dark),
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: btnclr
                                                ),
                                                child: Center(
                                                  child: Text('Copy',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily: "Msemibold",
                                            color: signupclor_dark
                                           ),),
                                                ), 
                                              )
                                            ],
                                           )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                      },
                      child: Text(
                        'Device ID',
                        style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Stf",
                            color: signupclor_dark),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.5,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pop(context);

                        setState(() {
                          globals.isAccespremium = true;
                        });
                      },
                      child: Center(
                          child: CustomButton(
                              text: 'Redeem code',
                              color1: signupclor_light,
                              color2: signupclor_dark,
                              textcolor1: bckgrnd,
                              textcolor2: bckgrnd)))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
