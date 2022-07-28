import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class CustomCardInputField extends StatelessWidget {
  CustomCardInputField({Key? key,required this.hinttxt,required this.textInputType,required this.controller}) : super(key: key);

  TextEditingController controller;
  String hinttxt;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.055,
      width: size.width*0.9,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hinttxt,
            contentPadding:
            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
            hintStyle:
            TextStyle(fontSize: size.width * 0.04, color: infocolor),
            fillColor: Colors.white,
            filled: true,
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(25),
            )),
      ),
    );
  }
}
