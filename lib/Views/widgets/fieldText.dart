import 'package:concard/Constants/colors.dart';
import 'package:flutter/material.dart';

class FieldText extends StatelessWidget {
  const FieldText(
      {required this.hinttxt,
      required this.controller,
      required this.textInputType,
      required this.pass,
      required this.validate});

  final TextEditingController controller;
  final String hinttxt;
  final TextInputType textInputType;
  final bool pass;
  final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      validator: validate,
      obscureText: pass,
      decoration: InputDecoration(
          hintText: hinttxt,
          contentPadding: EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
          hintStyle: TextStyle(
              fontSize: size.height * 0.015,
              color: infocolor,
              fontFamily: "Stf"),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
    );
  }
}
