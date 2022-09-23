import 'package:concard/Constants/images.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class SocialLinksField extends StatelessWidget {
  const SocialLinksField(
      {Key? key,
      required this.hinttext,
      required this.controller,
      required this.textInputType,
      required this.validator,
      required this.image})
      : super(key: key);
  final TextEditingController controller;
  final String hinttext;
  final TextInputType textInputType;
  final String image;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          // height: size.height * 0.055,
          width: size.width * 0.78,
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
                hintText: hinttext,
                contentPadding:
                    const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                hintStyle: TextStyle(
                    fontSize: size.height * 0.02,
                    color: infocolor,
                    fontFamily: "Msemibold"),
                suffixIcon: Icon(
                  Icons.lock,
                  size: 20,
                  color: infocolor,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
        ),
        // SizedBox(width: 10,),
        CircleAvatar(
          radius: size.width * 0.06,
          backgroundColor: signupclor_dark,
          child: CircleAvatar(
            radius: size.width * 0.055,
            backgroundColor: Colors.white,
            child: Image.asset(
              image,
              height: size.height * 0.05,
            ),
          ),
        ),
        // Container(
        //   height: size.height * 0.1,
        //   width: size.width * 0.1,
        //   decoration: BoxDecoration(
        //     shape:BoxShape.circle,
        //     color:Colors.white,
        //     border:Border.all(
        //       color:infocolor
        //     )
        //   ),
        // ),
        // Image.asset(
        //   image,
        //   height: size.height * 0.05,
        // )
      ],
    );
  }
}
