import 'package:concard/Constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Constants/colors.dart';

class AnalyticsScreen extends StatefulWidget {
  AnalyticsScreen({Key? key}) : super(key: key);

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
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
                    left: size.width * 0.04, right: size.width * 0.04,top: size.height*0.04),
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
                    Row(
                      children: [
                        Image.asset(analyticstats_icon),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          'Analytics',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "MBold",
                              color: bckgrnd),
                        ),
                      ],
                    ),

                    // SizedBox(
                    //   width: 110,
                    // ),
                    Container(
                      width: size.width * 0.05,
                    ),
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Download data',
                          style: TextStyle(
                            fontSize: size.height * 0.015,
                            fontFamily: "Msemibold",
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        SvgPicture.asset(
                          downloading_icon,
                          color: Colors.black,
                          height: size.height * 0.02,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      height: size.height*0.15,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: bckgrnd,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: size.height*0.11,
                            width: size.width*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      prmryblue,
                                      darkblue
                                    ]
                                )
                            ),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('35',style: TextStyle(
                                          fontFamily: "Msemibold",
                                          color: bckgrnd,fontSize: size.height*0.03
                                      ),),
                                      SvgPicture.asset(groupreach_icon,color: bckgrnd,)
                                    ],
                                  ),
                                  margin: EdgeInsets.only(top: size.height*0.01,right: size.width*0.02,left: size.width*0.03),
                                ),
                                SizedBox(height: size.height*0.015,),
                                Container(
                                  margin: EdgeInsets.only(left: size.width*0.017),
                                  child: Text('Reached\nConcards',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      color: bckgrnd,fontSize: size.height*0.017
                                  ),),
                                ),

                              ],
                            ) ,
                          ),
                          Container(
                            height: size.height*0.11,
                            width: size.width*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [

                                      gradientgreen,
                                      primarygreen,

                                    ]
                                )
                            ),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('24',style: TextStyle(
                                          fontFamily: "Msemibold",
                                          color: bckgrnd,fontSize: size.height*0.03
                                      ),),
                                      SvgPicture.asset(downloading_icon,color: bckgrnd,)
                                    ],
                                  ),
                                  margin: EdgeInsets.only(top: size.height*0.01,right: size.width*0.02,left: size.width*0.03),
                                ),
                                SizedBox(height: size.height*0.015,),
                                Container(
                                  margin: EdgeInsets.only(left: size.width*0.017),
                                  child: Text('Saved\nConcards',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      color: bckgrnd,fontSize: size.height*0.017
                                  ),),
                                ),

                              ],
                            ) ,
                          ),
                          Container(
                            height: size.height*0.11,
                            width: size.width*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      signupclor_light,
                                      signupclor_dark
                                    ]
                                )
                            ),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('12',style: TextStyle(
                                          fontFamily: "Msemibold",
                                          color: bckgrnd,fontSize: size.height*0.03
                                      ),),
                                      SvgPicture.asset(favoutline_icon,color: bckgrnd,height: size.height*0.04,)
                                    ],
                                  ),
                                  margin: EdgeInsets.only(top: size.height*0.01,right: size.width*0.02,left: size.width*0.03),
                                ),
                                SizedBox(height: size.height*0.02,),
                                Container(
                                  margin: EdgeInsets.only(left: size.width*0.03),
                                  child: Text('Favorites',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      color: bckgrnd,fontSize: size.height*0.017
                                  ),),
                                ),

                              ],
                            ) ,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "Connections last 90 days",
                      style: TextStyle(
                          fontSize: size.height * 0.018,
                          color: Colors.black,
                          fontFamily: 'MBold'),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Container(
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bckgrnd,
                      ),
                      width: size.width,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          left: size.width * 0.04,
                          right: size.width * 0.04,),
                        child: Column(
                          children: [
                            Image.asset(grphpicture),
                            Container(
                              height: size.height * 0.05,
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: infocolor
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                children: [
                                  Text('01 '),
                                  Text(' 02 '),
                                  Text(' 03 '),
                                  Text(' 04 '),
                                  Text(' 05 '),
                                  Text(' 06 '),
                                  Text(' 07 '),
                                  Text(' 08 '),
                                  Text(' 09 '),
                                  Text('10'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(),
                    Text(
                      "Connections / month",
                      style: TextStyle(
                          fontSize: size.height * 0.018,
                          color: Colors.black,
                          fontFamily: 'MBold'),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bckgrnd,
                      ),
                      height: size.height * 0.25,
                      width: size.width,
                      child: Image.asset(monthgrph,height: size.height*0.2,),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Text(
                      "Cards Distribution",
                      style: TextStyle(
                          fontSize: size.height * 0.018,
                          color: Colors.black,
                          fontFamily: 'MBold'),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bckgrnd,
                      ),
                      height: size.height * 0.2,
                      width: size.width,
                      child: Padding(
                        padding:EdgeInsets.only(left: size.width*0.03,top: size.height*0.03),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(donut),
                                SizedBox(width: size.width*0.05,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text('23%',style: TextStyle(
                                          fontFamily: "Msemibold",
                                          fontSize: size.height*0.015,
                                        ),),
                                        SizedBox(width: size.width*0.02,),
                                        Icon(Icons.circle,size: 25,color: gradientgreen,),
                                        SizedBox(width: size.width*0.02,),
                                        Text("Who's got your card ",style: TextStyle(
                                          fontFamily: "Stf",
                                          fontSize: size.height*0.015,
                                        ),),
                                      ],
                                    ),
                                    SizedBox(height: size.height*0.01,),
                                    Row(
                                      children: [
                                        Text('43%',style: TextStyle(
                                          fontFamily: "Msemibold",
                                          fontSize: size.height*0.015,
                                        ),),
                                        SizedBox(width: size.width*0.02,),
                                        Icon(Icons.circle,size: 25,color: signupclor_light,),
                                        SizedBox(width: size.width*0.02,),
                                        Text("Connections ",style: TextStyle(
                                          fontFamily: "Stf",
                                          fontSize: size.height*0.015,
                                        ),),
                                      ],
                                    ),
                                    SizedBox(height: size.height*0.01,),
                                    Row(
                                      children: [
                                        Text('70%',style: TextStyle(
                                          fontFamily: "Msemibold",
                                          fontSize: size.height*0.015,
                                        ),),
                                        SizedBox(width: size.width*0.02,),
                                        Icon(Icons.circle,size: 25,color: prmryblue,),
                                        SizedBox(width: size.width*0.02,),
                                        Text("VIP",style: TextStyle(
                                          fontFamily: "Stf",
                                          fontSize: size.height*0.015,
                                        ),),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Text(
                      "Top Industries/ Fields",
                      style: TextStyle(
                          fontSize: size.height * 0.018,
                          color: Colors.black,
                          fontFamily: 'Msemibold'),
                    ),
                    SizedBox(height: size.height * 0.03,),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bckgrnd,
                      ),
                      height: size.height * 0.3,
                      width: size.width,
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.02,top: size.height*0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Oil & Gas',style: TextStyle(
                                  fontFamily: "Msemibold",
                                  fontSize: size.height*0.015,
                                ),),
                                Spacer(),
                                Row(
                                  children: [
                                    Image.asset(one),
                                    SizedBox(width: size.width*0.02,),
                                    Text('34%',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.015,
                                    ),),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: size.height*0.01,),
                            Row(
                              children: [
                                Text('Mining',style: TextStyle(
                                  fontFamily: "Msemibold",
                                  fontSize: size.height*0.015,
                                ),),
                                Spacer(),
                                Row(
                                  children: [
                                    Image.asset(two),
                                    SizedBox(width: size.width*0.02,),
                                    Text('34%',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.015,
                                    ),),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: size.height*0.01,),
                            Row(
                              children: [
                                Text('Food & Beverages',style: TextStyle(
                                  fontFamily: "Msemibold",
                                  fontSize: size.height*0.015,
                                ),),
                                Spacer(),
                                Row(
                                  children: [
                                    Image.asset(three),
                                    SizedBox(width: size.width*0.02,),
                                    Text('34%',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.015,
                                    ),),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: size.height*0.01,),
                            Row(
                              children: [
                                Text('Education',style: TextStyle(
                                  fontFamily: "Msemibold",
                                  fontSize: size.height*0.015,
                                ),),
                                Spacer(),
                                Row(
                                  children: [
                                    Image.asset(four),
                                    SizedBox(width: size.width*0.02,),
                                    Text('34%',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.015,
                                    ),),
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: size.height*0.01,),
                            Row(
                              children: [
                                Text('Technology',style: TextStyle(
                                  fontFamily: "Msemibold",
                                  fontSize: size.height*0.015,
                                ),),
                                Spacer(),
                                Row(
                                  children: [
                                    Image.asset(five),
                                    SizedBox(width: size.width*0.02,),
                                    Text('34%',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.015,
                                    ),),
                                  ],
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.1,)
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}