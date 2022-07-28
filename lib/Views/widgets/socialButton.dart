

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Constants/colors.dart';

class SocialButtons extends StatelessWidget {
  SocialButtons({Key? key,required this.image,required this.text,required this.color1,required this.color2,required this.txtcolor1,required this.txtcolor2}) : super(key: key);

  String image;
  String text;
  Color color1;
  Color color2;
  Color txtcolor1;
  Color txtcolor2;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height*0.05,
      width: size.width*0.8,
      decoration:BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color1,
                color2,
              ]
          ),
          border: Border.all(color: Colors.grey),
          color: bckgrnd,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        // margin: EdgeInsets.only(left: size.width*0.04),
        child: Padding(
          padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(image),
              Text(text,style: TextStyle(
                color: txtcolor1,

                fontSize: size.height*0.02,
                fontFamily: "Msemibold"
              ),),
              Container(
                height: size.height*0.03,
                // color: Colors.white,
                width: size.width*0.02,
              )
            ],
          ),
        ),
      ),
    );
  }
}
