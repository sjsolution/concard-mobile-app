import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/analyticsScreen.dart';
import 'package:concard/Views/screens/homeScreens/companyPremiumPlan/upgradeCompanyPlanScreen.dart';
import 'package:concard/Views/screens/homeScreens/importCardsScreen.dart';
import 'package:concard/Views/screens/homeScreens/manageCompanyCards.dart';
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:concard/Views/screens/homeScreens/ratingReviewScreen.dart';
import 'package:concard/Views/screens/homeScreens/socialLinksScreen.dart';
import 'package:concard/Views/screens/homeScreens/upgradeCompanyPremium/upgradeCompanyPremium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Constants/colors.dart';
import 'editMyCardScreen.dart';

class CompanyProfileScreen extends StatelessWidget {
  const CompanyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height*0.35,
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
              child:Container(
                width: size.width,
                child:     SvgPicture.asset(prfilemask_icon,fit: BoxFit.cover,),
              )
                ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.28),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Concard',
                            style: TextStyle(
                              fontSize: size.height*0.018,
                              fontFamily: "Mbold"
                            ),),
                            Text('Company detail',
                            style: TextStyle(
                              fontSize: size.height*0.015,
                              fontFamily: "Stf",
                              color: infocolor
                            ),),
                          ],
                        ),
                        SvgPicture.asset(stylearrw_icon)
                      ],
                    ),
                    SizedBox(height: size.height*0.03,),
                    GestureDetector(
                      onTap: (){
                        _settingModalBottomSheet(context);
                      },
                      child: Container(
                        height: size.height*0.05,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              gradientgreen,
                              primarygreen
                            ]
                          )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width*0.02,right: size.width*0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.add,color: bckgrnd,size: 25,),
                              Text('Start a Post',
                              style:TextStyle(
                                fontSize: size.height*0.02,
                                fontFamily: "Msemibold",
                                color: bckgrnd
                              )),
                              Container(
                                width: size.width*0.03,
                                height: size.height*0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                      height: size.height*0.3,
                      width: size.width,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            SizedBox(height: size.height*0.015,),
                            Padding(
                              padding: EdgeInsets.only(left:size.width*0.04,right: size.width*0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(' Company Card',style: TextStyle(
                                      fontSize: size.height*0.018,
                                      fontFamily: 'MBold'
                                  ),),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>EditMyCardScreen()));
                                    },
                                    child: Row(
                                      children: [
                                        Text('Edit Card',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily: 'Stf'
                                        ),),
                                        SizedBox(width: size.width*0.03,),
                                        Image.asset(edit_icon,color: cgreen,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height*0.015,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                                child: Image.asset(mycard_icon,height: size.height*0.2,width: size.width*0.8,fit: BoxFit.cover,)),
                            SizedBox(height: size.height*0.025,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.02,),
                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.02,right: size.width*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              _comprofileModalBottomSheet(context);
                            },
                            child: Container(
                              height: size.height*0.05,
                              width: size.width*0.4,
                              decoration:BoxDecoration(
                                  border: Border.all(color: signupclor_dark),
                                  color: btnclr,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Container(
                                child: Center(
                                  child: Text('Profile file',style: TextStyle(
                                      color: signupclor_dark,
                                      fontSize: size.height*0.015,
                                      fontFamily: "Msemibold"
                                  ),),
                                ),
                              ),
                            ),
                          ),
                            InkWell(
                              onTap: (){
                                _brochfileModalBottomSheet(context);
                              },
                              child: Container(
                              height: size.height*0.05,
                              width: size.width*0.4,
                              decoration:BoxDecoration(
                                  border: Border.all(color: signupclor_dark),
                                  color: btnclr,
                                  borderRadius: BorderRadius.circular(30)
                              ),
                              child: Container(
                                margin: EdgeInsets.only(left: size.width*0.04,right: size.width*0.02),
                                child: Center(
                                  child: Text('Brochure file',style: TextStyle(
                                      color: signupclor_dark,
                                      fontSize: size.height*0.015,
                                      fontFamily: "Msemibold"
                                  ),),
                                ),
                              ),
                                                      ),
                            ),
                         
                        ],
                      ),
                    ),
                    SizedBox(height: size.height*0.04,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>RatingReviewScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Rating & Reviews',style: TextStyle(
                                  fontSize: size.height*0.018,
                                  color: Colors.black,
                                  fontFamily: 'Msemibold'
                              ),),
                              Icon(Icons.arrow_drop_down,size: 25,),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                child: RatingBar.builder(
                                  itemSize: size.height*0.02,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: primarygreen,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              SizedBox(width: size.width*0.01,),
                              Text('4.5',style: TextStyle(
                                  fontSize: size.height*0.018,
                                  color: Colors.black,
                                  fontFamily: 'Msemibold'
                              ),)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    GestureDetector(

                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>AnalyticsScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Dashboard',style: TextStyle(
                              fontSize: size.height*0.018,
                              color: Colors.black,
                              fontFamily: 'Msemibold'
                          ),),
                          Container(
                            height: size.height*0.04,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                                border: Border.all(color: gradientgreen),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child:    Center(
                              child: Text('View',style: TextStyle(
                                  fontFamily: 'MBold',
                                  fontSize: size.height*0.015,
                                  color: gradientgreen
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height*0.015,),
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
                    SizedBox(height: size.height*0.02,),
                    Row(
                      children: [
                        Text("product & Services",style: TextStyle(
                            fontSize: size.height*0.018,
                            color: Colors.black,
                            fontFamily: 'Msemibold'
                        ),),
                        SizedBox(width: size.width*0.01,),
                        Text("(12)",style: TextStyle(
                          fontSize: size.height*0.018,
                          color: primarygreen,
                          fontFamily: 'Mbold',
                        ),),
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Container(
                      height: size.height * 0.165,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: bckgrnd,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.13,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: bckgrnd,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.only(left: size.width*0.02,right: size.width*0.02,top: size.height*0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: btnclr,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(child: Text('Buisness',style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height*0.015
                                          ),)),
                                          height: size.height*0.04,
                                          width: size.width*0.2,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: btnclr,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(child: Text('Growth',
                                            style: TextStyle(
                                                fontFamily: "Msemibold",
                                                fontSize: size.height*0.015
                                            ),)),
                                          height: size.height*0.04,
                                          width: size.width*0.2,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: btnclr,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(child: Text('Progress',
                                            style: TextStyle(
                                                fontFamily: "Msemibold",
                                                fontSize: size.height*0.015
                                            ),)),
                                          height: size.height*0.04,
                                          width: size.width*0.2,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: btnclr,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(child: Text('Now',
                                            style: TextStyle(
                                                fontFamily: "Msemibold",
                                                fontSize: size.height*0.015
                                            ),)),
                                          height: size.height*0.04,
                                          width: size.width*0.15,
                                        ),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    ),
                                    SizedBox(height: size.height*0.01,),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: btnclr,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(child: Text('Progress',style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height*0.015
                                          ),)),
                                          height: size.height*0.04,
                                          width: size.width*0.2,
                                        ),
                                        SizedBox(width: size.width*0.02,),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: btnclr,
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: Center(child: Text('Now',style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height*0.015
                                          ),)),
                                          height: size.height*0.04,
                                          width: size.width*0.15,
                                        ),
                                        SizedBox(
                                          width: size.width*0.02,
                                        ),
                                        Container(
                                          height: size.height*0.03,
                                          width: size.width*0.15,
                                          decoration: BoxDecoration(
                                              border: Border.all(color: gradientgreen),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child:    Center(
                                            child: Text('Add +',style: TextStyle(
                                                fontFamily: 'MBold',
                                                fontSize: size.height*0.015,
                                                color: txtcolr
                                            ),),
                                          ),
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
                    SizedBox(height: size.height*0.035,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("About",style: TextStyle(
                            fontSize: size.height*0.018,
                            color: Colors.black,
                            fontFamily: 'Msemibold'
                        ),),
                        Container(
                          height: size.height*0.035,
                          width: size.width*0.2,
                          decoration: BoxDecoration(
                              border:Border.all(color: gradientgreen),
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child:    Center(
                            child: Text('Edit',style: TextStyle(
                                fontFamily: 'MBold',
                                fontSize: size.height*0.018,
                                color: txtcolr
                            ),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.015,),
                    Container(
                      height: size.height * 0.13,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: bckgrnd,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:Padding(
                        padding: EdgeInsets.only(left: size.width*0.04,top:size.height*0.02 ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Contrary to popular belief, Lorem Ipsum is not\nsimply random text. It has roots in a piece of\nclassical Latin literature from 45 BC, making it over\n2000 years old.',
                              style: TextStyle(
                                  fontSize: size.height*0.015,
                                  fontFamily: "Stf"
                              ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.04,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>SocialLinksScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Social media",style: TextStyle(
                              fontSize: size.height*0.018,
                              color: Colors.black,
                              fontFamily: 'Msemibold'
                          ),),
                          Container(
                            height: size.height*0.035,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: gradientgreen
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child:    Center(
                              child: Text('Add +',style: TextStyle(
                                  fontFamily: 'MBold',
                                  fontSize: size.height*0.018,
                                  color: txtcolr
                              ),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height*0.025,),
                    Row(
                      children: [
                        SizedBox(width: size.width*0.001,),
                        GestureDetector(child:
                        Image.asset(circllinkedin_icon),
                        ),
                        SizedBox(width: size.width*0.03,),
                        Image.asset(twitterone_icon),
                        SizedBox(width: size.width*0.03,),
                        Image.asset(circlefb_icon),
                        SizedBox(width: size.width*0.03,),
                        Image.asset(instaicon_icon),

                      ],
                    ),
                    SizedBox(height: size.height*0.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(

                          children: [
                            Text("Conmpany/ Team members",style: TextStyle(
                              fontSize: size.height*0.018,
                              color: Colors.black,
                              fontFamily: 'Msemibold',
                            ),),
                            SizedBox(width: size.width*0.02,),
                            Image.asset(hideeye_icon,height: size.height*0.04,)
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>ManageCompanyCardsScreen()));
                          },                          child: Container(
                            height: size.height*0.035,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                                border: Border.all(color: gradientgreen),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child:    Center(
                              child: Text('Manage',style: TextStyle(
                                  fontFamily: 'MBold',
                                  fontSize: size.height*0.018,
                                  color: txtcolr
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.04,),
                    Container(
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                          itemExtent: 75,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(    "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",),
                                ),
                                Text('Tomy jones',style: TextStyle(
                                    fontSize: size.height*0.017,
                                    fontFamily: 'Msemibold'
                                ),),
                                Text('Lorem ipsum',style: TextStyle(
                                    fontSize: size.height*0.012,
                                    fontFamily: 'Stf'
                                ),),
                              ],
                            );
                          }
                      ),
                      margin: EdgeInsets.only(top: 15,),
                      height: size.height*0.15,
                      width: size.width*0.9,
                    ),
                    SizedBox(height: 100,)
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height*0.15,left: size.width*0.04),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: bckgrnd,
                    child: SvgPicture.asset(con_icon),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: size.height*0.21,left: size.width*0.18),
                    child: Image.asset(compcamera_icon)),
              ],
            ),
            Container(
              margin:EdgeInsets.only(top:size.height*0.08,left:size.width*0.04),
              child: Image.asset(
                more_icon
                          ),
            ),
            Container( 
              margin:EdgeInsets.only(top: size.height*0.08),
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>NotificationsScreen()));
                      },
                      child: Padding(
                        padding:  EdgeInsets.only(right: size.width*0.04),
                        child: Image.asset(notify_icon),
                      )),
                  SizedBox(height: size.height*0.03,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>UpgradeToPremiumCompanyScreen()));
                    },
                    child: Container(
                          height: size.height * 0.04,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              color: bckgrnd.withOpacity(0.1),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: size.width * 0.04,
                              right: size.width * 0.01,
                            ),
                            child: Row(children: [
                              Image.asset(
                                premium_icon,
                                height: size.height * 0.04,
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                'Premium',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "MBold",
                                    color: bckgrnd),
                              ),
                            ]),
                          ),
                        ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Container(
                    height: size.height*0.04,
                    width: size.width*0.32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(10),
                        bottomLeft:Radius.circular(10)
                      ),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width*0.02,right: size.width*0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(camera_icon,height: size.height*0.015,),
                          Text('Select a cover photo',style: TextStyle(
                            fontFamily: "MBold",
                            fontSize: size.height*0.011,
                            color: Colors.white
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
                height: size.height *0.45,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.04, right: size.width*0.04,top: size.height*0.02),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width*0.03,
                                color: Colors.black,
                              ),
                              Text(
                                'Start a Post',
                                style: TextStyle(
                                    fontSize: size.height * 0.02,
                                    fontFamily: 'Mbold'
                                ),
                              ),
                              GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close)),
                            ],
                          ),
                          SizedBox(
                            height: size.height*0.02,
                          ),
                          Container(
                            height: size.height*0.15,
                            width: size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: bckgrnd),
                              color: bckgrnd
                            ),
                          ),
                          SizedBox(height: size.height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.asset(uploadimage_icon),
                                  SizedBox(height: size.height*0.02,),
                                  Text('Photo',style: TextStyle(
                                    fontSize: size.height*0.02,
                                    fontFamily: "Stf"
                                  ),)
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(uploadvideo_icon),
                                  SizedBox(height: size.height*0.02,),
                                  Text('Video',style: TextStyle(
                                    fontSize: size.height*0.02,
                                    fontFamily: "Stf"
                                  ),)
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(uploadaudio_icon),
                                  SizedBox(height: size.height*0.02,),
                                  Text('poll',style: TextStyle(
                                    fontSize: size.height*0.02,
                                    fontFamily: "Stf"
                                  ),)
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(writepost_icon),
                                  SizedBox(height: size.height*0.02,),
                                  Text('Article',style: TextStyle(
                                    fontSize: size.height*0.02,
                                    fontFamily: "Stf"
                                  ),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height*0.04,),
                          Container(
                            alignment: Alignment.center,
                            height: size.height*0.05,
                            width: size.width*0.9,
                            decoration:BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      signupclor_light,
                                      signupclor_dark
                                    ]
                                ),
                                border: Border.all(color: Colors.grey),
                                color: bckgrnd,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Container(
                              // margin: EdgeInsets.only(left: size.width*0.04),
                              alignment: Alignment.center,
                              child: Text('Post',style: TextStyle(
                                  color: bckgrnd,
                                  fontSize: size.height*0.025,
                                  fontFamily: "Msemibold"
                              ),),
                            ),
                          ),
                        ],
                      ),
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

  void _comprofileModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: size.height * 0.28,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Company Profile',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,
                                      size: size.height * 0.025)),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compupload),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Upload New Profile',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Stf"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compdelete),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Delete Current Profile',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Stf"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  void _brochfileModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: size.height * 0.28,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Brochure',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,
                                      size: size.height * 0.025)),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compupload),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Upload New Brochure',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Stf"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compdelete),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Delete  Brochure',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Stf"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

}
