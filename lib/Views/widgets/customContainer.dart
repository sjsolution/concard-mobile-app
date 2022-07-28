import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomConatiner extends StatelessWidget {
  CustomConatiner({Key? key,required this.txt,required this.color1,required this.color2}) : super(key: key);

  String txt;
  Color color1;
  Color color2;
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
            color1,
            color2
          ]
        ),
      ),
      height: size.height*0.05,
      width: size.width*0.8,
      child: Padding(
        padding: EdgeInsets.only(left: size.width*0.04,right:size.width*0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(txt,style: TextStyle(
              fontSize: size.height*0.015,
              fontFamily: "Stf",

              color: Colors.white
            ),),
            Spacer(),
            Image.asset(downarrow_icon,color: bckgrnd,)
          ],
        ),
      ),
    );
  }
}
