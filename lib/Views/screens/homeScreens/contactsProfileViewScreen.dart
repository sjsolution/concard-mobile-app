import 'package:concard/Views/screens/homeScreens/addCardsToGroupScreen.dart';
import 'package:concard/Views/screens/homeScreens/editMyCardScreen.dart';
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:concard/Views/screens/homeScreens/reminder.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';

class ContactProfileViewScreen extends StatefulWidget {
  const ContactProfileViewScreen({Key? key}) : super(key: key);

  @override
  State<ContactProfileViewScreen> createState() =>
      _ContactProfileViewScreenState();
}

class _ContactProfileViewScreenState extends State<ContactProfileViewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool? addValue = false;
  bool? inviteValue = true;

  @override
  Widget build(BuildContext context) {
    double value = 3.5;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: size.height * 0.25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: [signupclor_light, signupclor_dark]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      top: size.height * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        more_icon,
                        height: 15,
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(drwrmyacunt_icon),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            notify_icon,
                          ),
                          SizedBox(
                            width:size.width*0.02
                          ),
                          InkWell(
                            onTap: (){
                              _moreModalBottomSheet(context);
                            },
                            child: Icon(Icons.more_vert,color: bckgrnd,))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => IndividualPremiumScreen()));
                      },
                      child: Container(
                        height: size.height * 0.04,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                            color: bckgrnd.withOpacity(0.1),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.04,
                            right: size.width * 0.01,
                          ),
                          child: Row(children: [
                            Image.asset(
                              premium_icon,
                              height: size.height * 0.04,
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            Text(
                              'Premium',
                              style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "MBold",
                                  color: bckgrnd),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'John Smith',
                              style: TextStyle(
                                  fontFamily: 'MBold',
                                  fontSize: size.height * 0.02,
                                  color: bckgrnd),
                            ),
                            Text(
                              'Lorem ipsum',
                              style: TextStyle(
                                  fontFamily: 'Stf',
                                  fontSize: size.height * 0.017,
                                  color: bckgrnd),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Image.asset(
                          safesheld_icon,
                          
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: addValue!,
            child: Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.2,
                  left: size.width * 0.04,
                  right: size.width * 0.05),
              height: size.height * 0.04,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primarygreen,
              ),
              child: Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.01, right: size.width * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      drwrmyacunt_icon,
                      height: size.height * 0.03,
                    ),
                    Text(
                      'Contrary to popular belief, Lorem Ipsum is not simply random\ntext.',
                      style: TextStyle(
                          fontSize: size.height * 0.01,
                          fontFamily: "Msemibold",
                          color: bckgrnd),
                    ),
                    GestureDetector(
                      child: Container(
                        height: size.height * 0.03,
                        width: size.width * 0.15,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'Add',
                            style: TextStyle(
                                fontFamily: "MBold",
                                fontSize: size.height * 0.015,
                                color: bckgrnd),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: inviteValue!,
            child: Container(
              margin: EdgeInsets.only(top: size.height * 0.2),
              height: size.height * 0.1,
              width: size.width,
              decoration: BoxDecoration(
                  color: primarygreen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    top: size.height * 0.01,
                    right: size.width * 0.04),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          drwrmyacunt_icon,
                          height: size.height * 0.04,
                        ),
                        Text(
                          'Contrary to popular belief, Lorem Ipsum is not simply random\ntext.',
                          style: TextStyle(
                              fontSize: size.height * 0.009,
                              fontFamily: "Msemibold",
                              color: bckgrnd),
                        ),
                        Container(
                          height: size.height * 0.03,
                          width: size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              'invite',
                              style: TextStyle(
                                  fontFamily: "MBold",
                                  fontSize: size.height * 0.015,
                                  color: bckgrnd),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.26),
            // height: size.height*0.8,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.1,
                      right: size.width * 0.14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          _switchaccountModalBottomSheet(context);
                        },
                        child: Image.asset(
                          switch_icon,
                          height: size.height * 0.03,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Container(
                          margin: EdgeInsets.only(right: size.width * 0.03),
                          child: Image.asset(
                            planner_icon,
                            height: size.height * 0.03,
                          )),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      SvgPicture.asset(
                        stylearrw_icon,
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: size.height * 0.33),
              // height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.04, right: size.width * 0.04),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Container(
                            height: size.height * 0.3,
                            width: size.width,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.04,
                                        right: size.width * 0.04),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Card',
                                          style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              fontFamily: 'MBold'),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        EditMyCardScreen()));
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                'Edit Card',
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.015,
                                                    fontFamily: 'Msemibold'),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.03,
                                              ),
                                              Image.asset(
                                                edit_icon,
                                                color: cgreen,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.025,
                                  ),
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        mycard_icon,
                                        height: size.height * 0.2,
                                        width: size.width * 0.85,
                                        fit: BoxFit.cover,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.41,
                                decoration: BoxDecoration(
                                    border: Border.all(color: signupclor_dark),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    'Profile file',
                                    style: TextStyle(
                                        fontFamily: 'MBold',
                                        fontSize: size.height * 0.018,
                                        color: signupclor_dark),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.43,
                                decoration: BoxDecoration(
                                    border: Border.all(color:signupclor_dark),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    'Brochure file',
                                    style: TextStyle(
                                        fontFamily: 'MBold',
                                        fontSize: size.height * 0.018,
                                        color: signupclor_dark),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                              _reviewModalBottomSheet(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color:gradientgreen),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.02,
                                        right: size.width * 0.01),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Center(
                                          child: Text(
                                            'Review',
                                            style: TextStyle(
                                                fontFamily: 'MBold',
                                                fontSize: size.height * 0.018,
                                                color: gradientgreen),
                                          ),
                                        ),
                                        Image.asset(star_icon,color: gradientgreen,),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: RatingBar.builder(
                                        itemSize: size.height * 0.02,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: primarygreen,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: Colors.black,
                                          fontFamily: 'Mbold'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Notes',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    color: Colors.black,
                                    fontFamily: 'Mbold'),
                              ),
                              InkWell(
                                onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>Reminderscreen()));

                                },
                                child: Container(
                                  height: size.height * 0.04,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(
                                     border:Border.all(color: gradientgreen),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          fontFamily: 'MBold',
                                          fontSize: size.height * 0.018,
                                          color: gradientgreen),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          InkWell(
                            onTap: (){
                            },
                            child: TextFormField(
                              maxLines: 3,
                              decoration: InputDecoration(
                                  fillColor: bckgrnd,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Text(
                                "product & Services",
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    color: Colors.black,
                                    fontFamily: 'Mbold'),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                "(12)",
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: primarygreen,
                                  fontFamily: 'Mbold',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.13,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.02,
                                  right: size.width * 0.02,
                                  top: size.height * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: btnclr,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                          'Buisness',
                                          style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height * 0.015),
                                        )),
                                        height: size.height * 0.04,
                                        width: size.width * 0.2,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: btnclr,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                          'Growth',
                                          style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height * 0.015),
                                        )),
                                        height: size.height * 0.04,
                                        width: size.width * 0.2,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: btnclr,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                          'Progress',
                                          style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height * 0.015),
                                        )),
                                        height: size.height * 0.04,
                                        width: size.width * 0.2,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: btnclr,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                          'Now',
                                          style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height * 0.015),
                                        )),
                                        height: size.height * 0.04,
                                        width: size.width * 0.15,
                                      ),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: btnclr,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                          'Progress',
                                          style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height * 0.015),
                                        )),
                                        height: size.height * 0.04,
                                        width: size.width * 0.2,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: btnclr,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Center(
                                            child: Text(
                                          'Now',
                                          style: TextStyle(
                                              fontFamily: "Msemibold",
                                              fontSize: size.height * 0.015),
                                        )),
                                        height: size.height * 0.04,
                                        width: size.width * 0.15,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.035,
                          ),
                          Text(
                            "About",
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.black,
                                fontFamily: 'Mbold'),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Container(
                            height: size.height * 0.13,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.04,
                                  top: size.height * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contrary to popular belief, Lorem Ipsum is not\nsimply random text. It has roots in a piece of\nclassical Latin literature from 45 BC, making it over\n2000 years old.',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Text(
                            "Social media",
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.black,
                                fontFamily: 'MBold'),
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.025,
                              ),
                              GestureDetector(
                                  child: Image.asset(circllinkedin_icon)),
                              SizedBox(
                                width: size.width * 0.035,
                              ),
                              Image.asset(twitterone_icon),
                              SizedBox(
                                width: size.width * 0.035,
                              ),
                              Image.asset(circlefb_icon),
                              SizedBox(
                                width: size.width * 0.035,
                              ),
                              Image.asset(instaicon_icon)
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Text(
                            "Added Time & Location",
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.black,
                                fontFamily: 'MBold'),
                          ),
                        
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                timer_icon,
                                color: signupclor_dark,
                                height: size.height * 0.03,
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                "Sat, 9th Apr 22, 02:30 pm",
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    color: Colors.black,
                                    fontFamily: 'Stf'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                locationarrow,
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                "Expo Dubai, UAE",
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    color: Colors.black,
                                    fontFamily: 'Stf'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Text(
                            "Groups",
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.black,
                                fontFamily: 'MBold'),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          InkWell(
                            onTap: (){
                            //  Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCardsToGroupScreen()));
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  grptwo_icon,
                                  height: size.height * 0.025,
                                ),
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Managers,",
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: Colors.black,
                                          fontFamily: 'Stf'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      "Favorites",
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: Colors.black,
                                          fontFamily: 'Stf'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            "Conmpany/ Team members",
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.black,
                                fontFamily: 'MBold'),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Container(
                            child: ListView.builder(
                                padding: EdgeInsets.all(0),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: size.width * 0.04),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: size.height * 0.03,
                                          backgroundImage: NetworkImage(
                                            "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                          ),
                                        ),
                                        Text(
                                          'Tomy jones',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: 'MBold'),
                                        ),
                                        Text(
                                          'Lorem ipsum',
                                          style: TextStyle(
                                              fontSize: size.height * 0.011,
                                              fontFamily: 'Msemibold',
                                              color: infocolor),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            height: size.height * 0.15,
                            width: size.width * 0.9,
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void _moreModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 0.4,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.04, right: size.width*0.04, top: size.height*0.02),
                      child: Row(
                        children: [
                          Text(
                            'More options',
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontFamily: 'Mbold'),
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close)),
                        ],
                      ),
                    ),
                    new ListTile(
                        leading: Image.asset(
                          group,
                          color: signupclor_dark,
                        ),
                        title: new Text(
                          'Groups',
                          style: TextStyle(
                              fontFamily: 'Msemibold',
                              fontSize: size.height * 0.015),
                        ),
                        onTap: () => {}),
                    new ListTile(
                      leading: SvgPicture.asset(emailtwo_icon),
                      title: new Text(
                        'Turn off notification',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: SvgPicture.asset(newcntct_icon),
                      title: new Text(
                        'Add to Contacts',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: SvgPicture.asset(notfications_icon),
                      title: new Text(
                        'Reminder',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: SvgPicture.asset(favourite_icon),
                      title: new Text(
                        'Add to Favorite',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  void _reviewModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 4,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  star_icon,
                                  color: cgreen,
                                ),
                                // height: size.height*0.1,
                                // width: size.width*0.15,
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              Text(
                                'Add Review',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Divider(
                            indent: 5,
                            endIndent: 10,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            child: RatingBar.builder(
                              itemSize: size.height * 0.05,
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: str_clr,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Divider(
                            indent: 5,
                            endIndent: 10,
                            thickness: 1,
                          ),
                          TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.withOpacity(0.1),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                hintText: 'Describe your review',
                                hintStyle: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Msemibold")),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: size.height * 0.06,
                            width: size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [signupclor_light, signupclor_dark]),
                              border: Border.all(color: Colors.grey),
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              // margin: EdgeInsets.only(left: size.width*0.04),
                              alignment: Alignment.center,
                              child: Text(
                                'Add review',
                                style: TextStyle(
                                    color: bckgrnd,
                                    fontSize: size.height * 0.018,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Stf'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

   void _switchaccountModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: size.height * 0.37,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Switch Card',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                             
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.close,
                                          size: size.height * 0.025)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.12,
                            child: ListView.builder(
                                itemCount: 1,
                                padding: EdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: size.height * 0.12,
                                    width: size.width * 0.9,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10),
                                        border: Border.all(
                                            color: gradientgreen),
                                        color: txtcolr.withOpacity(0.2)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.04,
                                          right: size.width * 0.04,
                                          top: size.height * 0.02),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: size.height * 0.03,
                                                backgroundImage: NetworkImage(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIyHJPjCfH88x39naBmI-xAytAcmffu_4lNg&usqp=CAU'),
                                              ),
                                              SizedBox(
                                                  width: size.width * 0.03),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: [
                                                  Text(
                                                    'Assem Yamak',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height *
                                                              0.018,
                                                      fontFamily: "MBold",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: size.height *
                                                          0.01),
                                                  Text(
                                                    'Operations Manager',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height *
                                                              0.015,
                                                      fontFamily: "Stf",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height: size.height *
                                                          0.01),
                                                  Text(
                                                    'Dynamic Oil Tools',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height *
                                                              0.015,
                                                      fontFamily: "Stf",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height:
                                                      size.height * 0.04,
                                                  width: size.width * 0.2,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color:
                                                            signupclor_dark),
                                                    color: txtcolr
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(20),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Currently in use',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height *
                                                                0.01,
                                                        fontFamily: "MBOld",
                                                        color:
                                                            signupclor_dark),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Container(
                            height: size.height * 0.12,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: gradientgreen),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'No other cards available',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: "Stf"),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
