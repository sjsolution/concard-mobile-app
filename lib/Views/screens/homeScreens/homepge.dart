import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:concard/Views/screens/homeScreens/personalProfileViewScreen.dart';
import 'package:concard/Views/screens/homeScreens/searchScreens/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool hide=false;
  bool likeIndex=false;
  bool commentIndex=false;
  bool shareIndex=false;
  bool isLike=false;
  bool isSelected=false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      // bottomNavigationBar: BottomNavigationScreen(),
      drawer: DrawerMenuScreen(),
      body: SingleChildScrollView(
        child: Stack(
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
                  child: Padding(
                    padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () => _scaffoldKey.currentState!.openDrawer(),
                            child: Image.asset(more_icon,height: size.height*0.03,)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                           GestureDetector(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SearchScreen()));
                               },
                               child: Image.asset(srch_icon,height:size.height*0.04,)),
                            SizedBox(width: size.width*0.04,),
                            GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>NotificationsScreen()));
                                },
                                child: Image.asset(notify_icon,height: size.height*0.04,)),
                            SizedBox(width: size.width*0.04,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>PersonalProfileViewScreen()));
                              },
                              child: CircleAvatar(
                                radius: size.height*0.02,
                               backgroundImage: NetworkImage(    "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",)),
                            ),
                            SizedBox(width: size.height*0.01,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.13),
              height: size.height*0.9,
              width: size.width,
              decoration: BoxDecoration(
                color: btnclr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )
              ),
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context,index){
                          return Container(
                            child: CircleAvatar(
                              radius: 30,
                                backgroundImage: AssetImage(walimg)
                            ),
                            margin: EdgeInsets.only(left: size.width*0.02),
                          );
                        }
                    ),
                    margin: EdgeInsets.only(top: size.height*0.01,),
                    height: size.height*0.1,
                    width: size.width*0.9,
                  ),
                  Container(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                        scrollDirection: Axis.vertical,
                        itemCount: 10,
                        itemBuilder: (context,index){
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            height: size.height*0.43,
                            width: size.width*0.9,
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(left:size.width*0.02,top: size.height*0.02,right: size.width*0.02),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(walimg)
                                      ),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Company X',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily: "MBold"
                                          ),),
                                          SizedBox(height: size.height*0.003,),
                                          Text('Field',
                                            style: TextStyle(

                                                fontSize: size.height*0.015,
                                              fontFamily: "Stf"

                                            ),),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('1h ago',style: TextStyle(
                                                  fontSize: size.height*0.015,
                                                  color: infocolor,
                                                  fontFamily: "Msemibold"
                                              ),),
                                              SizedBox(height: size.height*0.02,),
                                              InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    isSelected=!isSelected;
                                                  });
                                                },
                                                child: Container(
                                                  height: size.height*0.03,
                                                  width: size.width*0.23,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    border: Border.all(color: signupclor_dark)
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.01),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(isSelected?'Added':'Add',style: TextStyle(
                                                          fontFamily:"Msemibold",
                                                          fontSize: size.height*0.015,
                                                          color: signupclor_dark
                                                        ),),
                                                        Icon(isSelected?Icons.check:Icons.add,size: size.height*0.02,color: signupclor_dark,)
                                                      ],
                                                    ),
                                                  ),
                                                
                                                ),
                                              )
                                            ],
                                          ),

                                        ],
                                      ),
                                      SizedBox(width: 5,)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15,),
                                ClipRRect(
                                  child: Image.network(
                                      "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",height: size.height*0.25,width: size.width*0.8,fit: BoxFit.cover,),
                                borderRadius:BorderRadius.circular(10),
                                ),
                                SizedBox(height: size.height*0.01,),
                               
                                Padding(
                                  padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.015),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            likeIndex=!likeIndex;
                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(like_icon,height: size.height*0.025,color: likeIndex?signupclor_dark: infocolor),
                                            SizedBox(width: size.width*0.02,),
                                            Text('Like',style: TextStyle(
                                                fontSize: size.height*0.015,
                                                fontFamily: "Msemibold",
                                              color: likeIndex?signupclor_dark: infocolor
                                            ),),

                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(comment_icon,height: size.height*0.025,color: infocolor,),
                                            SizedBox(width: size.width*0.02,),
                                            Text('Comment',style: TextStyle(
                                                fontSize: size.height*0.015,
                                                fontFamily: "Msemibold",
                                              color: infocolor
                                            ),),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(shareicon,height: size.height*0.025,color: infocolor,),
                                            SizedBox(width: size.width*0.02,),
                                            Text('Share',style: TextStyle(
                                                fontSize: size.height*0.015,
                                                fontFamily: "Msemibold",
                                              color: infocolor
                                            ),),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Divider(
                                //   thickness: 1,
                                //   indent: 15,
                                //   endIndent: 15,
                                // ),
                              ],
                            ),
                            margin: EdgeInsets.only(bottom: 10),
                          );
                        }
                    ),
                    margin: EdgeInsets.only(top: 5,),
                    height: size.height*0.67,
                    width: size.width*0.9,
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
  // void _settingModalBottomSheet(context) {
  //   var size = MediaQuery.of(context).size;

  //   showModalBottomSheet(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(10),
  //               topRight: Radius.circular(10)
  //           )
  //       ),
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return StatefulBuilder(
  //           builder: (context, setSte) {
  //             return Stack(
  //               alignment: AlignmentDirectional.bottomCenter,
  //               children: [
  //                 Container(
  //                   height: size.height*1.0,
  //                   width: size.width,
  //                   child: Wrap(
  //                     children: <Widget>[
  //                       Padding(
  //                         padding: EdgeInsets.only(left: size.width*0.04, right: size.width*0.04,top: size.height*0.02),
  //                         child: Column(
  //                           children: [
  //                           Container(
  //                             height: size.height*1.0,
  //                             width: size.width,
  //                             child: ListView.builder(
  //                               scrollDirection: Axis.vertical,
  //                                 itemCount: 10,
  //                                 itemBuilder: (context, index){
  //                               return   Column(
  //                                 children: [
  //                                   SizedBox(height: size.height*0.02,),
  //                                   Row(
  //                                     crossAxisAlignment: CrossAxisAlignment.start,
  //                                     children: [
  //                                       CircleAvatar(
  //                                         radius: 20,
  //                                         backgroundImage: NetworkImage("https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",),
  //                                       ),
  //                                       SizedBox(width: size.width*0.03,),
  //                                       Column(
  //                                         crossAxisAlignment: CrossAxisAlignment.start,
  //                                         children: [
  //                                           Text('Concard User',style: TextStyle(
  //                                               fontSize: size.height*0.015,
  //                                               fontFamily: "MBold"
  //                                           ),),
  //                                           SizedBox(height: size.height*0.01,),
  //                                           Text('CongratuLations bro!',style: TextStyle(
  //                                               fontFamily: "Stf",
  //                                               fontSize: size.height*0.015
  //                                           ),),
  //                                           SizedBox(height: size.height*0.01,),
  //                                           Row(
  //                                             children: [
  //                                               Text('3 m',style: TextStyle(
  //                                                 fontFamily: "Msemibold",
  //                                                 fontSize: size.height*0.015,
  //                                                 color: infocolor,
  //                                               ),),
  //                                               SizedBox(width: size.width*0.03,),
  //                                               InkWell(
  //                                                 onTap: (){
  //                                                   setState(() {
  //                                                     setSte((){
  //                                                       isLike=!isLike;
  //                                                     });
  //                                                   });
  //                                                 },
  //                                                 child: Text('Like',style: TextStyle(
  //                                                     fontFamily: "Msemibold",
  //                                                     fontSize: size.height*0.015,
  //                                                     color: isLike?signupclor_dark:infocolor
  //                                                 ),),
  //                                               ),
  //                                               SizedBox(width: size.width*0.03,),

  //                                               Text('Reply',style: TextStyle(
  //                                                   fontFamily: "Msemibold",
  //                                                   fontSize: size.height*0.015,
  //                                                   color: infocolor
  //                                               ),),
  //                                             ],)
  //                                         ],
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ],
  //                               );
  //                             }),
  //                           )
  //                           ],
  //                         ),
  //                       ),

  //                       SizedBox(
  //                         height: 50,
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Container(
  //                   height: size.height*0.05,
  //                   width: size.width*0.6,
  //                   child: TextFormField(
  //                     decoration: InputDecoration(
  //                       hintText: 'Write your Comment',
  //                       hintStyle: TextStyle(
  //                         fontSize: size.height*0.015,
  //                         color: infocolor
  //                       ),
  //                       focusedBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(30),
  //                         borderSide: BorderSide(color: infocolor)
  //                       ),
  //                       enabledBorder: OutlineInputBorder(
  //                         borderRadius: BorderRadius.circular(30),
  //                         borderSide: BorderSide(color: infocolor)
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             );
  //           },
  //         );
  //       });
  // }
}
