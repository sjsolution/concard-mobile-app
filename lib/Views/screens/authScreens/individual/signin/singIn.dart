import 'package:concard/Controllers/Authentication/authentication.dart';
import 'package:concard/Controllers/Authentication/phone_number_verification.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/individual/signin/forgetPassword.dart';
import 'package:concard/Views/screens/homeScreens/bottomNavBar.dart';
import 'package:concard/Views/screens/homeScreens/companyProfileScreen.dart';
import 'package:concard/Views/screens/homeScreens/homepge.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:concard/Views/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Constants/colors.dart';
import '../../../../../Constants/images.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? isSelected;
  RegExp? regex;
  var emailControll = TextEditingController();
  var passwordControll = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _loadUserEmailPassword();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                              begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [primaryblue, primarycolor, prmryblue, primarygreen])),
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.07),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              con_icon,
                              height: size.height * 0.1,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              'C O N C A R D',
                              style: TextStyle(color: Colors.white, fontSize: size.height * 0.02, fontFamily: "Mbold"),
                            ),
                            Text(
                              "Now You're Connected",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.015,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 210),
                  // height: size.height * 0.7,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(fontSize: size.height * 0.025, fontFamily: "Msemibold", color: txtcolr),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        field(emailControll, Image.asset(email_icon), 'Email'),
                        const SizedBox(
                          height: 20,
                        ),
                        field(
                            passwordControll,
                            Image.asset(
                              paswrd_icon,
                              height: size.height * 0.02,
                            ),
                            'Password'),

                        // SizedBox(
                        //   height: size.height * 0.09,
                        //   width: size.width * 0.85,
                        //   child: TextFormField(
                        //     controller: passwordControll,
                        //     validator: (String? value) {
                        //       // String pattern = r'^[A-Za-z0-9]*$';
                        //       // regex = RegExp(pattern);
                        //       if (value!.isEmpty) {
                        //         return "Enter password";
                        //       }
                        //       // else if (!value.contains("@gmail.com")) {
                        //       //   return 'Enter Valid email';
                        //       // }

                        //       return null;
                        //     },
                        //     obscureText: true,
                        //     maxLines: 1,
                        //     decoration: InputDecoration(
                        //         contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                        //         hintStyle: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold", color: infocolor),
                        //         prefixIcon: Image.asset(
                        //           paswrd_icon,
                        //           color: Colors.grey,
                        //         ),
                        //         hintText: 'Password',
                        //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.09),
                          child: Row(
                            children: [
                              Checkbox(
                                  // checkColor: Colors.white,
                                  tristate: true,
                                  fillColor: MaterialStateProperty.all(signupclor_dark),
                                  value: isSelected,
                                  shape: const CircleBorder(),
                                  onChanged: _handleRemeberme),
                              Text(
                                'Remember me',
                                style: TextStyle(fontSize: size.height * 0.015, color: infocolor, fontFamily: "Msemibold"),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ForgetPassword()));
                                },
                                child: Text(
                                  'Forget password?',
                                  style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold", color: txtcolr),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.3,
                        ),
                        GestureDetector(
                            onTap: () async {
                              if (!context.read<AppProvider>().isLoading!) {
                                if (formKey.currentState!.validate()) {
                                  context.read<AppProvider>().setLoadingTrue();
                                  loaderWidget(context, size);
                                  var result = await AuthenticationClass().login(emailControll.text.trim(), passwordControll.text.trim());
                                  context.read<AppProvider>().setLoadingFalse();
                                  // context.read<AppProvider>().setIndividualProfileModelProfileObj = result;
                                  Navigator.pop(context);
                                  if (result != null) {
                                    // emailControll.clear();
                                    // passwordControll.clear();
                                    if (result['user_type'].toString() == "1") {
                                      //Individual Member Screen
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (BuildContext context) => BottomNavigationScreen()),
                                          (Route<dynamic> route) => false);
                                    } else {
                                      //Company HomePage
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (BuildContext context) => const CompanyProfileScreen()),
                                          (Route<dynamic> route) => false);
                                    }
                                  }
                                }
                              }
                            },
                            child: CustomButton(
                                text: 'Sign in', color1: signupclor_light, color2: signupclor_dark, textcolor1: bckgrnd, textcolor2: bckgrnd)),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                          "Now You're Connected !",
                          style: TextStyle(fontSize: size.height * 0.015, color: signupclor_dark, fontFamily: 'Stf'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          context.read<AppProvider>().isLoading!
              ? Center(
                  child: SpinKitDualRing(
                  color: primarygreen,
                ))
              : const SizedBox()
        ],
      ),
    );
  }

  field(TextEditingController controller, Image image, String? label) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.09,
      width: size.width * 0.85,
      child: TextFormField(
        controller: controller,
        validator: (String? value) {
          // String pattern = r'^[A-Za-z0-9]*$';
          // regex = RegExp(pattern);
          if (value!.isEmpty) {
            return "Enter email";
          }
          // else if (!value.contains("@gmail.com")) {
          //   return 'Enter Valid email';
          // }

          return null;
        },
        maxLines: 1,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
            hintStyle: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold", color: infocolor),
            prefixIcon: image,
            hintText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  void _handleRemeberme(bool? value) {
    // print("Handle Rember Me");
    isSelected = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value!);
        prefs.setString('email', emailControll.text);
        prefs.setString('password', passwordControll.text);
      },
    );
    setState(() {
      isSelected = value;
      //  print('..........'+value.toString());
      // print('email...............'+emailControll.text);
      // print('pswrd============'+ passwordControll.text);
    });
  }

  void _loadUserEmailPassword() async {
    // print("Load Email");EE

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("email");
      var password = prefs.getString("password");
      var remeberMe = prefs.getBool("remember_me") ?? false;

      // print('..........'+remeberMe.toString());
      // print('email...............'+email);
      // print('pswrd============'+password);
      if (remeberMe) {
        setState(() {
          isSelected = true;
        });
        emailControll.text = email!;
        passwordControll.text = password!;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
