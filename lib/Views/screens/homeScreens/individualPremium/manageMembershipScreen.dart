import 'package:concard/Views/screens/homeScreens/individualPremium/cancelMembershipScreen.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';

class ManageMembershipScreen extends StatefulWidget {
  ManageMembershipScreen({Key? key}) : super(key: key);

  @override
  State<ManageMembershipScreen> createState() => _ManageMembershipScreenState();
}

class _ManageMembershipScreenState extends State<ManageMembershipScreen> {
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
                  Text(
                    'Manage membership',
                    style: TextStyle(
                        fontFamily: "MBold",
                        fontSize: size.height * 0.018,
                        color: bckgrnd),
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
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                          radius: size.height * 0.04, backgroundColor: btnclr),
                    ),
                    ClipRRect(
                      child: Center(
                        child: Image.asset(
                          premium_icon,
                          height: size.height * 0.06,
                          // scale: size.height*0.01,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Premium membership: \$ 5/month',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: "Mbold",
                  ),
                ),
                Text(
                  'Next billing date: Apr 16, 2022',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: "Stf",
                  ),
                ),
                SizedBox(
                  height: size.height*0.03,
                ),
                Container(
                  height: size.height * 0.23,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: btnclr),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.03),
                          child: Text(
                            'Upcoming Payments',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "Mbold",
                                color: gradientgreen),
                          ),
                        ),
                         SizedBox(height: size.height*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'May 16, 2022',
                                style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Stf",
                                ),
                              ),
                              Text(
                                'Premiun, Monthly \$5/ Monthly',
                                style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Stf",
                                ),
                              ),
                            ],
                          ), 
                        ),
                        SizedBox(height:size.height*0.02),
                         Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                              'Payment method',
                              style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "Mbold",
                                  color: gradientgreen),
                            ),
                            Container(
                              height:size.height*0.04,
                              width: size.width*0.15,
                              decoration: BoxDecoration(
                                color: btnclr,
                                border: Border.all(color: gradientgreen),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('Edit',
                              style: TextStyle(
                                fontSize: size.height*0.015,
                                fontFamily: "MBold",
                                color: gradientgreen
                              ),
                              )),
                            )
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.01),
                            child: Row(
                              children: [
                                Image.asset(visapay,height:size.height*0.05),
                                SizedBox(
                                  width: size.width*0.03,
                                ),
                                Text('Card ending with **89')
                              ],),
                          )
                      ]),
                ),
                SizedBox(
                  height: size.height*0.3,
                ),
                Padding(
                  padding:  EdgeInsets.only(left:size.width*0.07,right: size.width*0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          _pauseMembershipModalBottomSheet(context);
                        },
                        child: Container(
                          height:size.height*0.05,
                          width:size.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: signupclor_dark),
                            borderRadius:BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(pause_icon),
                                Text('Pause membership',
                                style:TextStyle(
                                  fontSize: size.height*0.014,
                                  fontFamily: "MBold",
                                  color: signupclor_dark
                                )
                                ),
                              ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>CancelMembershipScreen()));
                        },
                        child: Container(
                          height:size.height*0.05,
                          width:size.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: crs_clr),
                            borderRadius:BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: size.width*0.01,right: size.width*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.close,color: crs_clr,),
                                Text('Cancle membership',
                                style:TextStyle(
                                  fontSize: size.height*0.014,
                                  fontFamily: "MBold",
                                  color: crs_clr
                                )
                                ),
                              ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _pauseMembershipModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
        ),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                  height: size.height*.3,
                  width:size.width,
                child: Padding(
                  padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03,top: size.height*0.02),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Pause membership',
                          style: TextStyle(
                            fontFamily: "MBold",
                            fontSize:size.height*0.018,
                            color: gradientgreen
                          ),),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close,size: size.height*0.03,))
                        ],
                      ),
                      SizedBox(height: size.height*0.01,),
                      Text('Hello XXX,',
                      style: TextStyle(
                        fontFamily: "MBold",
                        fontSize: size.height*0.018
                      ),
                      ),
                      SizedBox(height: size.height*0.001,),
                      Text('Going on a vacations?',
                      style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.016,
                      ),
                      ),
                      SizedBox(height: size.height*0.001,),
                      Text('You can Pause your membership and save\nsome money.',
                      style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.016
                      ),
                      ),
                      SizedBox(height: size.height*0.001,),
                      Text('You can resume anytime like nothing\nhappened.',
                      style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.016                      ),
                      ),
                      SizedBox(height: size.height*0.001,),
                      Text('You can still use all premium features until\nthe end of your billing period on 12 May 2022',
                      style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.016
                      ),
                      ),
                      SizedBox(
                        height: size.height*0.016,
                      ),
                      Container(
                          height:size.height*0.05,
                          width:size.width*0.9,
                          decoration: BoxDecoration(
                            border: Border.all(color: signupclor_dark),
                            borderRadius:BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(pause_icon),
                                Text('Pause membership',
                                style:TextStyle(
                                  fontSize: size.height*0.018,
                                  fontFamily: "MBold",
                                  color: signupclor_dark
                                )
                                ),
                                Container(
                                  width: size.width*0.1,
                                )
                              ]),
                          ),
                        ),
                    ]
                  ),
                ),
              );
            },
          );
        });
  }
}
