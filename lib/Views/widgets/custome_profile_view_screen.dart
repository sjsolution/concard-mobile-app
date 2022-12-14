import 'package:concard/Controllers/indiviualController/profile_controller.dart';
import 'package:concard/Controllers/indiviualController/social_links_controller.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Models/Indiviuals/social_links_model.dart';
import 'package:concard/Models/Indiviuals/team_detail_model.dart';
import 'package:concard/Views/screens/authScreens/individual/Social/new_social_link.dart';
import 'package:concard/Views/screens/homeScreens/analyticsScreen.dart';
import 'package:concard/Views/screens/homeScreens/calenderScreen.dart';
import 'package:concard/Views/screens/homeScreens/companyProfileScreen.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:concard/Views/screens/homeScreens/editMyCardScreen.dart';
import 'package:concard/Views/screens/homeScreens/individualPremium/individualPremiumScreen.dart';
import 'package:concard/Views/screens/homeScreens/ratingReviewScreen.dart';
import 'package:concard/Views/screens/homeScreens/socialLinksScreen.dart';
import 'package:concard/Views/screens/homeScreens/upgradePremiumIndividual/updgratToPremiumIndividual.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';

class CustomProfileViewScreen extends StatefulWidget {
  const CustomProfileViewScreen({Key? key, required this.teamMembers})
      : super(key: key);
  final TeamMembers? teamMembers;
  @override
  State<CustomProfileViewScreen> createState() =>
      _CustomProfileViewScreenState();
}

bool? isShareProfile = false;

class _CustomProfileViewScreenState extends State<CustomProfileViewScreen> {
  AppProvider? appPro;
  @override
  void initState() {
    // TODO: implement initState
    appPro = Provider.of<AppProvider>(context, listen: false);
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMenuScreen(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      colors: [signupclor_light, signupclor_dark]),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //premium or drawer column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => _scaffoldKey.currentState!.openDrawer(),
                          child: Image.asset(
                            more_icon,
                            height: 15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => IndividualPremiumScreen()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            // margin: EdgeInsets.only(left: 10.0),
                            // padding: EdgeInsets.only(left: 07.0),
                            height: size.height * 0.05,
                            // width: size.width * 0.3,
                            decoration: BoxDecoration(
                                color: bckgrnd.withOpacity(0.1),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 3.0, bottom: 09.0),
                                child: Image.asset(
                                  premium_icon,
                                  // height: size.width * 0.07,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  'Premium',
                                  style: TextStyle(
                                      fontSize: size.height * 0.015,
                                      fontFamily: "MBold",
                                      color: bckgrnd),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    //profile show Column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: size.height * 0.035,
                            backgroundImage: NetworkImage(
                              widget.teamMembers!.image ??
                                  "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.teamMembers!.firstName ?? ''} ${widget.teamMembers!.lastName ?? ''}',
                          style: TextStyle(
                              fontFamily: 'MBold',
                              fontSize: size.height * 0.02,
                              color: bckgrnd),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(children: [
                          Text(
                            widget.teamMembers!.email ?? '',
                            style: TextStyle(
                                fontFamily: 'Stf',
                                fontSize: size.height * 0.017,
                                color: bckgrnd),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Container(
                                        margin: EdgeInsets.only(
                                            bottom: size.height * 0.1),
                                        child: Dialog(
                                          alignment:
                                              AlignmentDirectional.bottomCenter,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: btnclr,
                                            ),
                                            height: size.height * 0.25,
                                            width: size.width * 0.9,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.04,
                                                  right: size.width * 0.04,
                                                  top: size.height * 0.02),
                                              child: Column(
                                                children: <Widget>[
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                            width: size.width *
                                                                0.1),
                                                        Image.asset(
                                                          secureguard,
                                                          color: infocolor,
                                                        ),
                                                        // Spacer(),
                                                        GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Icon(
                                                              Icons.close,
                                                              size: 20,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  Text(
                                                    'Not Verified',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: "MBold",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  Text(
                                                    'This might discourage clients from contacting you.',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.014,
                                                      fontFamily: "Stf",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.02,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      _requirementsModalBottomSheet(
                                                          context);
                                                    },
                                                    child: Container(
                                                      height:
                                                          size.height * 0.04,
                                                      width: size.width * 0.5,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  signupclor_dark),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: btnclr),
                                                      child: Center(
                                                          child: Text(
                                                        'Check Requirements',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.018,
                                                            fontFamily: "MBOld",
                                                            color:
                                                                signupclor_dark),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));
                            },
                            child: Image.asset(
                              safesheld_icon,
                              color: infocolor,
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => Container(
                                      margin: EdgeInsets.only(
                                          bottom: size.height * 0.1),
                                      child: Dialog(
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        //this right here
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: btnclr,
                                          ),
                                          height: size.height * 0.25,
                                          width: size.width * 0.9,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width * 0.04,
                                                right: size.width * 0.04,
                                                top: size.height * 0.02),
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                          width:
                                                              size.width * 0.1),
                                                      SvgPicture.asset(
                                                        con_icon,
                                                        height:
                                                            size.height * 0.04,
                                                      ),
                                                      // Spacer(),
                                                      GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Icon(
                                                            Icons.close,
                                                            size: 20,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Text(
                                                  'Promote your Concard',
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.015,
                                                    fontFamily: "MBold",
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                Text(
                                                  'Make your card visible when people search on',
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.015,
                                                    fontFamily: "Stf",
                                                  ),
                                                ),
                                                Text(
                                                  'Concard or Google',
                                                  style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.015,
                                                    fontFamily: "Stf",
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.02,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: size.height * 0.05,
                                                    width: size.width * 0.5,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                signupclor_dark),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: btnclr),
                                                    child: Center(
                                                        child: Text(
                                                      'Go to Settings',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.018,
                                                          fontFamily: "MBOld",
                                                          color:
                                                              signupclor_dark),
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
                          },
                          child: Container(
                            height: size.height * 0.025,
                            width: size.width * 0.18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: bckgrnd),
                            ),
                            child: Center(
                              child: Text(
                                'Promote',
                                style: TextStyle(
                                    fontFamily: "Stf",
                                    fontSize: size.height * 0.015,
                                    color: bckgrnd),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //notification icon
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            notify_icon,
                          ),
                          const Text("")
                        ],
                      ),
                    ),
                    // SizedBox(
                    //     width: 1,
                    //   ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.23),
              // height: size.height*0.8,
              width: size.width,
              decoration: const BoxDecoration(
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
                        GestureDetector(
                            onTap: () {
                              _switchaccountModalBottomSheet(context);
                            },
                            child: Image.asset(
                              switch_icon,
                              height: size.height * 0.03,
                            )),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Container(
                            margin: EdgeInsets.only(right: size.width * 0.03),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const CalenderScreen()));
                                },
                                child: Image.asset(
                                  planner_icon,
                                  height: size.height * 0.03,
                                ))),
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
              margin: EdgeInsets.only(top: size.height * 0.3),
              // height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.02, right: size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Container(
                      height: size.height * 0.376,
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
                                  left: size.width * 0.02,
                                  right: size.width * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ' My Card',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: 'MBold'),
                                  ),
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (BuildContext context) =>
                                  //                 EditMyCardScreen()));
                                  //   },
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //         'Edit Card',
                                  //         style: TextStyle(
                                  //             fontSize: size.height * 0.015,
                                  //             fontFamily: 'Msemibold'),
                                  //       ),
                                  //       SizedBox(
                                  //         width: size.width * 0.03,
                                  //       ),
                                  //       Image.asset(
                                  //         edit_icon,
                                  //         color: cgreen,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            GestureDetector(
                                onTap: () {
                                  _cardInfoPopup(context);
                                },
                                //umar changed
                                child: cardWidget(
                                    context,
                                    widget.teamMembers!.id.toString(),
                                    widget.teamMembers!.firstName! +
                                        widget.teamMembers!.lastName!,
                                    widget.teamMembers!.address,
                                    widget.teamMembers!.mobileNumber,
                                    widget.teamMembers!.email,
                                    widget.teamMembers!.jobTitle,
                                    widget.teamMembers!.website))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         _comprofileModalBottomSheet(context);
                    //       },
                    //       child: Container(
                    //         height: size.height * 0.04,
                    //         width: size.width * 0.41,
                    //         decoration: BoxDecoration(
                    //             border: Border.all(color: signupclor_dark),
                    //             borderRadius: BorderRadius.circular(20)),
                    //         child: Center(
                    //           child: Text(
                    //             'Company Profile',
                    //             style: TextStyle(
                    //                 fontFamily: 'MBold',
                    //                 fontSize: size.height * 0.018,
                    //                 color: signupclor_dark),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         _brochfileModalBottomSheet(context);
                    //       },
                    //       child: Container(
                    //         height: size.height * 0.04,
                    //         width: size.width * 0.4,
                    //         decoration: BoxDecoration(
                    //             border: Border.all(color: signupclor_dark),
                    //             borderRadius: BorderRadius.circular(20)),
                    //         child: Center(
                    //           child: Text(
                    //             'Brochure',
                    //             style: TextStyle(
                    //                 fontFamily: 'MBold',
                    //                 fontSize: size.height * 0.018,
                    //                 color: signupclor_dark),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                          },
                          child: Row(
                            children: [
                              Text(
                                'Rating & Reviews',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    color: Colors.black,
                                    fontFamily: 'Msemibold'),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                size: 25,
                              ),
                            ],
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
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
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
                                  fontFamily: 'Msemibold'),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AnalyticsScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dashboard',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.black,
                                fontFamily: 'Msemibold'),
                          ),
                          Container(
                            height: size.height * 0.04,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                border: Border.all(color: gradientgreen),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(
                                    fontFamily: 'MBold',
                                    fontSize: size.height * 0.015,
                                    color: gradientgreen),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: bckgrnd,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: size.height * 0.11,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [prmryblue, darkblue])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '35',
                                        style: TextStyle(
                                            fontFamily: "Msemibold",
                                            color: bckgrnd,
                                            fontSize: size.height * 0.03),
                                      ),
                                      SvgPicture.asset(
                                        groupreach_icon,
                                        color: bckgrnd,
                                      )
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: size.height * 0.01,
                                      right: size.width * 0.02,
                                      left: size.width * 0.03),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: size.width * 0.02),
                                  child: Text(
                                    'Reached\nConcards',
                                    style: TextStyle(
                                        fontFamily: "Msemibold",
                                        color: bckgrnd,
                                        fontSize: size.height * 0.015),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.11,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [gradientgreen, primarygreen])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '24',
                                        style: TextStyle(
                                            fontFamily: "Msemibold",
                                            color: bckgrnd,
                                            fontSize: size.height * 0.03),
                                      ),
                                      SvgPicture.asset(
                                        downloading_icon,
                                        color: bckgrnd,
                                      )
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: size.height * 0.01,
                                      right: size.width * 0.02,
                                      left: size.width * 0.03),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: size.width * 0.017),
                                  child: Text(
                                    'Saved\nConcards',
                                    style: TextStyle(
                                        fontFamily: "Msemibold",
                                        color: bckgrnd,
                                        fontSize: size.height * 0.015),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: size.height * 0.11,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      signupclor_light,
                                      signupclor_dark
                                    ])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '12',
                                        style: TextStyle(
                                            fontFamily: "Msemibold",
                                            color: bckgrnd,
                                            fontSize: size.height * 0.03),
                                      ),
                                      SvgPicture.asset(
                                        favoutline_icon,
                                        color: bckgrnd,
                                        height: size.height * 0.04,
                                      )
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                      top: size.height * 0.01,
                                      right: size.width * 0.02,
                                      left: size.width * 0.03),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.only(left: size.width * 0.03),
                                  child: Text(
                                    'Favorites',
                                    style: TextStyle(
                                        fontFamily: "Msemibold",
                                        color: bckgrnd,
                                        fontSize: size.height * 0.015),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                              fontFamily: 'MBold'),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          "(0)",
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
                    // Container(
                    //   height: size.height * 0.15,
                    //   width: size.width,
                    //   decoration: BoxDecoration(
                    //     color: bckgrnd,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         left: size.width * 0.02,
                    //         top: size.height * 0.02,
                    //         right: size.width * 0.02),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   color: btnclr,
                    //                   borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Buisness',
                    //                 style: TextStyle(
                    //                     fontSize: size.height * 0.015,
                    //                     fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.22,
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   color: btnclr,
                    //                   borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Growth',
                    //                 style: TextStyle(
                    //                     fontSize: size.height * 0.015,
                    //                     fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.2,
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   color: btnclr,
                    //                   borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Progress',
                    //                 style: TextStyle(
                    //                     fontSize: size.height * 0.015,
                    //                     fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.2,
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   color: btnclr,
                    //                   borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Now',
                    //                 style: TextStyle(
                    //                     fontSize: size.height * 0.015,
                    //                     fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.15,
                    //             ),
                    //           ],
                    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         ),
                    //         SizedBox(
                    //           height: size.height * 0.01,
                    //         ),
                    //         Row(
                    //           children: [
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   color: btnclr,
                    //                   borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Progress',
                    //                 style: TextStyle(
                    //                     fontSize: size.height * 0.015,
                    //                     fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.2,
                    //             ),
                    //             SizedBox(
                    //               width: size.width * 0.02,
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(
                    //                   color: btnclr,
                    //                   borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Now',
                    //                 style: TextStyle(
                    //                     fontSize: size.height * 0.015,
                    //                     fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.15,
                    //             ),
                    //             SizedBox(
                    //               width: size.width * 0.02,
                    //             ),
                    //             Container(
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.2,
                    //               decoration: BoxDecoration(
                    //                   border: Border.all(color: gradientgreen),
                    //                   borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                 child: Text(
                    //                   'Add +',
                    //                   style: TextStyle(
                    //                       fontFamily: 'MBold',
                    //                       fontSize: size.height * 0.015,
                    //                       color: gradientgreen),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: size.height * 0.035,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              color: Colors.black,
                              fontFamily: 'MBold'),
                        ),
                      ],
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
                            left: size.width * 0.04, top: size.height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.teamMembers!.about}',
                              style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Msemibold"),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Social Media",
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              color: Colors.black,
                              fontFamily: 'MBold'),
                        ),
                        // GestureDetector(
                        //   onTap: () async {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (BuildContext context) =>
                        //                 CreateNewSocialLink()));
                        //   },
                        //   child: Container(
                        //     height: size.height * 0.04,
                        //     width: size.width * 0.2,
                        //     decoration: BoxDecoration(
                        //         border: Border.all(color: gradientgreen),
                        //         borderRadius: BorderRadius.circular(15)),
                        //     child: Center(
                        //       child: Text(
                        //         'Add +',
                        //         style: TextStyle(
                        //             fontFamily: 'MBold',
                        //             fontSize: size.height * 0.015,
                        //             color: gradientgreen),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    // Container(
                    //     // padding: EdgeInsets.all(8.0),
                    //     color: Colors.transparent,
                    //     height: size.height * 0.1,
                    //     // width: size.width,
                    //     child: FutureBuilder<SocialLinksModel?>(
                    //         future: SocialLinksController().getSocialLink(),
                    //         builder: (context, snapshot) {
                    //           if (snapshot.data == null) {
                    //             return const Text(
                    //                 "Something went wrong. Try again later");
                    //           } else if (snapshot
                    //               .data!.linksDataList!.isEmpty) {
                    //             return const Text("There is no liks added yet");
                    //           } else {
                    //             List<LinksDataList>? linksDataList =
                    //                 snapshot.data!.linksDataList;
                    //             return ListView.builder(
                    //               scrollDirection: Axis.horizontal,
                    //               itemCount: linksDataList!.length,
                    //               itemBuilder: ((context, index) {
                    //                 return Row(
                    //                   children: [
                    //                     Column(
                    //                         mainAxisAlignment:
                    //                             MainAxisAlignment.center,
                    //                         children: [
                    //                           CircleAvatar(
                    //                             radius: size.width * 0.06,
                    //                             backgroundColor:
                    //                                 signupclor_dark,
                    //                             child: CircleAvatar(
                    //                                 radius: size.width * 0.055,
                    //                                 backgroundColor:
                    //                                     Colors.white,
                    //                                 backgroundImage:
                    //                                     NetworkImage(
                    //                                         linksDataList[index]
                    //                                             .image!)),
                    //                           ),
                    //                           Text(
                    //                               "${linksDataList[index].title}",
                    //                               style: const TextStyle(
                    //                                 fontWeight: FontWeight.bold,
                    //                               ))
                    //                         ]),
                    //                     const SizedBox(width: 15.0),
                    //                   ],
                    //                 );
                    //               }),
                    //             );
                    //           }
                    //         })),

                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Conmpany",
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.black,
                                fontFamily: 'MBold',
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Image.asset(
                              hideeye_icon,
                              height: size.height * 0.04,
                            )
                          ],
                        ),
                        // Container(
                        //   height: size.height * 0.04,
                        //   width: size.width * 0.2,
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: gradientgreen),
                        //       borderRadius: BorderRadius.circular(15)),
                        //   child: Center(
                        //     child: Text(
                        //       'Add +',
                        //       style: TextStyle(
                        //           fontFamily: 'MBold',
                        //           fontSize: size.height * 0.015,
                        //           color: gradientgreen),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: size.width * 0.03),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                      "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                    ),
                                  ),
                                  Text(
                                    'Tomy jones',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: 'MBold'),
                                  ),
                                  Text(
                                    'Lorem ipsum',
                                    style: TextStyle(
                                        fontSize: size.height * 0.014,
                                        fontFamily: 'Msemibold'),
                                  ),
                                ],
                              ),
                            );
                          }),
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      height: size.height * 0.15,
                      width: size.width * 0.9,
                    ),
                    const SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(
    context,
    String? id,
    String? name,
    String? address,
    String? phoneNumber,
    String? email,
    String? jobTitle,
    String? website,
  ) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.29,
      // margin:const EdgeInsets.all(0.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                deccard,
                height: size.height * 0.30,
                fit: BoxFit.cover,
              )),
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: size.height * 0.018,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.047,
                    left: size.width * 0.02,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(con_icon),
                              const SizedBox(height: 10 //size.height * 0.015,
                                  ),
                              Text(
                                "CONCARD",
                                style: TextStyle(
                                  fontSize: size.height * 0.016,
                                  color: signupclor_dark,
                                  fontFamily: "Mbold",
                                  letterSpacing: 5,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              PrettyQr(
                                typeNumber: 4,
                                size: size.height * 0.06,
                                data: '$id',
                                errorCorrectLevel: QrErrorCorrectLevel.M,
                                roundEdges: true,
                              ),
                            ],
                          ),
                          SizedBox(width: size.width * 0.03),
                          Container(
                            height: size.height * 0.2,
                            width: 1,
                            color: cgreen,
                          ),
                          SizedBox(width: size.width * 0.08),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$name",
                                style: TextStyle(
                                  fontSize: size.height * 0.013,
                                  color: signupclor_dark,
                                  fontFamily: "Mbold",
                                ),
                              ),
                              Text(
                                "$jobTitle",
                                style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  color: signupclor_dark,
                                  fontFamily: "Stf",
                                ),
                              ),
                              const SizedBox(height: 8 //size.height * 0.01,
                                  ),
                              Row(
                                children: [
                                  Column(children: [
                                    SvgPicture.asset(location_icon),
                                  ]),
                                  const SizedBox(
                                    width: 4, //size.width * 0.015,
                                  ),
                                  Container(
                                    width: size.width * .35,
                                    child: Column(children: [
                                      Text(
                                        "$address",
                                        style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          color: signupclor_dark,
                                          fontFamily: "Mbold",
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(phonecall_icon),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Text(
                                    "$phoneNumber",
                                    style: TextStyle(
                                      fontSize: size.height * 0.015,
                                      color: signupclor_dark,
                                      fontFamily: "Mbold",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    email_icon,
                                    color: signupclor_dark,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Container(
                                    width: size.width * .35,
                                    child: Column(
                                      children: [
                                        Text(
                                          "$email",
                                          style: TextStyle(
                                            fontSize: size.height * 0.012,
                                            color: signupclor_dark,
                                            fontFamily: "Mbold",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(internet_icon),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Container(
                                    width: size.width * .35,
                                    child: Column(
                                      children: [
                                        Text(
                                          "$website",
                                          style: TextStyle(
                                            fontSize: size.height * 0.015,
                                            color: signupclor_dark,
                                            fontFamily: "Mbold",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: size.height * 0.02,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _cardInfoPopup(context) {
    var size = MediaQuery.of(context).size;
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //this right here
      child: Container(
        height: size.height * 0.5,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.04,
              right: size.width * 0.04,
              top: size.height * 0.02),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Card Info',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.018,
                        fontFamily: 'MBold'),
                  ),
                  // SizedBox(width: 70,),
                  // Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 20,
                      ))
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              PrettyQr(
                image: AssetImage(concard_icon),
                typeNumber: 4,
                size: size.height * 0.1,
                data: 'https://www.google.ru',
                errorCorrectLevel: QrErrorCorrectLevel.M,
                roundEdges: true,
                elementColor: signupclor_dark,
              ),
              SizedBox(height: size.height * 0.06),
              Row(
                children: [
                  SvgPicture.asset(internet_icon),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'www.company.com',
                    style: TextStyle(
                        fontFamily: "Msemibold", fontSize: size.height * 0.013),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.035,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            border: Border.all(color: signupclor_dark),
                            color: bckgrnd,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Visit',
                          style: TextStyle(
                              fontFamily: "Msemibold",
                              color: signupclor_dark,
                              fontSize: size.height * 0.013),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  SvgPicture.asset(location_icon),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Office 23, Floor 23, building 2, St 7,',
                        style: TextStyle(
                            fontFamily: "Msemibold",
                            fontSize: size.height * 0.011),
                      ),
                      Text(
                        'Al salama, Jeddah, Saudia Arabia ',
                        style: TextStyle(
                            fontFamily: "Msemibold",
                            fontSize: size.height * 0.011),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.035,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            border: Border.all(color: signupclor_dark),
                            color: bckgrnd,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10, left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                maparrw_icon,
                                height: size.height * 0.015,
                              ),
                              Text(
                                'Locate',
                                style: TextStyle(
                                    fontFamily: "Msemibold",
                                    color: signupclor_dark,
                                    fontSize: size.height * 0.013),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  SvgPicture.asset(usermail_icon),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'User.123@company.com',
                    style: TextStyle(
                        fontFamily: "Msemibold", fontSize: size.height * 0.013),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.035,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            border: Border.all(color: signupclor_dark),
                            color: bckgrnd,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Contact',
                          style: TextStyle(
                              fontFamily: "Msemibold",
                              color: signupclor_dark,
                              fontSize: size.height * 0.018),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  SvgPicture.asset(phonecall_icon),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    '+966 55 889 0098',
                    style: TextStyle(
                        fontFamily: "Stf", fontSize: size.height * 0.018),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: size.height * 0.035,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            border: Border.all(color: signupclor_dark),
                            color: bckgrnd,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Call',
                          style: TextStyle(
                              fontFamily: "Msemibold",
                              color: signupclor_dark,
                              fontSize: size.height * 0.018),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => errorDialog);
  }

  void _switchaccountModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Stack(
                children: [
                  Container(
                    height: size.height * 0.4,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: gradientgreen,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.01,
                          right: size.width * 0.04,
                          left: size.width * 0.04),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: size.height * 0.02,
                                width: size.width * 0.1,
                              ),
                              Text(
                                'Premium Feature',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: "Stf",
                                    color: bckgrnd),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              UpgradeToPremiumIndividualScreen()));
                                },
                                child: Container(
                                  height: size.height * 0.03,
                                  width: size.width * 0.18,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Upgrade',
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.05),
                    decoration: BoxDecoration(
                        color: bckgrnd,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    height: size.height * 0.35,
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
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Container(
                                      child: Image.asset(
                                    switchprem,
                                  )),
                                  const Spacer(),
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
                                    padding: const EdgeInsets.all(0),
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
                                                    backgroundImage:
                                                        const NetworkImage(
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
                                                  const Spacer(),
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
                                        '+ Add a new Card',
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
                  ),
                ],
              );
            },
          );
        });
  }

  void _comprofileModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd,
                    borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10))),
                height: size.height * 0.28,
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
                                'Company Profile',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,
                                      size: size.height * 0.025)),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compupload),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Upload New Profile',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Stf"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compdelete),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Delete Current Profile',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Stf"),
                              )
                            ],
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

  void _brochfileModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: size.height * 0.28,
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
                                'Company Brochure',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,
                                      size: size.height * 0.025)),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compupload),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Upload New Brochure',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Stf"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compdelete),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Delete Current Brochure',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Stf"),
                              )
                            ],
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

  void _requirementsModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd,
                    borderRadius: const BorderRadius.only(
                        topLeft: const Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: size.height * 0.34,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Requirements',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,
                                      size: size.height * 0.025)),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: size.height * 0.015,
                                fontFamily: "Stf"),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'Email Address',
                            style: TextStyle(
                                fontSize: size.height * 0.015,
                                fontFamily: "Stf"),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'Identification',
                            style: TextStyle(
                                fontSize: size.height * 0.015,
                                fontFamily: "Stf"),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Text(
                            'LinkedIn Profile',
                            style: TextStyle(
                                fontSize: size.height * 0.015,
                                fontFamily: "Stf"),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  border: Border.all(color: signupclor_dark),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Text(
                                  'Go to Settings',
                                  style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      fontFamily: "MBOld",
                                      color: signupclor_dark),
                                )),
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
}
