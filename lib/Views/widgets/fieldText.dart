import 'package:concard/Constants/colors.dart';
import 'package:flutter/material.dart';

class FieldText extends StatelessWidget {
  FieldText(
      {required this.hinttxt,
      required this.controller,
      required this.textInputType,
      required this.pass});

  TextEditingController controller;
  String hinttxt;
  TextInputType textInputType;
  bool pass;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      width: size.width*0.8,
      child: TextField(
        obscureText: pass,
        decoration: InputDecoration(
            hintText: hinttxt,
            contentPadding:
                EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
            hintStyle:
                TextStyle(fontSize: size.height*0.015, color: infocolor,
                fontFamily: "Stf"),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }
}
