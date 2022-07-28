import 'package:concard/Views/screens/homeScreens/TeamsScreens/teamsJoinInvite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import 'createNewTeamScreen.dart';

class TeamsFilterScreen extends StatelessWidget {
  const TeamsFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return  Scaffold(
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
              child:  Padding(
                padding: EdgeInsets.only(left: size.width*0.04, right: size.width*0.04,top: size.height*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: bckgrnd,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(group,color: bckgrnd,),
                        SizedBox(
                          width: size.width*0.02,
                        ),
                        Text(
                          'Teams',
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.bold,
                              color: bckgrnd),
                        ),
                      ],
                    ),
                    Container(
                      height: size.height*0.01,
                      width: size.width*0.03,
                    )
                    // Image.asset(notify_icon),
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
                padding: EdgeInsets.only(left:size.width*0.04, right: size.width*0.04),
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('All teams',style: TextStyle(
                            fontSize: size.height*0.018,
                            fontFamily: 'MBold',
                            color: signupclor_dark
                        ),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CreateNewTeamScreen()));
                          },
                          child: Container(
                            height: size.height*0.04,
                            width: size.width*0.45,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      gradientgreen,
                                      primarygreen,
                                    ]
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left:5,right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.add,size: 20,color: bckgrnd,),
                                  Text('Create new Team',style: TextStyle(
                                      fontFamily: 'MBold',
                                      fontSize: size.height*0.018,
                                      color: bckgrnd
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.055,
                          width: size.width*0.8,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search,color: signupclor_dark,),
                                filled: true,
                                fillColor: bckgrnd,
                                hintText: 'Search Teams',
                                contentPadding:
                                EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                hintStyle:
                                TextStyle(fontSize: size.width * 0.04, color: infocolor),
                                enabledBorder:
                                OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: bckgrnd)
                                ),
                              focusedBorder:
                              OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: bckgrnd)
                              ),
                            ),
                          ),
                        ),
                        SvgPicture.asset(sort_icon)
                      ],
                    ),
                    SizedBox(
                      height:size.height*0.03
                    ),
                    Container(
                      height: size.height*1.0,
                      width: size.width,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TeamsJoinInviteScreen()));
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: 5,
                            scrollDirection: Axis.vertical,
                            itemBuilder:(context, index){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundImage: NetworkImage(    "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",)),
                                      SizedBox(width: size.width*0.03,),
                                      Column(
                                        children: [
                                          Text('Team 1',style: TextStyle(
                                              fontSize: size.height*0.018,
                                              fontFamily: 'Mbold'
                                          ),),
                                          SizedBox(height:size.height*0.01,),
                                          Text('12 cards shared',style: TextStyle(
                                              fontSize: size.height*0.015,
                                              color: infocolor,
                                              fontFamily: 'Stf'
                                          ),),

                                        ],
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                      ),
                                      Spacer(),
                                     Icon(Icons.arrow_forward_ios_sharp,size: 15,)

                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                  Divider(
                                    thickness: 1,
                                    indent: 10,
                                    endIndent: 10,
                                  )
                                ],
                              );
                            }

                        ),
                      ),
                    ),
                    // SizedBox(height: 40,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
