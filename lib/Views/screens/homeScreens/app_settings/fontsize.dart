import 'package:concard/Constants/Colors.dart';
import 'package:flutter/material.dart';


class Fontsizescreen extends StatefulWidget {
  const Fontsizescreen({ Key? key }) : super(key: key);

  @override
  State<Fontsizescreen> createState() => _FontsizescreenState();
}

class _FontsizescreenState extends State<Fontsizescreen> {
  var _valuse;
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
                     padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Font Size',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'MBold'),),
                    SizedBox(height: size.height*0.020,),
                    Container(
                      height:size.height*0.25,
                      width: size.width*1.0,
                      decoration: BoxDecoration(
                        color: bckgrnd,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                             padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.01),
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Standard',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'Mmedium'),),
                                Radio(
                                  activeColor: signupclor_dark,
                                  value: 'standard',
                                   groupValue: _valuse,
                                    onChanged:(dynamic value){
                                      setState(() {
                                        _valuse=value;
                                      });
                                    }
                                    ),
                              ],
                            ),
                            Divider(
                              height: size.height*0.01,
                              color: Color(0xffE6E6E6),
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Large',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'Mmedium'),),
                                Radio(
                                  activeColor:signupclor_dark,
                                  value: 'Large',
                                   groupValue: _valuse,
                                    onChanged:(dynamic value){
                                      setState(() {
                                        _valuse=value;
                                      });
                                    }
                                    ),
                              ],
                            ),
                            Divider(
                              height: size.height*0.01,
                              color: Color(0xffE6E6E6),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Extra Large',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'Mmedium'),),
                                Radio(
                                  activeColor: signupclor_dark,
                                  value: 'Extra Large',
                                   groupValue: _valuse,
                                    onChanged:(dynamic value){
                                      setState(() {
                                        _valuse=value;
                                      });
                                    }
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
      ],
    ),
    );
  }
}