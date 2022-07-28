import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/mobileVerification.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:concard/Views/widgets/signupAppbar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndividualDetail extends StatelessWidget {
  var controll = TextEditingController();
  // PageController controller= PageController();
  int cIndex=0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SignupAppbar(
                  text: 'Sign up',
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.18),
              height: size.height * 0.9,
              width: size.width,
              decoration: BoxDecoration(
                  color: bckgrnd,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Text(
                    'Enter the following \n  details to sign up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height*0.02,
                        fontFamily: 'Stf'),
                  ),
                  SizedBox(height: size.height*0.04,),
                  // Container(
                  //   height: size.height*0.025,
                  //   width: size. width*0.18,
                  //
                  //   decoration: BoxDecoration(
                  //       color: Colors.grey.withOpacity(0.15),
                  //       borderRadius: BorderRadius.circular(10)
                  //   ),
                  //   child:    Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: SmoothPageIndicator(
                  //       controller: controller,
                  //       count:  3,
                  //       axisDirection: Axis.horizontal,
                  //       effect:  ScrollingDotsEffect(
                  //         spacing:  10.0,
                  //         radius:  4.0,
                  //         dotWidth:  7.0,
                  //         dotHeight:  7.0,
                  //         paintStyle:  PaintingStyle.fill,
                  //         strokeWidth:  1.1,
                  //         // dotColor: Colors.grey.withOpacity(0.25),
                  //         activeDotColor:  cIndex>=inde?cgreen:Colors.grey.withOpacity(0.25),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  FieldText(
                      hinttxt: "First Name",
                      controller: controll,
                      textInputType: TextInputType.text,
                      pass: false),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  FieldText(
                      hinttxt: "Last Name",
                      controller: controll,
                      textInputType: TextInputType.text,
                      pass: false),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  FieldText(
                      hinttxt: "E-mail",
                      controller: controll,
                      textInputType: TextInputType.text,
                      pass: false),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(

                            child: CountryCodePicker(
                              padding: EdgeInsets.all(0),
                              onChanged: print,
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              // initialSelection: 'IT',
                              showFlag: false,
                              favorite: ['+961',],
                              textStyle: TextStyle(
                                  fontSize: size.height*0.018,
                                  color: txtcolr
                              ),
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              // alignLeft: true,
                            ),
                            height: size.height*0.05,
                            width: size.width*0.2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color:infocolor)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: size.width*0.02,),
                      Container(
                        height: size.height * 0.05,
                        width: size.width*0.6,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText:"Mobile number",
                              contentPadding:
                              EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                              hintStyle:
                              TextStyle(fontSize: size.height*0.015, color: infocolor,
                                  fontFamily: "Stf"),
                              border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  FieldText(
                      hinttxt: "Password",
                      controller: controll,
                      textInputType: TextInputType.text,
                      pass: true),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  FieldText(
                      hinttxt: "Confirm Password",
                      controller: controll,
                      textInputType: TextInputType.text,
                      pass: true),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  CustomNextButton(
                    text: "Next",
                    image: frwd_arrow,
                    color1: signupclor_light,
                    color2: signupclor_dark,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NumberVerification())),
                  ),
                  SizedBox(
                    height: size.height*0.03,
                  ),
                  Text("Let's Connect !",style: TextStyle(
                      letterSpacing: 2,
                    fontSize: size.height*0.015,
                    color: signupclor_light,
                    fontFamily: 'Stf'
                  ),)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
