// import 'package:concard/Constants/colors.dart';
// import 'package:concard/Constants/images.dart';
// import 'package:concard/Views/screens/homeScreens/bottomNavBar.dart';
// import 'package:concard/Views/screens/homeScreens/homepge.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// class CompanySigninScreen extends StatefulWidget {
//   const CompanySigninScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CompanySigninScreen> createState() => _CompanySigninScreenState();
// }
//
// class _CompanySigninScreenState extends State<CompanySigninScreen> {
//   var controller = PageController();
//   bool? _checkbox = false;
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: bckgrnd,
//       body: SafeArea(
//           child: Column(
//           children: [
//             Container(
//             height: 150,
//             width: double.infinity,
//             // color: Colors.red,
//             child: Stack(
//               children: [
//                 SvgPicture.asset(
//                   arcimg,
//                   height: size.height * 0.2,
//                 ),
//                 Container(
//                     margin: EdgeInsets.only(
//                         top: size.height * 0.03, left: size.height * 0.04),
//                     child: Image.asset(
//                       more_icon,
//                     ))
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: ListView(
//               children: [
//                 Container(
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: size.width * 0.05,
//                         right: size.width * 0.05,
//                         top: size.height * 0.02),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Sign In",
//                           style: TextStyle(
//                               fontSize: size.height * 0.025,
//                               fontFamily: "MBold",
//                               color: gradientgreen),
//                         ),
//                         SizedBox(
//                           height: size.height * 0.04,
//                         ),
//                         Container(
//                           height: size.height * 0.055,
//                           width: size.width*0.85,
//                           child: TextFormField(
//                             maxLines: 1,
//                             decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: gradientgreen)),
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.circular(30),
//                                     borderSide: BorderSide(
//                                         color: gradientgreen)),
//                                 prefixIcon: Image.asset(
//                                   email_icon,
//                                   color: Colors.grey,
//                                 ),
//                                 hintText: 'E-mail',
//                                 contentPadding: EdgeInsets.only(
//                                     top: 0.0,
//                                     left: 22.0,
//                                     bottom: 2.0),
//                                 hintStyle: TextStyle(
//                                   fontSize: size.height*0.015,
//                                     fontFamily: "Msemibold",
//                                     color: infocolor)),
//                           ),
//                         ),
//                         SizedBox(
//                           height: size.height * 0.04,
//                         ),
//                         Container(
//                           height: size.height * 0.055,
//                           width: size.width*0.85,
//                           child: TextFormField(
//                             maxLines: 1,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.circular(30),
//                                   borderSide: BorderSide(
//                                       color: gradientgreen),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.circular(30),
//                                   borderSide: BorderSide(
//                                       color: gradientgreen),
//                                 ),
//                                 prefixIcon: Image.asset(
//                                   paswrd_icon,
//                                   color: Colors.grey,
//                                 ),
//                                 hintText: 'Password',
//                                 contentPadding: EdgeInsets.only(
//                                     top: 0.0,
//                                     left: 22.0,
//                                     bottom: 2.0),
//                                 hintStyle: TextStyle(
//                                   fontSize: size.height*0.015,
//                                     fontFamily: "Msemibold",
//                                     color: infocolor)),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(right: size.width*0.07),
//                           child: Row(
//                             children: [
//                               Checkbox(
//                                 activeColor: btnclr,
//                                 checkColor: signupclor_dark,
//                                 value: _checkbox,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _checkbox = value;
//                                     setState(() {});
//                                     print(value);
//                                   });
//                                 },
//                               ),
//                               Text(
//                                 'Remember',
//                                 style: TextStyle(
//                                     fontSize: size.height * 0.015,
//                                     fontFamily: "Stf",
//                                     color: infocolor),
//                               ),
//                               Spacer(),
//                               Text(
//                                 'Forgot Password?',
//                                 style: TextStyle(
//                                     fontSize: size.height * 0.015,
//                                     fontFamily: "Stf",
//                                     color: signupclor_dark),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: size.height*0.1,),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                         left: size.width * 0.01,
//                         right: size.width * 0.01),
//                     height: size.width * 0.8,
//                     width: size.width,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         gradient: LinearGradient(
//                             begin: Alignment.topLeft,
//                             end: Alignment.topRight,
//                             colors: [gradientgreen, primarygreen])),
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                           left: size.width * 0.05,
//                           right: size.width * 0.04,
//                           top: size.height * 0.05),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Device ID",
//                             style: TextStyle(
//                                 fontSize: size.height * 0.025,
//                                 fontFamily: "MBold",
//                                 fontWeight: FontWeight.bold,
//                                 color: bckgrnd),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.03,
//                           ),
//                           Text(
//                             "Your company Admin will need your\ndevice ID to authorize your usage of\nConCard Business123456789",
//                             style: TextStyle(
//                                 fontFamily: "Msemibold",
//                                 fontSize: size.height * 0.02,
//                                 color: bckgrnd),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.02,
//                           ),
//                           Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 height: size.height * 0.05,
//                                 width: size.width * 0.4,
//                                 decoration: BoxDecoration(
//                                     boxShadow: [
//                                       BoxShadow(
//                                           // spreadRadius: 8,
//                                           blurRadius: 15,
//                                           offset: Offset(0, 5))
//                                     ],
//                                     borderRadius:
//                                         BorderRadius.circular(20),
//                                     color: signupclor_light),
//                                 child: Center(
//                                   child: Text(
//                                     'Send via E-mail',
//                                     style: TextStyle(
//                                         fontSize: size.height * 0.02,
//                                         fontFamily: "Msemibold",
//                                         color: bckgrnd),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: size.height * 0.05,
//                                 width: size.width * 0.4,
//                                 decoration: BoxDecoration(
//                                     boxShadow: [
//                                       BoxShadow(
//                                           // spreadRadius: 8,
//                                           blurRadius: 15,
//                                           offset: Offset(0, 5))
//                                     ],
//                                     borderRadius:
//                                         BorderRadius.circular(20),
//                                     color: bckgrnd),
//                                 child: Center(
//                                   child: Text(
//                                     'Cancel',
//                                     style: TextStyle(
//                                         fontSize: size.height * 0.02,
//                                         fontFamily: "Msemibold",
//                                         color: signupclor_dark),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           // SizedBox(height: size.height*0.01,),
//                           Row(
//                             mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                             children: [
//                               SmoothPageIndicator(
//                                 controller: controller,
//                                 count: 4,
//                                 axisDirection: Axis.horizontal,
//                                 effect: ExpandingDotsEffect(
//                                   spacing: 8.0,
//                                   dotWidth: 10.0,
//                                   dotHeight: 10.0,
//                                   paintStyle: PaintingStyle.fill,
//                                   strokeWidth: 1.5,
//                                   dotColor: bckgrnd.withOpacity(0.3),
//                                   activeDotColor: bckgrnd,
//                                 ),
//                               ),
//                               Container(
//                                 height: size.height * 0.1,
//                                 child: FloatingActionButton(
//                                   onPressed: () {
//                                     Navigator.pushAndRemoveUntil(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (BuildContext context) => (),
//                                       ),
//                                           (route) => false,
//                                     );
//                                   },
//                                   child: SvgPicture.asset(
//                                     frwd_arrow,
//                                     color: signupclor_dark,
//                                   ),
//                                   backgroundColor: bckgrnd,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           )
//           ],
//         )),
//     );
//   }
// }
