import 'package:concard/Constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key,required this.text,required this.color1,required this.color2,required this.textcolor1,required this.textcolor2}) : super(key: key);
String text;
  Color color1;
  Color color2;
Color textcolor1;
Color textcolor2;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height*0.05,
      width: size.width*0.8,
      decoration:BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
        alignment: Alignment.center,
        child: Text(text,style: TextStyle(
          color: textcolor1,
          fontSize: size.height*0.02,
          fontWeight: FontWeight.bold,
          fontFamily: 'Msemibold'
        ),),
      ),
    );
  }
}
