import 'package:concard/Views/screens/homeScreens/searchScreens/searchResultsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                padding: EdgeInsets.only(left:size.width*0.04,right: size.width*0.04,top: size.height*0.03),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap:(){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, size: 20, color: bckgrnd,)),
                    SizedBox(width: 20,),
                    Container(
                       height: size.height * 0.09,
                          width: size.width * 0.85,
                      child:TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          prefixIcon: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SearchResultsScreen()));
                              },

                              child:  SvgPicture.asset(srchIcon,),),
                          fillColor: Colors.white,
                          filled:true,
                          hintText: 'Search concard', contentPadding:
                        EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                          hintStyle: TextStyle(
                              fontSize: size.height*0.02, color: infocolor,
                          fontFamily: 'Stf'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.13),
              height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(timer_icon,height: 15,),
                        SizedBox(width: 10,),
                        Text(
                          'Recent searches',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                            fontFamily: 'MBold'
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              'See all',
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  fontFamily: "Stf",
                                  color: gradientgreen),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Row(
                      children: [
                        Text(
                          'Company user 1',
                          style: TextStyle(
                              fontSize: size.height * 0.015,
                              fontFamily: 'Stf'
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(timer_icon,height: 15,color: infocolor,),
                      ],
                    ),
                    SizedBox(height: size.height*0.015,),
                    Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                      color: infocolor.withOpacity(0.3),
                    ),
                    SizedBox(height: size.height*0.015,),
                    Row(
                      children: [
                        Text(
                          'Profile User 1',
                          style: TextStyle(
                              fontSize: size.height * 0.015,
                              fontFamily: 'Stf'
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(timer_icon,height: 15,color: infocolor,),
                      ],
                    ),
                    SizedBox(height: size.height*0.015,),
                    Divider(
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                      color: infocolor.withOpacity(0.3),
                    ),
                    SizedBox(height: size.height*0.015,),
                    Row(
                      children: [
                        Text(
                          'Card User 1',
                          style: TextStyle(
                              fontSize: size.height * 0.015,
                              fontFamily: 'Stf'
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(timer_icon,height: 15,color: infocolor,),
                      ],
                    ),
                    SizedBox(height: size.height*0.04,),
                    Container(
                      child: Row(
                        children: [
                          Image.asset(trndg_icon,height: 15,),
                          SizedBox(width: size.width*0.02,),
                          Text(
                            'Trending Compnies',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: 'Msemibold'
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                      margin: EdgeInsets.only(left: size.width*0.02,right: size.width*0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [

                              CircleAvatar(
                                radius: 20,
                                child: ClipRRect(
                                  child: Image.asset(
                                    office,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                backgroundColor: infocolor.withOpacity(0.3),
                              ),
                              Text(
                                'Company',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold'),
                              ),
                              Text(
                                'Lorem ispum',
                                style: TextStyle(
                                    fontSize: size.height * 0.012,
                                    fontFamily: "Msemibold",
                                    color: infocolor),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              CircleAvatar(
                                radius: 20,
                                child: ClipRRect(
                                  child: Image.asset(
                                    office,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                backgroundColor: infocolor.withOpacity(0.3),
                              ),
                              Text(
                                'Company',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold'),
                              ),
                              Text(
                                'Lorem ispum',
                                style: TextStyle(
                                    fontSize: size.height * 0.012,
                                    fontFamily: "Msemibold",
                                    color: infocolor),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              CircleAvatar(
                                radius: 20,
                                child: ClipRRect(
                                  child: Image.asset(
                                    office,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                backgroundColor: infocolor.withOpacity(0.3),
                              ),
                              Text(
                                'Company',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold'),
                              ),
                              Text(
                                'Lorem ispum',
                                style: TextStyle(
                                    fontSize: size.height * 0.012,
                                    fontFamily: "Msemibold",
                                    color: infocolor),
                              ),
                            ],
                          ),
                          Column(
                            children: [

                              CircleAvatar(
                                radius: 20,
                                child: ClipRRect(
                                  child: Image.asset(
                                    office,
                                    height: 20,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                backgroundColor: infocolor.withOpacity(0.3),
                              ),
                              Text(
                                'Company',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold'),
                              ),
                              Text(
                                'Lorem ispum',
                                style: TextStyle(
                                    fontSize: size.height * 0.012,
                                    fontFamily: "Msemibold",
                                    color: infocolor),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      child: Text(
                        'Trending Keywords',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: 'MBold'
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: Text('Buisness',
                              style: TextStyle(
                                fontFamily: "Stf",
                                fontSize: size.height*0.015
                              ),)),
                              height: size.height*0.03,
                              width: size.width*0.2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: Text('Growth',
                                style: TextStyle(
                                    fontFamily: "Stf",
                                    fontSize: size.height*0.015
                                ),
                              )),
                              height: size.height*0.03,
                              width: size.width*0.2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: Text('Progress',
                                style: TextStyle(
                                    fontFamily: "Stf",
                                    fontSize: size.height*0.015
                                ),)),
                              height: size.height*0.03,
                              width: size.width*0.2,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: Text('Now',
                                style: TextStyle(
                                    fontFamily: "Stf",
                                    fontSize: size.height*0.015
                                ),)),
                              height: size.height*0.03,
                              width: size.width*0.15,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                        SizedBox(height: size.height*0.015,),
                        Row(

                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: Text('Progress',
                                style: TextStyle(
                                    fontFamily: "Stf",
                                    fontSize: size.height*0.015
                                ),)),
                              height: size.height*0.03,
                              width: size.width*0.2,
                            ),
                            SizedBox(width: size.width*0.06,),
                            Container(
                              decoration: BoxDecoration(
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: Text('Now',
                                style: TextStyle(
                                    fontFamily: "Stf",
                                    fontSize: size.height*0.015
                                ),)),
                              height: size.height*0.03,
                              width: size.width*0.15,
                            ),
                          ],
                        )
                      ],
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
