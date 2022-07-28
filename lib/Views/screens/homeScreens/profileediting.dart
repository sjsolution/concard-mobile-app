import 'package:concard/Constants/Colors.dart';
import 'package:flutter/material.dart';

class Profileediting extends StatefulWidget {
  const Profileediting({ Key? key }) : super(key: key);

  @override
  State<Profileediting> createState() => _ProfileeditingState();
}

class _ProfileeditingState extends State<Profileediting> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
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
                    padding: const EdgeInsets.only(left:12,right: 12,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('asset/images/drawer_icon.png'),
                        Row( 
                          children: [
                             Image.asset('asset/images/search_icon.png'),
                             SizedBox(width: size.width*0.040,),
                             Image.asset('asset/images/notification_icon.png'),
                             SizedBox(width: size.width*0.040,),
                             Image.asset('asset/images/profile_icon.png'),
                          ],
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
                      padding: const EdgeInsets.only(left:12,right: 12,top: 20),
                      child: Container(
                        height: size.height*0.7,
                        width: size.width*1.0,
                        decoration: BoxDecoration(
                          color: bckgrnd,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left:12,right: 12,top: 20),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: graphgradient,
                                child: CircleAvatar(
                                  radius: 38,
                                  backgroundColor: bckgrnd,
                                ),
                              ),
                              SizedBox(height: size.height*0.005,),
                              Text('John Garet',style: TextStyle(fontSize: size.height*0.020,fontFamily: 'Msemibold',color: signupclor_dark),),
                              SizedBox(height:size.height*0.002),
                              Text('lorem ipsum',style: TextStyle(fontSize: size.height*0.015,color: signupclor_dark,fontFamily: 'Mbold'),),
                              SizedBox(height: size.height*0.030,),
                              Text('John is already a Concard member,\nLet him Know you are too.',textAlign: TextAlign.center,style: TextStyle(fontSize: size.height*0.016,fontFamily: 'Mbold' ),),
                              SizedBox(height: size.height*0.020,),
                              Divider(
                                color: Color(0xff919191),
                              ),
                              SizedBox(height: size.height*0.040,),
                              Padding(
                                padding: const EdgeInsets.only(left:20,right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset('asset/images/name_icon.png'),
                                        SizedBox(height: size.height*0.010,),
                                        Text('Assem Yamak',style: TextStyle(fontSize: size.height*0.015,fontFamily: 'Stf'),),
                                        Text('6274239 ',style: TextStyle(fontSize: size.height*0.015,fontFamily: 'Mmedium'),),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: size.height*0.040),
                                      child: Image.asset('asset/images/swaip_icon.png'),
                                      ),
                                    Column(
                                      children: [
                                        Image.asset('asset/images/name_icon.png'),
                                        SizedBox(height: size.height*0.010,),
                                        Text('Tony Jones',style: TextStyle(fontSize: size.height*0.015,fontFamily: 'Stf'),),
                                        Text('6274239 ',style: TextStyle(fontSize: size.height*0.015,fontFamily: 'Mmedium'),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                               SizedBox(height: size.height*0.020,),
                              Divider(
                                color: Color(0xff919191),
                              ),
                              SizedBox(height: size.height*0.020,),
                              TextFormField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffF0F0F0),
                                  hintText: 'Write a note',
                                  hintStyle: TextStyle(fontSize: size.height*0.018,color: Color(0xffCCC5C5),fontFamily: 'Mbold'),
                                  border: OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.transparent),
                                     ),
                                     enabledBorder: OutlineInputBorder(
                                       borderRadius:BorderRadius.circular(20),
                                       borderSide:BorderSide(color: Colors.transparent),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:BorderRadius.circular(20),
                                          borderSide: BorderSide(color: Colors.transparent),
                                           ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
              ),
            ],
          ),
                            SizedBox(height: size.height*0.030,),
                            Padding(
                              padding: const EdgeInsets.only(left:12,right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                  height: size.height*0.05,
                                  width: size.width*0.4,
                                  decoration: BoxDecoration(
                                    // color: signupclor_dark,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color:signupclor_dark),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                        fontSize: size.height*0.018,
                                        fontFamily: 'Stf',
                                        color:signupclor_dark,
                                        ),
                                        ),
                                        ),
                          ),
        
                          Container(
                                  height: size.height*0.05,
                                  width: size.width*0.4,
                                  decoration: BoxDecoration(
                                     gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                       end: Alignment.bottomCenter,
                                          colors: [
                                            signupclor_light,
                                             signupclor_dark
                                                         ]
                                                           ),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color:signupclor_dark),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Exchange',
                                      style: TextStyle(
                                        fontSize: size.height*0.018,
                                        fontFamily: 'Stf',
                                        color:bckgrnd,
                                        ),
                                        ),
                                        ),
                          ),
                                ],
                              ),
                            ),
          ],
        ),
      ),
    );
  }
}