import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/colors.dart';

class CustomNextButton extends StatelessWidget {
  CustomNextButton(
      {Key? key,
      required this.text,
      required this.image,
      required this.color1,
      required this.color2,
      required this.onTap})
      : super(key: key);
  String text;
  String image;
  Color color1;
  Color color2;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.05,
        width: size.width*0.8,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color1,
                  color2,
                ]),
            border: Border.all(color: Colors.grey),
            color: bckgrnd,
            borderRadius: BorderRadius.circular(35)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height*0.03,
                    width: size.width*0.02,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height*0.02,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Msemibold'),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.23,
                  // ),
                  SvgPicture.asset(image,height: size.height*0.018,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
