import 'package:concard/Constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';

class NearByScreen extends StatefulWidget {
  NearByScreen({Key? key}) : super(key: key);

  @override
  State<NearByScreen> createState() => _NearByScreenState();
}

class _NearByScreenState extends State<NearByScreen> {
bool?  exchngCard=false;

bool?  selectedProfile=false;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
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
                padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, size: 20, color: bckgrnd,)),
                    // SizedBox(width: 120,),
                    Row(
                      children: [
                        Image.asset(nerby_icon,color: bckgrnd,height: 20,),
                        SizedBox(width: 5,),
                        Container(
                          alignment: Alignment.center,
                          child: Text('Nearby', style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: 'MBold',
                              color: bckgrnd
                          ),),
                        ),
                      ],
                    ),

                    // SizedBox(width: 80,),
                    Image.asset(notify_icon,height: 20,),
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
                  children: [
                    SizedBox(height: size.height*0.02,),
                    Text(
                      '5 Concards found nearby',
                      style: TextStyle(
                          fontSize: size.height * 0.016,
                          fontFamily: 'MBold'
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'tap one of the Concard users to exchange business cards',
                      style: TextStyle(
                          fontSize: size.height * 0.014,
                          fontFamily: 'Stf',
                        color: signupclor_dark
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(guidefilled_icon),
                        SizedBox(width:size.width*0.04,),
                        Text('Make sure that both devices are unlocked, close together &\nhave Bluetooth and location turned on. Learn more about\nNearby share.',
                          style: TextStyle(
                              fontSize: size.height*0.011,
                              fontFamily: 'Stf',
                          ),),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(height: size.height*0.02,),
                  Container(
                    height: size.height*0.1,
                    width: size.width*0.85,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (context,index){
                      return   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: size.width*0.03,),
                          Column(
                            children: [
                              CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(    "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",)),
                              Text(' Tomy Jones',style: TextStyle(
                                  fontSize: size.height*0.012,
                                  fontFamily: 'MBold'
                              ),),
                              Text(' Lorem ipsum',style: TextStyle(
                                  fontSize: size.height*0.01,
                                  color: infocolor,
                                  fontFamily: 'MBold'
                              ),),
                            ],

                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: size.height*0.03,),
                  Container(
                    height: size.height*0.1,
                    width: size.width*0.85,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (context,index){
                      return   Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: size.width*0.03,),
                          Column(
                            children: [
                              CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(    "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",)),
                              Text(' Tomy Jones',style: TextStyle(
                                  fontSize: size.height*0.012,
                                  fontFamily: 'MBold'
                              ),),
                              Text(' Lorem ipsum',style: TextStyle(
                                  fontSize: size.height*0.01,
                                  color: infocolor,
                                  fontFamily: 'MBold'
                              ),),
                            ],

                          ),
                        ],
                      );
                    }),
                  ),
                    SizedBox(height: size.height*0.05,),
                    Visibility(
                      visible: selectedProfile=true,
                      child: Container(
                        // height: size.height*0.3,
                        width: size.width*0.9,
                        child: Card(
                          elevation: 10,
                          color: bckgrnd,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding:EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: size.width*0.05,
                                    ),
                                    Text('Selected',style: TextStyle(
                                      fontSize: size.height*0.018,
                                      fontFamily: 'MBold'
                                    ),),
                                    Icon(Icons.close,size: 20)
                                  ],
                                ),
                                SizedBox(height: size.height*0.02,),
                                Text('2 profile selected',
                                style: TextStyle(
                                  fontFamily: 'Msemibold',
                                  fontSize: size.height*0.015,
                                  color: signupclor_dark,
                                ),),
                                SizedBox(height: size.height*0.02,),
                                Row(
                                  children: [
                                    Text('Tony jones',
                                      style: TextStyle(
                                        fontFamily: 'Stf',
                                        fontSize: size.height*0.015,
                                        color: signupclor_dark,
                                      ),),
                                    SizedBox(width:size.width*0.02,),
                                    Text('James Tony',
                                      style: TextStyle(
                                        fontFamily: 'Stf',
                                        fontSize: size.height*0.015,
                                        color: signupclor_dark,
                                      ),),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                InkWell(
                                  onTap: (){

                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.05,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                signupclor_light,
                                                signupclor_dark,
                                              ]),
                                          border: Border.all(color: Colors.grey),
                                          color: bckgrnd,
                                          borderRadius: BorderRadius.circular(35)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Connect',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: size.height* 0.018,
                                                fontFamily: 'Mbold'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: exchngCard!,
                      child: Container(
                        // height: size.height*0.3,
                        width: size.width*0.9,
                        child: Card(
                          elevation: 10,
                          color: bckgrnd,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top:size.height*0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Connected successfully',style: TextStyle(
                                        fontSize: size.height*0.018,
                                        fontFamily: 'MBold'
                                    ),),
                                    Icon(Icons.close,size: 20)
                                  ],
                                ),
                                SizedBox(height: size.height*0.01,),
                              Container(
                                height: size.height*0.1,
                                width: size.width,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  scrollDirection: Axis.vertical,
                                  itemCount: 2,
                                    itemBuilder: (context, index){
                                  return Container(
                                    margin: EdgeInsets.only(top: size.width*0.03),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(    "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",)),
                                        SizedBox(width: 10,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Tomy Jones',style: TextStyle(
                                                fontSize: size.height*0.015,
                                                fontFamily: 'MBold'
                                            ),),
                                            Text(' Lorem ipsum',style: TextStyle(
                                                fontSize: size.height*0.013,
                                                fontFamily: 'Msemibold'
                                            ),),
                                          ],
                                        ),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              height: size.height*0.04,
                                              width: size.width*0.3,
                                              decoration:BoxDecoration(
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end: Alignment.bottomRight,
                                                      colors: [
                                                        bckgrnd,
                                                        bckgrnd,
                                                      ]
                                                  ),
                                                  border: Border.all(color: signupclor_dark),
                                                  color: bckgrnd,
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                              child: Text('Disconnected',
                                                style: TextStyle(
                                                    fontSize: size.height*0.015,
                                                    fontFamily: 'Stf',
                                                  color: signupclor_dark
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                                SizedBox(height:size.height*0.03),

                                InkWell(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: size.height * 0.05,
                                    width: size.width*0.9,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              signupclor_light,
                                              signupclor_dark,
                                            ]),
                                        border: Border.all(color: Colors.grey),
                                        color: bckgrnd,
                                        borderRadius: BorderRadius.circular(35)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Exchange cards',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.height* 0.018,
                                              fontFamily: 'Mbold'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: size.height*0.02,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
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
