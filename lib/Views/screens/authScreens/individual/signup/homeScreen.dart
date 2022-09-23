// import 'package:concard/Views/screens/authScreens/individual/signup/codeVerification.dart';
// import 'package:concard/Views/screens/authScreens/individual/signup/mobileVerification.dart';
// import 'package:concard/Views/screens/authScreens/individual/signup/basicDetail.dart';
// import 'package:concard/Views/widgets/signupAppbar.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class IndiSignupHomeScreen extends StatefulWidget {
//   const IndiSignupHomeScreen({Key? key}) : super(key: key);

//   @override
//   _IndiSignupHomeScreenState createState() => _IndiSignupHomeScreenState();
// }

// class _IndiSignupHomeScreenState extends State<IndiSignupHomeScreen> {
//   PageController pageController = PageController();
//   PageController _controller = new PageController();
//   var lis = [
//     Colors.red,
//     Colors.green,
//     Colors.purple,
//   ];
//   int sIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//         body: Stack(
//       children: [
//         Container(
//           height: size.height * 0.025,
//           width: size.width * 0.18,
//           decoration: BoxDecoration(
//               color: Colors.grey.withOpacity(0.15),
//               borderRadius: BorderRadius.circular(10)),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SmoothPageIndicator(
//               controller: _controller,
//               count: 3,
//               effect: WormEffect(),
//               onDotClicked: (index) => _controller.animateToPage(index,
//                   duration: Duration(milliseconds: 200),
//                   curve: Curves.bounceOut),
//               // axisDirection: Axis.horizontal,
//               // effect:  ScrollingDotsEffect(
//               //   spacing:  10.0,
//               //   radius:  4.0,
//               //   dotWidth:  7.0,
//               //   dotHeight:  7.0,
//               //   paintStyle:  PaintingStyle.fill,
//               //   strokeWidth:  1.1,
//               //   // dotColor: Colors.grey.withOpacity(0.25),
//               //   activeDotColor:  cIndex>=inde?cgreen:Colors.grey.withOpacity(0.25),
//             ),
//           ),
//         ),
//         PageView.builder(
//           itemCount: 3,
//           reverse: false,
//           physics:const NeverScrollableScrollPhysics(),
//           controller: pageController,
//           onPageChanged: (value) {
//             setState(() {
//               sIndex = value;
//             });
//           },
//           itemBuilder: (context, position) {
//             return sIndex == 0
//                 ? IndividualBasicDetail()
//                 : sIndex == 1
//                     ? const NumberVerification()
//                     : CodeVerification();
//           },
//         ),
//       ],
//     ));
//   }
// }
