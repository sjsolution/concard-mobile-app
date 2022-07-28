import 'dart:async';

import 'package:concard/Views/screens/authScreens/individual/signin/singIn.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import '../../../../widgets/customButton.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool? isSelected=false;

  int _Counter=20;

  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  void startTimer(){
    _Counter=20;
    _timer=Timer.periodic(Duration(seconds: 2), (timer) {
      if( _Counter > 0 ) {
        setState(() {
          _Counter--;
        });
      }  else {
        _timer!.cancel();
      }

    });
  }

  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [

                Container(
                  alignment: Alignment.center,
                  height: size.height * 0.4,
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
                          ])),
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.07),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: size.width*0.04),
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.arrow_back_ios,color: Colors.white,size: size.height*0.025,)),
                        ),
                        SvgPicture.asset(con_icon,height: size.height*0.1,),
                        SizedBox(height: size.height*0.01,),
                        Text(
                          'C O N C A R D',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height*0.02,
                              fontFamily: "Mbold"),
                        ),
                        Text(
                          "Now You're Connected",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height*0.015,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 230),
              height: size.height*0.7,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)
                  )
              ),
              child: Column(
                children: [
                  SizedBox(height: size.height*0.06,),
                  Text('The code has been sent to your email',style: TextStyle(
                      fontSize: size.height*0.02,
                      fontFamily: "Msemibold",
                      color: txtcolr
                  ),),
                  SizedBox(height: size.height*0.08,),
                  FieldText(hinttxt: 'Enter Code', controller: controller, textInputType: TextInputType.phone, pass: false),
                  SizedBox(height: size.height*0.03,),
                  FieldText(hinttxt: 'New Password', controller: controller, textInputType: TextInputType.phone, pass: false),
                  SizedBox(height: size.height*0.03,),
                  FieldText(hinttxt: 'Confirm New Password', controller: controller, textInputType: TextInputType.phone, pass: false),
                  SizedBox(height: size.height*0.03,),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.11,right: size.width*0.11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$_Counter:00',
                          style: TextStyle(
                              fontSize: size.height*0.015,
                              color: signupclor_dark,
                              fontFamily: "Stf"
                          ),),
                        Text('Resend Code',
                          style: TextStyle(
                              fontSize: size.height*0.015,
                              color: signupclor_dark,
                              fontFamily: "Stf"
                          ),),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.09),
                  //   child: Row(
                  //     children: [
                  //       Checkbox(
                  //         // checkColor: Colors.white,
                  //         fillColor: MaterialStateProperty.all(signupclor_dark),
                  //         value: isSelected,
                  //         shape: CircleBorder(),
                  //         onChanged: (bool? value) {
                  //           setState(() {
                  //             isSelected = value!;
                  //           });
                  //         },
                  //       ),
                  //       Text('Remember me',
                  //         style: TextStyle(
                  //             fontSize: size.height*0.015,
                  //             color: infocolor,
                  //             fontFamily: "Msemibold"
                  //         ),),
                  //       Spacer(),
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.of(context).push(MaterialPageRoute(
                  //               builder: (BuildContext context) => SignIn()));
                  //         },
                  //         child: Text('Forget password?',
                  //           style: TextStyle(
                  //               fontSize: size.height*0.015,
                  //               fontFamily: "Msemibold",
                  //               color: txtcolr
                  //           ),),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: size.height*0.18,),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => SignIn(),
                          ),
                        );
                      },

                      child: CustomButton(text: 'Reset', color1: signupclor_light, color2: signupclor_dark, textcolor1: bckgrnd, textcolor2: bckgrnd)),
                  SizedBox(height: size.height*0.02,),
                  Text(
                    "Now You're Connected !",
                    style: TextStyle(
                      letterSpacing: 2,
                        fontSize: size.height*0.015,
                        color: signupclor_dark,
                        fontFamily: 'Stf'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
