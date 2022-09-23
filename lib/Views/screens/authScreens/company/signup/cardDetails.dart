import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/company/singnin/compnaySignInScreen.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Constants/colors.dart';

class CardDetails extends StatelessWidget {
   CardDetails({Key? key}) : super(key: key);
  var controll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25,),
          Container(
            child:    Center(
              child: Text("Card details",
                style: TextStyle(
                    fontSize: size.height*0.028,
                    fontWeight: FontWeight.bold
                ),),
            ),
          ),
          SizedBox(height: 80,),
          Padding(
            padding: EdgeInsets.only(left: size.width*0.1,right: size.width*0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(visapay),
                Image.asset(masterpay),
                SvgPicture.asset(paypal),
                SvgPicture.asset(ipay),
              ],
            ),
          ),
          SizedBox(height: 30,),
          FieldText( validate: (String? value){
                        return '';
                      },hinttxt: 'Card number', controller: controll, textInputType: TextInputType.text, pass: false),
          SizedBox(height: size.height*0.02,),
          FieldText( validate: (String? value){
                        return '';
                      },hinttxt: 'Name on the card', controller: controll, textInputType: TextInputType.text, pass: false),
          SizedBox(height: size.height*0.02,),
          Padding(
            padding:  EdgeInsets.only(left: size.height*0.05,right: size.width*0.09),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.05,
                  width: size.width*0.38,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Expiry date',
                        contentPadding:
                        EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                        hintStyle: TextStyle(
                            fontSize: size.height*0.015, color: infocolor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
                Spacer(),
                Container(
                  height: size.height * 0.05,
                  width: size.width*0.38,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Security Code',
                        contentPadding:
                        EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                        hintStyle: TextStyle(
                            fontSize: size.width * 0.04, color: infocolor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height*0.1,),
          // CustomNextButton(text: 'Confirm', image: frwd_arrow, color1: signupclor_light, color2: signupclor_dark, onTap:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn())),)
        ],
      ),
    );
  }
}
