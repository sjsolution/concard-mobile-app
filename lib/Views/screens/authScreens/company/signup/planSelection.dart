import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/company/signup/cardDetails.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:flutter/material.dart';

import 'companySignupHomeScreen.dart';

class PlanSelection extends StatelessWidget {
  const PlanSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25,),
          Center(
            child: Text("Plan Selection",
              style: TextStyle(
                  fontSize: size.height*0.02,
                  fontFamily: "Mbold"
              ),),
          ),
          SizedBox(height: 80,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: size.height*0.04,
                width: size.width*0.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.topCenter,
                      colors: [
                        gradientgreen,
                        primarygreen,

                      ],
                    ),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text('Free',
                    style: TextStyle(
                        fontSize: size.height*0.015,
                        color: Colors.white,
                      fontFamily: "MBold"

                    ),),
                ),
              ),
              SizedBox(width: size.width*0.08,),
              Container(
                height: size.height*0.05,
                width: size.width*0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: Text('Premium',
                    style: TextStyle(
                      fontSize: size.height*0.015,
                      fontFamily: "Stf"
                    ),),
                ),
              ),
              SizedBox(width: size.width*0.15,),
            ],
          ),
          SizedBox(height: 30,),
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.06,right: size.width*0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Feature 1',style: TextStyle(
                      fontSize: size.height*0.015,
                      fontFamily: "Stf"
                    ),),
                    Spacer(),
                    Icon(Icons.check,size: 25,color: tick_clr,),
                    Container(width: size.width*0.02,),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 15,
                endIndent: 20,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.06,right: size.width*0.22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Feature 2',style: TextStyle(
                      fontSize: size.height*0.015,
                      fontFamily: "Stf"
                    ),),
                    Icon(Icons.close,size: 25,color: crs_clr,),
                    Icon(Icons.check,size: 25,color: tick_clr,),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 15,
                endIndent: 20,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.06,right: size.width*0.22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Feature 3',style: TextStyle(
                        fontSize: size.height*0.015,
                        fontFamily: "Stf"
                    ),),
                    Icon(Icons.close,size: 25,color: crs_clr,),
                    Icon(Icons.check,size: 25,color: tick_clr,),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 15,
                endIndent: 20,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.06,right: size.width*0.22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Feature 4',style: TextStyle(
                        fontSize: size.height*0.015,
                        fontFamily: "Stf"
                    ),),
                    Icon(Icons.close,size: 25,color: crs_clr,),
                    Icon(Icons.check,size: 25,color: tick_clr,),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 15,
                endIndent: 20,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.06,right: size.width*0.22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Feature 5',style: TextStyle(
                        fontSize: size.height*0.015,
                        fontFamily: "Stf"
                    ),),
                    Icon(Icons.close,size: 25,color: crs_clr,),
                    Icon(Icons.check,size: 25,color: tick_clr,),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                indent: 15,
                endIndent: 20,
              ),
              Padding(
                padding:  EdgeInsets.only(left: size.width*0.06,right: size.width*0.22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Feature 6',style: TextStyle(
                        fontSize: size.height*0.015,
                        fontFamily: "Stf"
                    ),),
                    Icon(Icons.close,size: 25,color: crs_clr,),
                    Icon(Icons.check,size: 25,color: tick_clr,),
                  ],
                ),
              ),


            ],
          ),
          SizedBox(height:size.height*0.08,),
          CustomNextButton(text: 'Next', image: frwd_arrow, color1: signupclor_light, color2: signupclor_dark, onTap:  (){
          }),
       SizedBox(height: size.height*0.1,)
        ],
      ),
    );
  }
}
