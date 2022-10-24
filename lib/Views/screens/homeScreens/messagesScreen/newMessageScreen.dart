import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';

class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: size.height * 0.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: [signupclor_light, signupclor_dark]),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: bckgrnd,
                      )),
                  // SizedBox(width: 120,),
                  Row(
                    children: [
                      Image.asset(
                        msgs_icon,
                        color: bckgrnd,
                        height: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Container(
                        child: Text(
                          'Messages',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: 'MBold',
                              color: bckgrnd),
                        ),
                      ),
                    ],
                  ),

                  // SizedBox(width: 80,),
                  Image.asset(
                    notify_icon,
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.13),
            height: size.height * 0.8,
            width: size.width,
            decoration: BoxDecoration(
                color: btnclr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'New Message',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: 'MBold',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    child: Text(
                      'To',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: 'MBold',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    height: size.height * 0.09,
                    width: size.width,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Search for a name or group',
                          contentPadding: EdgeInsets.only(
                              top: 0.0, left: 22.0, bottom: 2.0),
                          fillColor: bckgrnd,
                          filled: true,
                          prefixIcon:  Icon(Icons.search,size: size.height*0.05,color: infocolor,),
                          hintStyle: TextStyle(
                              fontSize: size.height * 0.015, color: infocolor),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: bckgrnd)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: bckgrnd))),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.04,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              signupclor_light,
                              signupclor_dark,
                            ]),
                        border: Border.all(color: signupclor_dark),
                        color: bckgrnd,
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      // margin: EdgeInsets.only(left: size.width*0.04),
                      child: Center(
                        child: Text(
                          'Send Broadcast',
                          style: TextStyle(
                              color: bckgrnd,
                              fontSize: size.height * 0.018,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MBold'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder<Object>(
            future: null,
            builder: (context, snapshot) {
              return Container(
                  margin: EdgeInsets.only(top: size.height * 0.4),
                  // height: size.height*0.8,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: bckgrnd,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: Container(
                    height: size.height * 1.0,
                    width: size.width,
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        scrollDirection: Axis.vertical,
                        itemExtent: 70,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(
                                          "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                        )),
                                    SizedBox(
                                      width: size.width * 0.03,
                                    ),
                                    Text(
                                      'Jackbill',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: 'Mbold'),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              )
                            ],
                          );
                        }),
                  ));
            }
          )
        ],
      ),
    ));
  }
}
