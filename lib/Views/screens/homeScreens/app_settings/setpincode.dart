import 'package:concard/Constants/Colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/setpincodeTwo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class Setpincodescreen extends StatefulWidget {
  const Setpincodescreen({Key? key}) : super(key: key);

  @override
  State<Setpincodescreen> createState() => _SetpincodescreenState();
}

class _SetpincodescreenState extends State<Setpincodescreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: [signupclor_light, signupclor_dark]),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: size.height * 0.02,
                      color: bckgrnd,
                    ),
                  ),
                  Text(
                    'Set pin Code',
                    style: TextStyle(
                      fontSize: size.height * 0.020,
                      color: bckgrnd,
                      fontFamily: 'MBold',
                    ),
                  ),
                  Container(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.13),
            // height: size.height*0.8,
            width: size.width,
            decoration: BoxDecoration(
                color: btnclr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Image.asset(
                    setpindata,
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    height: size.height * 0.050,
                  ),
                  Text(
                    ' Protect your date with Pin lock',
                    style: TextStyle(
                        fontSize: size.height * 0.018, fontFamily: 'MBold'),
                  ),
                  SizedBox(
                    height: size.height * 0.050,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.15, right: size.width*0.15),
                    child: Container(
                      child: PinCodeTextField(
                          animationType: AnimationType.fade,
                          enableActiveFill: true,
                          keyboardType: TextInputType.number,
                          controller: _controller,
                          appContext: context,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 50,
                            fieldWidth: 40,
                            borderRadius: BorderRadius.circular(10),
                            activeFillColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            disabledColor: Colors.white,
                            activeColor: Colors.white,
                            selectedColor: Colors.white,
                            selectedFillColor: Colors.white,
                            errorBorderColor: crs_clr,
                            inactiveColor: Colors.white,
                          ),
                          length: 4,
                          onChanged: (value) {
                            // _controller.clear();
                          }),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.030,
                  ),
                  Text(
                    'Enter your 4 digit pin code',
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      fontFamily: 'Mmedium',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SetpincodeTwoscreen())));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.3),
                        height: size.height * 0.06,
                        width: size.width * 1.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [
                              signupclor_light,
                              signupclor_dark,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: bckgrnd,
                              fontFamily: 'MBold',
                              fontSize: size.height * 0.020,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
