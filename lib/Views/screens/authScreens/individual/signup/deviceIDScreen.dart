import 'package:concard/Views/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../signin/singIn.dart';

class DeviceIdScreen extends StatelessWidget {
  const DeviceIdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.4,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            primaryblue,
                            primarycolor,
                            prmryblue,
                            primarygreen
                          ])),
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.1),
                    child: Column(
                      children: [
                        SvgPicture.asset(con_icon,height: size.height*0.1,),
                        SizedBox(height: size.height*0.02,),
                        Text(
                          'C O N C A R D',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height*0.025,
                              fontFamily: "Msemibold"),
                        ),
                        Text(
                          "Now You're Connected",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height*0.015,
                            fontFamily: "Stf"
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.38),
              height: size.height * 0.65,
              width: size.width,
              decoration: BoxDecoration(
                  color: bckgrnd,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.only(top: size.height*0.07,left: size.width*0.04,right: size.width*0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                            child: Icon(Icons.arrow_back_ios,size: 17,color: gradientgreen,)),
                        Text('Device ID',
                        style: TextStyle(
                          fontSize: size.height*0.025,
                          fontFamily: "Msemibold",
                          color: gradientgreen
                        ),),
                        Container(
                          width: size.width*0.04,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.05,),
                    Text('Your company Admin will need your device\nID to authorize your usage of\nConCard Business123456789',
                    style: TextStyle(
                      fontSize: size.height*0.018,
                      fontFamily: "Stf"
                    ),
                    ),
                    SizedBox(height: size.height*0.1,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
                        child: Container(
                          height: size.height*0.05,
                          width: size.width*0.8,
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
                            child: Text('Send via E-mail',style: TextStyle(
                                color: bckgrnd,
                                fontSize: size.height*0.02,
                                fontFamily: 'Msemibold'
                            ),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.1,),
                    Center(
                      child: Text(
                        "Now You're Connected",
                        style: TextStyle(
                          color: signupclor_dark,
                          fontSize: size.height* 0.015,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
