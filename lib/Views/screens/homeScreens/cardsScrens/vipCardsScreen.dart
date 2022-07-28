import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import '../addContactCardsScreen.dart';
import '../groupsCardScreen.dart';
import '../importCardsScreen.dart';

class VipCardsScreen extends StatefulWidget {
  const VipCardsScreen({Key? key}) : super(key: key);

  @override
  _VipCardsScreenState createState() => _VipCardsScreenState();
}

class _VipCardsScreenState extends State<VipCardsScreen> {
  @override
  Widget build(BuildContext context) {
    late bool isSelected=false;
    var size= MediaQuery.of(context).size;
    return  Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.15,
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
                  padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios, size: size.height*0.02, color: bckgrnd,)),
                      Container(
                        alignment: Alignment.center,
                        child: Text('VIP', style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "MBold",
                            color: bckgrnd
                        ),),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                      )
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
                  padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.check,size: 25,color: signupclor_dark,),
                          Text('(1) card selected',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "MBold",
                                color: Colors.black
                            ),),
                          Container(
                            alignment: Alignment.center,
                            height: size.height * 0.04,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      gradientgreen,
                                      primarygreen,
                                    ]
                                ),
                                color: bckgrnd,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Dialog errorDialog = Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)),
                                  //this right here
                                  child: Container(
                                    height: size.height*0.35,
                                    width: size.width,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(),
                                              SizedBox(width: 70,),
                                              Text(
                                                'Manage',
                                                style: TextStyle(color: Colors.black,
                                                    fontSize:size.height*0.03,
                                                    fontFamily: 'Msemibold'
                                                ),
                                              ),
                                              SizedBox(width: 40,),
                                              // Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: GestureDetector(
                                                    onTap:(){
                                                      Navigator.pop(context);
                                                    } ,
                                                    child: Icon(Icons.close,size:20,)),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>GroupsCardsScreen()));
                                                  },
                                                  child: Column(
                                                    children: [
                                                      SvgPicture.asset(grptwo_icon,),
                                                      Text('Group',
                                                        style: TextStyle(
                                                            fontSize: size.height*0.02
                                                        ),),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    SvgPicture.asset(export_icon,),
                                                    Text('Export',
                                                      style: TextStyle(
                                                          fontSize: size.height*0.02
                                                      ),),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: (){

                                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ImportCardsScreen()));
                                                  },
                                                  child: Column(
                                                    children: [
                                                      SvgPicture.asset(import_icon,),
                                                      Text('Import',
                                                        style: TextStyle(
                                                            fontSize: size.height*0.02
                                                        ),),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    GestureDetector(
                                                        onTap:(){
                                                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AddContactCardsScreen()));
                                                        },
                                                        child: SvgPicture.asset(addcntct_icon,)),
                                                    Text('Add Contact',
                                                      style: TextStyle(
                                                          fontSize: size.height*0.02
                                                      ),),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Column(
                                                  children: [
                                                    SvgPicture.asset(emailtwo_icon,),
                                                    Text('Email',
                                                      style: TextStyle(
                                                          fontSize: size.height*0.02
                                                      ),),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SvgPicture.asset(recyclebin_icon),
                                                    Text('Delete',
                                                      style: TextStyle(
                                                          fontSize: size.height*0.02
                                                      ),),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SvgPicture.asset(contwo_icon),
                                                    Text('Team',
                                                      style: TextStyle(
                                                          fontSize: size.height*0.02
                                                      ),),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    SvgPicture.asset(share_icon,),
                                                    Text('Share',
                                                      style: TextStyle(
                                                          fontSize: size.height*0.02
                                                      ),),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        // Column(
                                        //   children: [
                                        //     Row(
                                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //       children: [
                                        //
                                        //         SvgPicture.asset(grptwo_icon,),
                                        //         SvgPicture.asset(export_icon,),
                                        //         SvgPicture.asset(import_icon,),
                                        //         SvgPicture.asset(addcntct_icon,),
                                        //
                                        //       ],
                                        //     ),
                                        //     Row(
                                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //       children: [
                                        //         // SizedBox(width: 15,),
                                        //         Text('Group',
                                        //           style: TextStyle(
                                        //               fontSize: size.height*0.02
                                        //           ),),
                                        //         // SizedBox(width: 15,),
                                        //         Text('Export',
                                        //           style: TextStyle(
                                        //               fontSize: size.height*0.02
                                        //           ),),
                                        //         // SizedBox(width: 15,),
                                        //         Text('Import',
                                        //           style: TextStyle(
                                        //               fontSize: size.height*0.02
                                        //           ),),
                                        //         // SizedBox(width: 15,),
                                        //         Text('Add Contact',
                                        //           style: TextStyle(
                                        //               fontSize: size.height*0.012
                                        //           ),),
                                        //       ],
                                        //     ),
                                        //     SizedBox(height: 20,),
                                        //     Column(
                                        //       children: [
                                        //         Row(
                                        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //           children: [
                                        //             SvgPicture.asset(emailtwo_icon,height:20,),
                                        //             SvgPicture.asset(recyclebin_icon,height: 20,),
                                        //             SvgPicture.asset(contwo_icon,height: 30,),
                                        //             SvgPicture.asset(share_icon,height: 20,),
                                        //           ],
                                        //         ),
                                        //         Row(
                                        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //           children: [
                                        //             Text('Email',
                                        //               style: TextStyle(
                                        //                   fontSize: size.height*0.02
                                        //               ),),
                                        //             Text('Delete',
                                        //               style: TextStyle(
                                        //                   fontSize: size.height*0.02
                                        //               ),),
                                        //             Text('Team',
                                        //               style: TextStyle(
                                        //                   fontSize: size.height*0.02
                                        //               ),),
                                        //             Text('Share',
                                        //               style: TextStyle(
                                        //                   fontSize: size.height*0.02
                                        //               ),),
                                        //           ],
                                        //         )
                                        //       ],
                                        //     ),
                                        //
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => errorDialog);
                              },
                              child: Container(
                                // margin: EdgeInsets.only(left: size.width*0.04),
                                alignment: Alignment.center,
                                child: Text('Manage', style: TextStyle(
                                    color: bckgrnd,
                                    fontSize: size.height*0.018,
                                    fontFamily: 'MBold'
                                ),),
                              ),
                            ),
                          ),  Container(
                            alignment: Alignment.center,
                            height: size.height * 0.04,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      signupclor_light,
                                      signupclor_dark,
                                    ]
                                ),
                                color: bckgrnd,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Container(
                              // margin: EdgeInsets.only(left: size.width*0.04),
                              alignment: Alignment.center,
                              child: Text('Select All', style: TextStyle(
                                  color: bckgrnd,
                                  fontSize: size.height*0.018,
                                  fontFamily: 'MBold'
                              ),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height*0.01,),
                      Container(
                        height: size.height*1.0,
                        width: size.width,
                        child: ListView.builder(
                          padding:EdgeInsets.all(0),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return Container(
                              margin: EdgeInsets.only(top: size.height*0.02),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    // checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.all(signupclor_dark),
                                    value: isSelected,
                                    shape: CircleBorder(),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isSelected = value!;
                                      });
                                    },
                                  ),
                                  Container(
                                    child: ClipRRect(
                                      child: Image.asset(mycard_icon,fit: BoxFit.cover,),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: size.height*0.08,
                                    width: size.width*0.3,
                                  ),
                                  SizedBox(width: size.width*0.04,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Company Name',style: TextStyle(
                                          fontSize: size.height*0.015,
                                          fontFamily:"MBold"
                                      ),),
                                      SizedBox(height: size.height*0.02,),
                                      Text('Lorem ipsum dolor sit amet',style: TextStyle(
                                          fontSize: size.height*0.01,
                                          fontFamily: "Msemibold",
                                          color: infocolor
                                      ),),
                                      SizedBox(height: size.height*0.01,),
                                      Text('Concsectetuer adipiscing elit, sed fiam',style: TextStyle(
                                          fontSize: size.height*0.01,
                                          fontFamily: "Msemibold",
                                          color: infocolor
                                      ),),
                                    ],
                                  ),

                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),]
            ,
          ),
        )
    );
  }
}
