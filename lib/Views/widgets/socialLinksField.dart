import 'package:concard/Constants/images.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class SocialLinksField extends StatelessWidget {
  SocialLinksField({Key? key,required this.hinttext,required this.controller,required this.textInputType,required this.image}) : super(key: key);
  TextEditingController controller;
  String hinttext;
  TextInputType textInputType;
  String image;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: size.height * 0.055,
          width: size.width*0.78,
          child: TextField(
            decoration: InputDecoration(
                hintText: hinttext,
                contentPadding:
                EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                hintStyle:
                TextStyle(fontSize: size.height*0.02, color: infocolor,
                fontFamily: "Msemibold"),
                suffixIcon: Icon(Icons.lock,size: 20,color: infocolor,),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
          ),
        ),
        Image.asset(image,height: size.height*0.05,)
      ],
    );
  }
}
