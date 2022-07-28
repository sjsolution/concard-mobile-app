import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

class SignupAppbar extends StatelessWidget {
  SignupAppbar({Key? key,required this.text,}) : super(key: key);
String text;
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return  Container(
      height: size.height*0.2,
      width: size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                primaryblue,
                primarycolor,
                prmryblue,
                primarygreen
              ])
      ),
      child:Padding(
        padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios,size: size.height*0.03,color: Colors.white,)),
            Text('Sign Up',style: TextStyle(
                color: bckgrnd,
                fontSize: size.height*0.025,
                fontWeight: FontWeight.bold,
              fontFamily: 'Msemibold'
            ),),
            Container(
              height: size.height*0.03,
              width: size.width*0.02,
            )
          ],
        ),
      ) ,
    );
  }
}
