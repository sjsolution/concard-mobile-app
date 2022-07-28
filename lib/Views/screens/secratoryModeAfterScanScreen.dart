import 'package:concard/Constants/colors.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecretaryAfterScaaningScreen extends StatefulWidget {
  SecretaryAfterScaaningScreen({Key? key}) : super(key: key);

  @override
  State<SecretaryAfterScaaningScreen> createState() => _SecretaryAfterScaaningScreenState();
}

class _SecretaryAfterScaaningScreenState extends State<SecretaryAfterScaaningScreen> {
bool? switchValue=false;
bool? switchDelete=false;
bool? switchGroup=false;
bool? switchCreat=false;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
              padding:  EdgeInsets.only(left: size.width*0.04,right:size.width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,size: size.height*0.02,color: bckgrnd,)),
                  Container(
                    margin: EdgeInsets.only(top: size.height*0.01),
                    child: Text('Secretary Mode',style: TextStyle(
                      fontFamily: "MBold",
                      fontSize:size.height*0.018,
                      color:bckgrnd
                    ),),
                  ),
                   Container(
                        height: size.height*0.03,
                        width: size.width*0.08,
                      ),
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
                padding:  EdgeInsets.only(left: size.width*0.04,right:size.width*0.04,top:size.height*0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: size.height*0.04,
                        backgroundImage: NetworkImage('https://cdn.statusqueen.com/dpimages/thumbnail/Alone_boy_dp_-2762.jpg'),
                      ),
                    ),
                    SizedBox(height: size.height*0.015,),
                    Center(
                      child: Text('Jhon Smith',
                      style: TextStyle(
                        fontFamily: "MBold",
                        fontSize: size.height*0.018,
                        color: signupclor_dark
                      ),),
                    ),
                      Center(
                        child: Text('Lorem ipsum',
                    style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.015,
                        color: signupclor_dark
                    ),),
                      ),
                    SizedBox(height:size.height*0.02,),
                    Divider(
                      thickness: 1,
                    ),
                      SizedBox(height:size.height*0.02,),
                    Text('Account permissions',
                    style: TextStyle(
                      fontFamily: "MBold",
                      fontSize: size.height*0.018,
                    ),),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text('Add Cards',
                    style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.015,
                    ),),
                    Transform.scale(
                              // transformHitTests: false,
                              scale: 0.6,
                              child: CupertinoSwitch(value: switchValue!, 
                              onChanged: (
                                
                                value          
                                            ){
                                              setState(() {
                                                switchValue=value;
                                              });
                                            },
                                            activeColor:gradientgreen,
                                            
                                            ),
                            )
                      ],
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text('Delete Cards',
                    style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.015,
                    ),),
                    Transform.scale(
                              // transformHitTests: false,
                              scale: 0.6,
                              child: CupertinoSwitch(value: switchDelete!, 
                              onChanged: (
                                
                                value          
                                            ){
                                              setState(() {
                                                switchDelete=value;
                                              });
                                            },
                                            activeColor:gradientgreen,
                                            
                                            ),
                            )
                      ],
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text('Group Cards',
                    style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.015,
                    ),),
                    Transform.scale(
                              // transformHitTests: false,
                              scale: 0.6,
                              child: CupertinoSwitch(value: switchGroup!, 
                              onChanged: (
                                
                                value          
                                            ){
                                              setState(() {
                                                switchGroup=value;
                                              });
                                            },
                                            activeColor:gradientgreen,
                                            
                                            ),
                            )
                      ],
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text('Create / Delete Groups Cards',
                    style: TextStyle(
                        fontFamily: "Stf",
                        fontSize: size.height*0.015,
                    ),),
                    Transform.scale(
                              // transformHitTests: false,
                              scale: 0.6,
                              child: CupertinoSwitch(value: switchCreat!, 
                              onChanged: (
                                
                                value          
                                            ){
                                              setState(() {
                                                switchCreat=value;
                                              });
                                            },
                                            activeColor:gradientgreen,
                                            
                                            ),
                            )
                      ],
                    ),
                    
                    SizedBox(
                      height: size.height*0.25,
                    ),
                    Divider(
                      thickness: 1,
                    ),
                       SizedBox(
                      height: size.height*0.02,
                    ),
                    Center(
                      child: CustomNextButton(text: 'Remove secretary', image: '', color1: signupclor_light, color2: signupclor_dark, onTap: (){
                        Navigator.pop(context);
                      }),
                    )
                  ],
                ),
              ),     
        )
      ],
    ),
    );
  }
}