import 'package:concard/Constants/Colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cloudsyncscreen extends StatefulWidget {
  const Cloudsyncscreen({ Key? key }) : super(key: key);

  @override
  State<Cloudsyncscreen> createState() => _CloudsyncscreenState();
}

class _CloudsyncscreenState extends State<Cloudsyncscreen> {
  bool _cloudsync=false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: Color(0xffF7F7F7),
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
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.height * 0.02,
                      color: bckgrnd,
                    ),
                  ),
                  Text(
                    'App Settings',
                    style: TextStyle(
                      fontSize: size.height * 0.020,
                      color: bckgrnd,
                      fontFamily: 'Msemibold',
                    ),
                  ),
                  Container(
                    height: size.height * 0.02,
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
                padding:  EdgeInsets.only(left:size.width*0.04,right: size.width*0.04,top: size.height*0.02),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cloud Sync (Auto)',
                          style: TextStyle(
                            fontSize: size.height*0.018,
                            fontFamily: 'MBold',
                            ),
                            ),
                            Transform.scale(
                        scale: 0.6,
                        child: CupertinoSwitch(
                            trackColor: Color(0xffD0D0D0),
                            activeColor: txtcolr,
                            value: _cloudsync,
                            onChanged: (values) {
                              setState(() {
                                _cloudsync = values;
                              });
                            }),
                      ),
                      ],
                    ),
                    SizedBox(height: size.height*0.050,),
                    Image.asset(
                      cloudsync,
                      height: size.height*0.1,
                    ),
                    SizedBox(height: size.height*0.030,),
                    Container(
                      height: size.height*0.23,
                      width: size.width*1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                         color: bckgrnd,
                      ),
                      child: Padding(
                         padding:  EdgeInsets.only(left:size.width*0.04,right: size.width*0.04,top: size.height*0.02),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('assem_yamak@hotmail.com',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'MBold'),),
                            Text('Last synced on 23/04/2022, 9:50 pm',style: TextStyle(fontSize: size.height*0.015,fontFamily: 'Stf'),),
                            Divider(color:Color(0xffE6E6E6) ,),
                            SizedBox(height: size.height*0.020,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Total Contacts',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'Mmedium'),),
                               Row(
                                 children: [
                                   Text('250',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'Stf'),),
                                   Icon(Icons.arrow_forward_ios,size:size.height*0.020),
                                 ],
                               ),
                             ],
                            ),
                            Divider(
                              color:Color(0xffE6E6E6) ,
                            ),
                            SizedBox(height: size.height*0.020,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Backup history',style:TextStyle(fontSize: size.height*0.018,fontFamily: 'Mmedium'),),
                                Row(
                                  children: [
                                    Text('2 backup(s)',style:TextStyle(fontSize: size.height*0.018,fontFamily: 'Stf'),),
                                    Icon(Icons.arrow_forward_ios,size:size.height*0.020),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: size.height * 0.3),
                        height: size.height * 0.06,
                        width: size.width * 1.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [
                              signupclor_light,
                              signupclor_dark,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Sync Now',
                            style: TextStyle(
                              color: bckgrnd,
                              fontFamily: 'MBold',
                              fontSize: size.height * 0.020,
                            ),
                          ),
                        ),
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