import 'package:concard/Views/screens/homeScreens/TeamsScreens/createTeamScreen.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/teamsFilterScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:switcher_button/switcher_button.dart';

import '../../../../Constants/colors.dart';

class CreateNewTeamScreen extends StatefulWidget {
   CreateNewTeamScreen({Key? key}) : super(key: key); 

  @override
  State<CreateNewTeamScreen> createState() => _CreateNewTeamScreenState();
}

class _CreateNewTeamScreenState extends State<CreateNewTeamScreen> {
bool? switchInvite=false;
bool? switchAdd=false;
bool? switchDelete=false;
bool? switchRemove=false;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Stack(
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
              padding: EdgeInsets.only(left: size.width*0.04, right:size.width*0.04,top: size.height*0.04),
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
                  // SizedBox(
                  //   width: 110,
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  Text(
                    'Create new team',
                    style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "MBold",
                        color: bckgrnd),
                  ),
                  // SizedBox(
                  //   width: 110,
                  // ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>TeamsFilterScreen()));
                    },
                    child: Icon(Icons.check,size: size.height*0.03,color: bckgrnd,))
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
              padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*0.02,),
                  Text('Add new team',style: TextStyle(
                      fontSize: size.height*0.018,
                      fontFamily: 'MBold',
                  ),),
                  SizedBox(height: size.height*0.03,),
                  Container(
                    height: size.height * 0.055,
                    width: size.width*0.9,
                    child: TextFormField(
                      decoration: InputDecoration(

                          filled: true,
                          fillColor: Colors.white,
                          focusColor: bckgrnd,
                          hintText: 'Team name',
                          contentPadding:
                          EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                          hintStyle:
                          TextStyle(fontSize: size.width * 0.04, color: infocolor),
                          enabledBorder:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: bckgrnd)
                          ),
                        focusedBorder:
                        OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: bckgrnd)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),
                  Divider(thickness: 1,),
                  SizedBox(height: size.height*0.02,),
                  Text('Team permission',style: TextStyle(
                    fontSize: size.height*0.018,
                    fontFamily: 'MBold',
                  ),),
                  SizedBox(height: size.height*0.025,),
                  Row(
                    children: [
                      Text('Invite members',style: TextStyle(
                        fontFamily: 'Msemibold',
                        fontSize: size.height*0.015,
                      ),),
                      Spacer(),
                      Transform.scale(
                        scale: size.height*0.001,
                        child: CupertinoSwitch(
                          
                          activeColor: gradientgreen,
                          value: switchInvite!, onChanged: (value){
                      
                          setState(() {
                            switchInvite=value;
                          });
                        }),
                      )

                    ],
                  ),
                  SizedBox(height: size.height*0.02,),
                  Row(
                    children: [
                      Text('Add Cards',style: TextStyle(
                        fontFamily: 'Msemibold',
                        fontSize: size.height*0.015,
                      ),),
                      Spacer(),
                      Transform.scale(
                        scale: size.height*0.001,
                        child: CupertinoSwitch(
                          
                          activeColor: gradientgreen,
                          value: switchAdd!, onChanged: (value){
                      
                          setState(() {
                            switchAdd=value;
                          });
                        }),
                      )

                    ],
                  ),
                  SizedBox(height: size.height*0.02,),
                  Row(
                    children: [
                      Text('Delete Shared Cards',style: TextStyle(
                        fontFamily: 'Msemibold',
                        fontSize: size.height*0.015,
                      ),),
                      Spacer(),
                      Transform.scale(
                        scale: size.height*0.001,
                        child: CupertinoSwitch(
                          
                          activeColor: gradientgreen,
                          value: switchDelete!, onChanged: (value){
                      
                          setState(() {
                            switchDelete=value;
                          });
                        }),
                      )
                    ],
                  ),
                  SizedBox(height: size.height*0.02,),
                   Row(
                    children: [
                      Text('Remove members',style: TextStyle(
                        fontFamily: 'Msemibold',
                        fontSize: size.height*0.015,
                      ),),
                      Spacer(),
                      Transform.scale(
                        scale: size.height*0.001,
                        child: CupertinoSwitch(
                          
                          activeColor: gradientgreen,
                          value: switchRemove!, onChanged: (value){
                      
                          setState(() {
                            switchRemove=value;
                          });
                        }),
                      )


                    ],
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
