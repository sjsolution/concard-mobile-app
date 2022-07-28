import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/secratoryModeAfterScanScreen.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../Constants/colors.dart';

class SecretaryModeScreen extends StatelessWidget {
  const SecretaryModeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
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
              padding:  EdgeInsets.only(left: size.width*0.04, right:size.width*0.04,top: size.height*0.04),
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
                    'Secretary Mode',
                    style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: 'Msemibold',
                        color: bckgrnd),
                  ),
                  // SizedBox(
                  //   width: 110,
                  // ),
                  Container(
                    width: size.width*0.05,
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
            child: Column(
              children: [
                SizedBox(height: size.height*0.03,),
                Container(
                  height: size.height*0.35,
                  width: size.width*0.9,
                  decoration: BoxDecoration(
                      color: bckgrnd,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SecretaryAfterScaaningScreen()));
                    },
                    child: Column(
                      children: [
                       
                        SizedBox(height: size.height*0.02,),
                       PrettyQr(
              image: AssetImage(concard_icon),
              typeNumber: 4,
              size: size.height*0.1,
              data: 'https://www.google.ru',
              errorCorrectLevel: QrErrorCorrectLevel.M,
              roundEdges: true,
              elementColor: signupclor_dark,
            ),
                        SizedBox(height: size.height*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.04),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                  
                                  child: Icon(Icons.circle,size: size.height*0.015,color: cgreen,),
                              margin:EdgeInsets.only(top: size.height*0.004)
                              ),
                              SizedBox(width: size.width*0.02,),
                              Text('Let your secretary open his/her Concard and scan\nthe QR code.',style: TextStyle(
                                fontSize: size.height*0.015,
                                fontFamily: "Msemibold"
                              ),)
                            ],
                          ),
                        ),
                        SizedBox(height: size.height*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.04),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                  
                                  child: Icon(Icons.circle,size: size.height*0.015,color: cgreen,),
                              margin:EdgeInsets.only(top: size.height*0.004)
                              ),
                              SizedBox(width: size.width*0.02,),
                              Text('All cards scanned from secretary account will be\ndirectly added to your account.',style: TextStyle(
                                fontSize: size.height*0.015,
                                fontFamily: "Msemibold"
                              ),),
                            ],
                          ),
                        ),
                         SizedBox(height: size.height*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.04),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                  
                                  child: Icon(Icons.circle,size: size.height*0.015,color: cgreen,),
                              margin:EdgeInsets.only(top: size.height*0.004)
                              ),
                              SizedBox(width: size.width*0.02,),
                              Text('After scanning QR code, you can manage what your\nsecretary can do with your cards.',style: TextStyle(
                                fontSize: size.height*0.015,
                                fontFamily: "Msemibold"
                              ),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
