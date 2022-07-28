import 'package:concard/Views/widgets/fieldText.dart';
import 'package:concard/Views/widgets/socialLinksField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import 'notifications/notificationsScreen.dart';


class SocialLinksScreen extends StatelessWidget {
   SocialLinksScreen({Key? key}) : super(key: key);
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var controller=TextEditingController();
    var size=MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height*0.25,
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
                padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.06),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(more_icon,height: 15,),

                        Container(
                          margin: EdgeInsets.only(left: size.width*0.08),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(drwrmyacunt_icon),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text('John Smith',style: TextStyle(
                                          fontFamily: 'MBold',
                                          fontSize: size.height*0.02,
                                          color: bckgrnd
                                      ),),
                                      Text('Lorem ipsum',style: TextStyle(
                                          fontFamily: 'Stf',
                                          fontSize: size.height*0.017,
                                          color: bckgrnd
                                      ),),
                                    ],
                                  ),
                                  SizedBox(width: size.width*0.01,),
                                  Image.asset(safesheld_icon),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>NotificationsScreen()));
                                },
                                child: Image.asset(notify_icon,)),
                            SizedBox(width: size.width*0.02,),
                            GestureDetector(

                                onTap: (){
                                  _settingModalBottomSheet(context);
                                },
                                child: Icon(Icons.more_vert,color: bckgrnd,)),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.23),
              // height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('Social Links',
                      style: TextStyle(
                        fontSize: size.height*0.025,
                        fontFamily: "Msemibold"
                      ),),
                    ),
                    SizedBox(height: size.height*0.03,),
                    SocialLinksField(hinttext: 'Enter URL', controller: controller, textInputType: TextInputType.text, image: circllinkedin_icon,),
                    SizedBox(height: size.height*0.015,),
                    SocialLinksField(hinttext: 'Enter URL', controller: controller, textInputType: TextInputType.text, image: twitterone_icon,),
                    SizedBox(height: size.height*0.015,),
                    SocialLinksField(hinttext: 'Enter URL', controller: controller, textInputType: TextInputType.text, image: circlefb_icon),
                    SizedBox(height: size.height*0.015,),
                    SocialLinksField(hinttext: 'Enter URL', controller: controller, textInputType: TextInputType.text, image: instaicon_icon,),
                    SizedBox(height: size.height*0.015,),
                    SocialLinksField(hinttext: 'Enter URL', controller: controller, textInputType: TextInputType.text, image: behance_icon,),
                    SizedBox(height: size.height*0.015,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * 0.055,
                      width: size.width*0.78,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter URL',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.height*0.02, color: infocolor,
                                fontFamily: "Msemibold"),
                            suffixIcon: Icon(Icons.lock,size: 20,color: infocolor,),
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: bckgrnd,
                        border: Border.all(color: signupclor_dark,
                            width:2,style: BorderStyle.solid),

                      ),
                      child: CircleAvatar(
                        radius: size.height*0.023,
                        backgroundColor: btnclr,
                        child: Image.asset(link_icon,height: size.height*0.025,color: signupclor_dark,),
                      ),
                    )
                  ],
                ),
                    SizedBox(height: size.height*0.013,),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(height: size.height*0.013,),
                    Container(
                      height: size.height * 0.055,
                      width: size.width*0.78,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Title',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.height*0.02, color: infocolor,
                                fontFamily: "Msemibold"),
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                      ),
                    ),
                    SizedBox(height: size.height*0.015,),
                    Container(
                      height: size.height * 0.055,
                      width: size.width*0.78,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter URL',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.height*0.02, color: infocolor,
                                fontFamily: "Msemibold"),
                            suffixIcon: Icon(Icons.lock,size: 20,color: infocolor,),
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                      ),
                    ),
                    SizedBox(height: size.height*0.025,),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height*0.05,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey
                            ),
                            child: Center(
                              child: Text('Add more',
                              style: TextStyle(
                                fontSize: size.height*0.025,
                                fontFamily: "Msemibold",
                                color: Colors.white
                              ),),
                            ),
                          ),
                          Container(
                            height: size.height*0.05,
                            width: size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primarygreen
                            ),
                            child: Center(
                              child: Text('Save',
                              style: TextStyle(
                                fontSize: size.height*0.025,
                                fontFamily: "Msemibold",
                                color: Colors.white
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
            )
          ],
        ),
      ) ,
    );
  }
   void _settingModalBottomSheet(context) {
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
                 height: size.height * 4,
                 width: size.width,
                 child: Wrap(
                   children: <Widget>[
                     Padding(
                       padding: EdgeInsets.only(left: 10, right: 10,top: 20),
                       child: Row(
                         children: [
                           Text(
                             'More options',
                             style: TextStyle(
                                 fontSize: size.height * 0.02,
                                 fontFamily: 'Mbold'
                             ),
                           ),
                           Spacer(),
                           GestureDetector(
                               onTap: (){
                                 Navigator.pop(context);
                               },
                               child: Icon(Icons.close)),
                         ],
                       ),
                     ),
                     new ListTile(
                         leading:Image.asset(group,color: signupclor_dark,),
                         title: new Text('Groups',style: TextStyle(
                             fontFamily: 'Msemibold',
                             fontSize: size.height*0.015
                         ),),
                         onTap: () => {}),
                     new ListTile(
                       leading:SvgPicture.asset(emailtwo_icon),
                       title: new Text('Turn off notification',style: TextStyle(
                           fontFamily: 'Msemibold',
                           fontSize: size.height*0.015
                       ),),
                       onTap: () => {},
                     ),
                     new ListTile(
                       leading:SvgPicture.asset(newcntct_icon),
                       title:  new Text('Add to Contacts',
                         style: TextStyle(
                             fontFamily: 'Msemibold',
                             fontSize: size.height*0.015
                         ),),
                       onTap: () => {},
                     ),
                     new ListTile(
                       leading:SvgPicture.asset(notfications_icon),
                       title:  new Text('Reminder',
                         style: TextStyle(
                             fontFamily: 'Msemibold',
                             fontSize: size.height*0.015
                         ),),
                       onTap: () => {},
                     ),
                     new ListTile(
                       leading:SvgPicture.asset(favourite_icon),
                       title:  new Text('Add to Favorite',
                         style: TextStyle(
                             fontFamily: 'Msemibold',
                             fontSize: size.height*0.015
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
