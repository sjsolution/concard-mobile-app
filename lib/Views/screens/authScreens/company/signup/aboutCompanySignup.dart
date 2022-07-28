import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/customContainer.dart';
import 'companySignupHomeScreen.dart';

class AboutCompanySignup extends StatelessWidget {
  const AboutCompanySignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25,),
          Text("About the Company",
            style: TextStyle(
                fontSize: size.height*0.02,
                fontFamily: "MBold"
            ),),
          SizedBox(height: size.height*0.07,),
          Container(
            height: size.height * 0.05,
            width: size.width*0.8,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'company',
                  contentPadding:
                  EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                  hintStyle:
                  TextStyle(fontSize: size.height*0.015, color:infocolor,
                  fontFamily: "Stf"),
                  suffixIcon: Image.asset(office,),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
            ),
          ),
          SizedBox(height: size.height*0.02,),
          Container(
            height: size.height * 0.05,
            width: size.width*0.8,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Website',
                  contentPadding:
                  EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                  hintStyle:
                  TextStyle(fontSize: size.height*0.015, color: infocolor,
                  fontFamily: "Stf"),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("(www./ http./https)",
                    style: TextStyle(
                      fontFamily: "Stf",
                      fontSize: size.height*0.015,
                      color: infocolor
                    ),),
                  ),
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
            ),
          ),
          SizedBox(height: size.height*0.02,),
          CustomConatiner(color1: txtcolr, txt: 'Company field / industry', color2: cgreen,),
          SizedBox(height: size.height*0.02,),
          CustomConatiner(color1: txtcolr, txt: 'Employees number', color2: cgreen,),
          SizedBox(height: size.height*0.02,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      txtcolr,
                      cgreen
                    ]
                ),
              ),
              height: size.height*0.05,
              width: size.width*0.8,
              child: Padding(
                padding: EdgeInsets.only(left:size.width*0.03,right: size.width*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(office,color: Colors.white,),
                    SizedBox(width: 6,),
                    Text('Branches number',style: TextStyle(
                        fontSize: size.height*0.015,
                        color: Colors.white,
                      fontFamily: "Stf"
                    ),),
                    Spacer(),
                    Image.asset(downarrow_icon,color: bckgrnd,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: size.height*0.02,),
          CustomConatiner(txt: 'Headquarter locations', color1: txtcolr, color2: cgreen),
          SizedBox(height: size.height*0.02,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    txtcolr,
                    cgreen
                  ]
              ),
            ),
            height: size.height*0.05,
            width: size.width*0.8,
            child: Padding(
              padding: EdgeInsets.only(left:size.width*0.03,right: size.width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(group,color: Colors.white,),
                  SizedBox(width: 6,),
                  Text('Branches number',style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                  ),),
                  Spacer(),
                  Image.asset(downarrow_icon,color: bckgrnd,)
                ],
              ),
            ),
          ),
          SizedBox(height: size.height*0.07,),
          CustomNextButton(text: 'Next', image: frwd_arrow, color1: signupclor_light, color2: signupclor_dark, onTap: (){
            print("4444");
            pageController.nextPage(duration: Duration(microseconds: 200), curve: Curves.bounceIn);
          }),
          SizedBox(height: size.height*0.1,)
        ],
      ),
    );
  }
}
