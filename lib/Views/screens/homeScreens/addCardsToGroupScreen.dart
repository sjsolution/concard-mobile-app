import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/contactsProfileViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddCardsToGroupScreen extends StatefulWidget {
  AddCardsToGroupScreen({Key? key}) : super(key: key);

  @override
  State<AddCardsToGroupScreen> createState() => _AddCardsToGroupScreenState();
}

String? isSelect;

class _AddCardsToGroupScreenState extends State<AddCardsToGroupScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
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
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: size.height * 0.02,
                        color: bckgrnd,
                      )),
                  Container(
                    child: Text(
                      'Add Cards',
                      style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "MBold",
                          color: bckgrnd),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(notify_icon),
                      SizedBox(width: size.width * 0.03),
                      CircleAvatar(
                        radius: size.height * 0.025,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREbaKw2V0KnOGHLPIg70pC1vakownhs8kl8A&usqp=CAU'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.13),
            height: size.height * 1.0,
            width: size.width,
            decoration: BoxDecoration(
                color: btnclr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.02),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>FollowingCardsScreen()));
                        },
                        child: Text(
                          'Reached Concards (22) ',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "Msemibold",
                              color: signupclor_dark),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        'All cards (23)',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            color: infocolor,
                            fontFamily: "Msemibold"),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.035,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  gradientgreen,
                                  primarygreen,
                                ]),
                            color: bckgrnd,
                            borderRadius: BorderRadius.circular(30)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Add',
                              style: TextStyle(
                                  color: bckgrnd,
                                  fontSize: size.height * 0.015,
                                  fontFamily: 'Msemibold'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height * 0.09,
                        width: size.width * 0.85,
                        child: TextFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Image.asset(
                              srch_icon,
                              color: signupclor_dark,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Search cards',
                            contentPadding: EdgeInsets.only(
                                top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle: TextStyle(
                                fontSize: size.width * 0.04, color: infocolor),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            sort_icon,
                            height: 20,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check,
                        size: size.height * 0.02,
                        color: signupclor_light,
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        '(1) Card Selected',
                        style: TextStyle(
                            fontSize: size.height * 0.018, fontFamily: "MBOld"),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.035,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  signupclor_light,
                                  signupclor_dark,
                                ]),
                            color: bckgrnd,
                            borderRadius: BorderRadius.circular(30)),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Select all',
                              style: TextStyle(
                                  color: bckgrnd,
                                  fontSize: size.height * 0.015,
                                  fontFamily: 'Msemibold'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ContactProfileViewScreen()));
                    },
                    child: Container(
                      height: size.height * 0.8,
                      width: size.width,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: size.height * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Radio(
                                  value: index.toString(),
                                  groupValue: isSelect,
                                  onChanged: (dynamic newValue) =>
                                      setState(() => isSelect = newValue),
                                  activeColor: signupclor_light,
                                  // selected: false,
                                ),
                                Container(
                                  child: ClipRRect(
                                    child: Image.asset(
                                      mycard_icon,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  height: size.height * 0.08,
                                  width: size.width * 0.25,
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Company Name',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "MBold"),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Msemibold",
                                          color: infocolor),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      'Concsectetuer adipiscing elit, sed fiam',
                                      style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          fontFamily: "Msemibold",
                                          color: infocolor),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
