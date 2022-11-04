import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class CustomCardInputField extends StatelessWidget {
  CustomCardInputField(
      {Key? key,
      required this.hinttxt,
      required this.textInputType,required this.validator,
      required this.controller,required this.icon})
      : super(key: key);
 String? Function(String?)? validator;
  TextEditingController controller;
  String hinttxt;
  var icon;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      // height: size.height * 0.09,
      width: size.width * 0.85,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            hintText: hinttxt,
            contentPadding:const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
            hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            )),
      ),
    );
  }
}
