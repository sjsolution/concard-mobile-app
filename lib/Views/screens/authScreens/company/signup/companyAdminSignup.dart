import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/authScreens/company/signup/aboutCompanySignup.dart';
import 'package:concard/Views/screens/authScreens/company/signup/companySignupHomeScreen.dart';
import 'package:concard/Views/widgets/customContainer.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/fieldText.dart';

class CompanyAdminSignup extends StatelessWidget {
  CompanyAdminSignup({Key? key}) : super(key: key);
  var controll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        // color: Colors.pink,

        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Who's the Admin",
              style: TextStyle(
                  fontSize: size.height * 0.02,
              fontFamily: "MBold"),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            FieldText(
              textInputType: TextInputType.text,
              hinttxt: 'Full name',
              pass: false,
              controller: controll,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            CustomConatiner(
              color2: primarygreen,
              color1: gradientgreen,
              txt: 'Position',
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            FieldText(
              textInputType: TextInputType.text,
              hinttxt: 'Email',
              pass: false,
              controller: controll,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CountryCodePicker(
                    onChanged: print,
                    padding: EdgeInsets.all(0),
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
                SizedBox(width: size.width*0.03,),
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
              textInputType: TextInputType.text,
              hinttxt: 'Password',
              pass: true,
              controller: controll,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            FieldText(
              textInputType: TextInputType.text,
              hinttxt: 'Confirm Password',
              pass: true,
              controller: controll,
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            CustomNextButton(
              text: 'Next',
              image: frwd_arrow,
              color1: signupclor_light,
              color2: signupclor_dark,
              onTap: () {
                print("4444");
                pageController.nextPage(duration: Duration(microseconds: 200), curve: Curves.bounceIn);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => AboutCompanySignup()));
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

}
