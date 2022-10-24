import 'package:concard/Views/screens/homeScreens/searchScreens/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import '../notifications/notificationsScreen.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body:SingleChildScrollView(
        child: Stack(
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
                padding: EdgeInsets.only(left: size.width*0.04,right:size.width*0.04,top: size.height*0.04 ),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, size: 20, color: bckgrnd,)),
                    Spacer(),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SearchScreen()));
                        },
                        child:  SvgPicture.asset(srchIcon),),
                    SizedBox(width: size.width*0.04,),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>NotificationsScreen()));
                        },
                        child: Image.asset(notify_icon,height: size.height*0.04,)),
                    SizedBox(width: size.width*0.04,),
                    CircleAvatar(
                        radius: size.height*0.02,
                        backgroundImage: NetworkImage(    "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",)),
                    SizedBox(width: size.width*0.01,),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:size.height*0.13),
              height: size.height*0.9,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                       SvgPicture.asset(srchIcon,color: cgreen,),
                        SizedBox(width: 10,),
                        Text(
                          'Search results',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: 'MBold'
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: size.height*0.03,),
                    Row(
                      children: [
                        Icon(Icons.person,size: 25,color: cgreen,),
                        SizedBox(width: size.width*0.01,),
                        Text(
                          'Concard Users',
                          style: TextStyle(
                              fontSize: size.height * 0.017,
                              fontFamily: 'Msemibold'
                          ),
                        ),
                        Spacer(),
                        Text(
                          'See all',
                          style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontFamily: "Stf",
                              color: gradientgreen),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      height: size.height*0.2,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: 8,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      SizedBox(height: size.height*0.02,),
                                      Container(
                                        child: CircleAvatar(
                                          child: ClipRRect(
                                            child: Icon(Icons.person,color: Colors.grey,),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          radius: size.height*0.03,
                                          backgroundColor: infocolor.withOpacity(0.3),
                                        ),
                                      ),
                                      SizedBox(width: size.width*0.04,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: size.height*0.02),
                                          Text('Tomy Jones',style: TextStyle(
                                              fontSize: size.height*0.015,
                                            fontFamily: "MBold"
                                          ),),
                                          Text('Lorem ipsum',style: TextStyle(
                                              fontSize: size.height*0.013,
                                              fontFamily: "Mbold",
                                              color: infocolor
                                          ),),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: size.height * 0.03,
                                            width: size.width * 0.15,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: gradientgreen),
                                                color: btnclr,
                                                borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: Container(
                                              // margin: EdgeInsets.only(left: size.width*0.04),
                                              alignment: Alignment.center,
                                              child: Text('Add', style: TextStyle(
                                                  color: gradientgreen,
                                                  fontSize: size.height*0.015,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Msemibold'
                                              ),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(top: size.height*0.02),
                                ),
                                Divider(thickness: size.height*0.001,
                                color: infocolor.withOpacity(0.3),)
                              ],
                            );
                          }
                      ),
                    ),
                    Divider(thickness: 10,
                    color: bckgrnd,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset(office,color: cgreen,),
                        SizedBox(width: size.width*0.03,),
                        Text(
                          'Company Profile',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: 'Msemibold'
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'See all',
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                 fontFamily: "tf",
                                  color: gradientgreen),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      height: size.height*0.3,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount:10,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        child: ClipRRect(
                                          child: Image.asset(office,fit: BoxFit.cover,),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        radius: size.height*0.03,
                                        backgroundColor: infocolor.withOpacity(0.3),
                                      ),
                                    ),
                                    SizedBox(width: size.width*0.04,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: size.height*0.01),
                                        Text('Company',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily: "Msemibold"
                                        ),),
                                        Text('Lorem ipsum',style: TextStyle(
                                            fontSize: size.height*0.012,
                                            fontFamily: "Msemibold",
                                            color: infocolor
                                        ),),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: size.height * 0.03,
                                            width: size.width * 0.15,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: gradientgreen),
                                                color: btnclr,
                                                borderRadius: BorderRadius.circular(30)
                                            ),
                                            child: Container(
                                              // margin: EdgeInsets.only(left: size.width*0.04),
                                              alignment: Alignment.center,
                                              child: Text('Add', style: TextStyle(
                                                  color: gradientgreen,
                                                  fontSize: size.height*0.015,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Msemibold'
                                              ),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  indent: 5,
                                  endIndent: 5,
                                  color: infocolor.withOpacity(0.3),
                                ),
                              ],
                            );
                          }
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
