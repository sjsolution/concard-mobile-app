import 'package:concard/Controllers/indiviualController/social_links_controller.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Controllers/providers/about_provider.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Models/Indiviuals/social_links_model.dart';
import 'package:concard/Views/screens/authScreens/individual/Social/new_social_link.dart';
import 'package:concard/Views/screens/homeScreens/analyticsScreen.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:concard/Views/screens/homeScreens/editMyCardScreen.dart';
import 'package:concard/Views/screens/homeScreens/individualPremium/individualPremiumScreen.dart';
import 'package:concard/Views/screens/homeScreens/ratingReviewScreen.dart';
import 'package:concard/Views/screens/homeScreens/upgradePremiumIndividual/updgratToPremiumIndividual.dart';
import 'package:concard/Views/screens/web_pages/web_profile_page.dart';
import 'package:concard/google_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:concard/Views/widgets/add_product_and_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import '../../../Controllers/OthersController/general_method.dart';
import '../../../Controllers/OthersController/url_launcher_class.dart';
import 'app_settings/appSettingsScreen.dart';
import 'calenderScreen.dart';
import 'cardsScrens/cardsBottomBarScreen.dart';
import 'notifications/notificationsScreen.dart';

class PersonalProfileViewScreen extends StatefulWidget {
  const PersonalProfileViewScreen({Key? key}) : super(key: key);

  @override
  State<PersonalProfileViewScreen> createState() => _PersonalProfileViewScreenState();
}

bool? isShareProfile = false;

class _PersonalProfileViewScreenState extends State<PersonalProfileViewScreen> {
  AppProvider? appPro;
  @override
  void initState() {
    appPro = Provider.of<AppProvider>(context, listen: false);
    getProductAndServices();
    super.initState();
  }

  getProductAndServices() async {
    appPro!.getProductAndServices();
    setState(() {});
  }
void _sendEmail() async {
  const email = 'mailto:example@example.com';
  if (await canLaunch(email)) {
    await launch(email);
  } else {
    throw 'Could not launch $email';
  }
}


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      
      // bottomNavigationBar: BottomNavigationScreen(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // InkWell(
            //     onTap: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (_) => IndividualPremiumScreen()));
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.only(top: size.height * 0.1),
            //       child: Container(
            //         alignment: Alignment.center,
            //         // margin: EdgeInsets.only(left: 10.0),
            //         // padding: EdgeInsets.only(left: 07.0),
            //         height: size.height * 0.05,
            //         width: size.width * 0.3,
            //         decoration: BoxDecoration(
            //             color: bckgrnd.withOpacity(0.1),
            //             borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
            //         child: Row(children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left: 3.0, bottom: 09.0),
            //             child: Image.asset(
            //               premium_icon,
            //               // height: size.width * 0.07,
            //             ),
            //           ),
            //           SizedBox(
            //             width: size.width * 0.01,
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(right: 8.0),
            //             child: Text(
            //               'Premium',
            //               style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: bckgrnd),
            //             ),
            //           ),
            //         ]),
            //       ),
            //     )),
            Container(
              height: size.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [signupclor_light, signupclor_dark]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //premium or drawer column
                  Expanded(
                    flex: 1,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //drawer opening icon
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            // alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: size.height * 0.06, left: 10),
                            child:Icon(Icons.arrow_back_ios,color: bckgrnd,size: size.height*0.025,)
                          ),
                        ),
                        //Premium Container
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(context, MaterialPageRoute(builder: (_) => IndividualPremiumScreen()));
                        //   },
                        //   child: Container(
                        //     alignment: Alignment.center,
                        //     // margin: EdgeInsets.only(left: 10.0),
                        //     // padding: EdgeInsets.only(left: 07.0),
                        //     height: size.height * 0.05,
                        //     // width: size.width * 0.3,
                        //     decoration: BoxDecoration(
                        //         color: bckgrnd.withOpacity(0.1),
                        //         borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                        //     child: Row(children: [
                        //       Padding(
                        //         padding: const EdgeInsets.only(left: 3.0, bottom: 09.0),
                        //         child: Image.asset(
                        //           premium_icon,
                        //           // height: size.width * 0.07,
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: size.width * 0.01,
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(right: 8.0),
                        //         child: Text(
                        //           'Premium',
                        //           style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: bckgrnd),
                        //         ),
                        //       ),
                        //     ]),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  //profile show Column
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: size.height * 0.035,
                              backgroundImage: NetworkImage(
                                appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileImage != null
                                    ? appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileImage.toString()
                                    : "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.firstName ?? ''} ${appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.lastName ?? ''}',
                              style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.02, color: bckgrnd),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Text(
                                  // appPro!.individualProfileModel!.data!.user!.email ?? '',
                                  appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.email.toString() ?? '',
                                  style: TextStyle(fontFamily: 'Stf', fontSize: size.height * 0.017, color: bckgrnd),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => Container(
                                              margin: EdgeInsets.only(bottom: size.height * 0.1),
                                              child: Dialog(
                                                alignment: AlignmentDirectional.bottomCenter,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                    color: btnclr,
                                                  ),
                                                  height: size.height * 0.25,
                                                  width: size.width * 0.9,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(width: size.width * 0.1),
                                                              // SvgPicture.asset(
                                                              //   verified,
                                                              //   height: 5,
                                                              // ),
                                                              Image.asset(
                                                                'asset/icons/secureguard.png',
                                                                color: infocolor,
                                                                height: 5,
                                                              ),
                                                              // Spacer(),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                child: const Icon(
                                                                  Icons.close,
                                                                  size: 20,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: size.height * 0.02,
                                                        ),
                                                        Text(
                                                          'Not Verified',
                                                          style: TextStyle(
                                                            fontSize: size.height * 0.015,
                                                            fontFamily: "MBold",
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: size.height * 0.02,
                                                        ),
                                                        Text(
                                                          'This might discourage clients from contacting you.',
                                                          style: TextStyle(
                                                            fontSize: size.height * 0.014,
                                                            fontFamily: "Stf",
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: size.height * 0.02,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            _requirementsModalBottomSheet(context);
                                                          },
                                                          child: Container(
                                                            height: size.height * 0.04,
                                                            width: size.width * 0.5,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(color: signupclor_dark),
                                                                borderRadius: BorderRadius.circular(20),
                                                                color: btnclr),
                                                            child: Center(
                                                                child: Text(
                                                              'Check Requirements',
                                                              style: TextStyle(
                                                                  fontSize: size.height * 0.018, fontFamily: "MBOld", color: signupclor_dark),
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
                                  child: SvgPicture.asset(
                                    verified,
                                    // height: 5,
                                    color: infocolor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => Container(
                                          margin: EdgeInsets.only(bottom: size.height * 0.1),
                                          child: Dialog(
                                            alignment: AlignmentDirectional.bottomCenter,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                            //this right here
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: btnclr,
                                              ),
                                              height: size.height * 0.25,
                                              width: size.width * 0.9,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                                child: Column(
                                                  children: <Widget>[
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Container(width: size.width * 0.1),
                                                          SvgPicture.asset(
                                                            con_icon,
                                                            height: size.height * 0.04,
                                                          ),
                                                          // Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(context);
                                                            },
                                                            child: const Icon(
                                                              Icons.close,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: size.height * 0.02,
                                                    ),
                                                    Text(
                                                      'Promote your Concard',
                                                      style: TextStyle(
                                                        fontSize: size.height * 0.015,
                                                        fontFamily: "MBold",
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: size.height * 0.02,
                                                    ),
                                                    Text(
                                                      'Make your card visible when people search on',
                                                      style: TextStyle(
                                                        fontSize: size.height * 0.015,
                                                        fontFamily: "Stf",
                                                      ),
                                                    ),
                                                    Text(
                                                      'Concard or Google',
                                                      style: TextStyle(
                                                        fontSize: size.height * 0.015,
                                                        fontFamily: "Stf",
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: size.height * 0.02,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>AppSettingsScreen()));
                                                      },
                                                      child: Container(
                                                        height: size.height * 0.05,
                                                        width: size.width * 0.5,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(color: signupclor_dark),
                                                            borderRadius: BorderRadius.circular(20),
                                                            color: btnclr),
                                                        child: Center(
                                                            child: Text(
                                                          'Go to Settings',
                                                          style:
                                                              TextStyle(fontSize: size.height * 0.018, fontFamily: "MBOld", color: signupclor_dark),
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
                                    style: TextStyle(fontFamily: "Stf", fontSize: size.height * 0.015, color: bckgrnd),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  //notification icon
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NotificationsScreen()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: size.height * 0.06),
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset(bellIcon),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 10,
                                        ),
                                        child: SvgPicture.asset(notifyDot),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // SizedBox(
                  //     width: 1,
                  //   ),
                ],
              ),
            ),
           
            Container(
              margin: EdgeInsets.only(top: size.height * 0.23),
              // height: size.height*0.8,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.02, left: size.width * 0.1, right: size.width * 0.14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _switchaccountModalBottomSheet(context);
                          },
                          child: SvgPicture.asset(
                            pp_shuffle,
                            height: size.height * 0.03,
                          ),

                          //     Image.asset(
                          //   switch_icon,
                          //   height: size.height * 0.03,
                          // ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: size.width * 0.03),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const CalenderScreen()));
                            },
                            child: SvgPicture.asset(
                              calender,
                              height: size.height * 0.03,
                            ),

                            //   Image.asset(
                            //   planner_icon,
                            //   height: size.height * 0.03,
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        SvgPicture.asset(
                          pp_share,
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
              height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                color: btnclr,
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(15),
                  topRight: const Radius.circular(15),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Padding(
                padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02),
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
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    ' Card',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditMyCardScreen()));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'Edit Card',
                                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.03,
                                        ),
                                        SvgPicture.asset(
                                          edit_card_icon,
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
                            GestureDetector(
                              onTap: () {
                                _cardInfoPopup(context);
                              },
                              //umar changed
                              child: cardWidget(context, appPro!.individualProfileModel!),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            _comprofileModalBottomSheet(context);
                          },
                          child: Container(
                            height: size.height * 0.04,
                            width: size.width * 0.41,
                            decoration: BoxDecoration(border: Border.all(color: signupclor_dark), borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'Company Profile',
                                style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.018, color: signupclor_dark),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _brochfileModalBottomSheet(context);
                          },
                          child: Container(
                            height: size.height * 0.04,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(border: Border.all(color: signupclor_dark), borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'Brochure',
                                style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.018, color: signupclor_dark),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => RatingReviewScreen(
                                          userId: appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.id.toString(),
                                        )));
                          },
                          child: Row(
                            children: [
                              Text(
                                'Rating & Reviews',
                                style: TextStyle(fontSize: size.height * 0.018,  fontFamily: 'Msemibold'),
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
                                initialRating: double.parse(appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.userRating.toString()),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
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
                              '${appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.userRating!.toString()}',
                              style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AnalyticsScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dashboard',
                            style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
                          ),
                          Container(
                            height: size.height * 0.04,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                'View',
                                style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: gradientgreen),
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
                      decoration: BoxDecoration(color: bckgrnd, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>CardsBottomBarScreen(initialIndex: 1,)));
                            },
                            child: Container(
                              height: size.height * 0.11,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [prmryblue, darkblue])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          appPro!.individualProfileModel!.individualProfileDetailData!.reachedCardsCounts.toString(),
                                          style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.03),
                                        ),
                                        SvgPicture.asset(
                                          groupreach_icon,
                                          color: bckgrnd,
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: size.height * 0.01, right: size.width * 0.02, left: size.width * 0.03),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: size.width * 0.02),
                                    child: Text(
                                      'Reached\nConcards',
                                      style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.015),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>CardsBottomBarScreen(initialIndex: 3,)));
                            },
                            child: Container(
                              height: size.height * 0.11,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient:
                                      LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [gradientgreen, primarygreen])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          appPro!.individualProfileModel!.individualProfileDetailData!.savedCardsCounts.toString(),
                                          style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.03),
                                        ),
                                        SvgPicture.asset(
                                          downloading_icon,
                                          color: bckgrnd,
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: size.height * 0.01, right: size.width * 0.02, left: size.width * 0.03),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: size.width * 0.017),
                                    child: Text(
                                      'Saved\nConcards',
                                      style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.015),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>CardsBottomBarScreen(initialIndex: 2,)));

                            },
                            child: Container(
                              height: size.height * 0.11,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [signupclor_light, signupclor_dark])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          appPro!.individualProfileModel!.individualProfileDetailData!.favouriteCardsCounts.toString(),
                                          style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.03),
                                        ),
                                        SvgPicture.asset(
                                          favoutline_icon,
                                          color: bckgrnd,
                                          height: size.height * 0.04,
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: size.height * 0.01, right: size.width * 0.02, left: size.width * 0.03),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: size.width * 0.03),
                                    child: Text(
                                      'Favorites',
                                      style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.015),
                                    ),
                                  ),
                                ],
                              ),
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
                          style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'MBold'),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          appPro?.productAndServicesModel?.data?.length == null ? "0" : appPro!.productAndServicesModel!.data!.length.toString(),
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            color: primarygreen,
                            fontFamily: 'Mbold',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    //Product and Services
                    Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: bckgrnd,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Wrap(
                          children: List.generate(
                            appPro?.productAndServicesModel?.data?.length == null ? 0 : appPro!.productAndServicesModel!.data!.length + 1,
                            (index) {
                              if (index == appPro!.productAndServicesModel!.data!.length) {
                                return Padding(
                                  padding: EdgeInsets.only(left: size.width * 0.01, right: size.width * 0.01, top: size.height * 0.01),
                                  child: InkWell(
                                    onTap: () {
                                      appPro!.setLoadingTrue();
                                      addProductsAndServices(context);
                                      appPro!.setLoadingFalse();
                                    },
                                    child: Container(
                                      height: size.height * 0.03,
                                      width: size.width * 0.15,
                                      decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          'Add +',
                                          style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: txtcolr),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                                  height: size.height * 0.04,
                                  width: size.width * 0.2,
                                  child: Center(
                                    child: Text(
                                      appPro!.productAndServicesModel!.data![index].name.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.015),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Container(
                    //   height: size.height * 0.15,
                    //   width: size.width,
                    //   decoration: BoxDecoration(
                    //     color: bckgrnd,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: size.width * 0.02, top: size.height * 0.02, right: size.width * 0.02),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Container(
                    //               decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Buisness',
                    //                 style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.22,
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Growth',
                    //                 style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.2,
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Progress',
                    //                 style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.2,
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Now',
                    //                 style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
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
                    //               decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Progress',
                    //                 style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                    //               )),
                    //               height: size.height * 0.04,
                    //               width: size.width * 0.2,
                    //             ),
                    //             SizedBox(
                    //               width: size.width * 0.02,
                    //             ),
                    //             Container(
                    //               decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                   child: Text(
                    //                 'Now',
                    //                 style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
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
                    //               decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                    //               child: Center(
                    //                 child: Text(
                    //                   'Add +',
                    //                   style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: gradientgreen),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SizedBox(height: size.height * 0.035),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "About",
                          style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'MBold'),
                        ),
                        GestureDetector(
                          onTap: () => _showEditAboutPopUp(
                              context,
                              appPro?.individualProfileModel?.individualProfileDetailData!.singleProfileUser!.profileAbout!.id == null
                                  ? ''
                                  : appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileAbout!.id.toString()),
                          child: Container(
                            height: size.height * 0.04,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                'Edit',
                                style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: gradientgreen),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    Container(
                      // height: size.height * 0.13,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: bckgrnd,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height * 0.02, horizontal: size.width * 0.04),

                        // EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                Text(
                                  appPro?.individualProfileModel?.individualProfileDetailData!.singleProfileUser!.profileAbout?.text == null
                                      ? ''
                                      : appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileAbout!.text.toString(),
                                  style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                                ),
                              ],
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
                          style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'MBold'),
                        ),
                        GestureDetector(
                          onTap: () async {
                            // await ProfileController().uplaodImage(hideeye_icon);
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CreateNewSocialLink()));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             SocialLinksScreen()));
                          },
                          child: Container(
                            height: size.height * 0.04,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                'Add +',
                                style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: gradientgreen),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Container(
                        // padding: EdgeInsets.all(8.0),
                        color: Colors.transparent,
                        height: size.height * 0.1,
                        // width: size.width,
                        child: FutureBuilder<SocialLinksModel?>(
                            future: SocialLinksController().getSocialLink(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Text("Something went wrong. Try again later");
                              } else if (snapshot.data!.linksDataList!.isEmpty) {
                                return const Text("There are no links added yet");
                              } else {
                                List<LinksDataList>? linksDataList = snapshot.data!.linksDataList;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: linksDataList!.length,
                                  itemBuilder: ((context, index) {
                                    return Row(
                                      children: [
                                        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          CircleAvatar(
                                            radius: size.width * 0.06,
                                            backgroundColor: signupclor_dark,
                                            child: CircleAvatar(
                                                radius: size.width * 0.055,
                                                backgroundColor: Colors.white,
                                                backgroundImage: NetworkImage(linksDataList[index].image!)),
                                          ),
                                          Text("${linksDataList[index].title}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ))
                                        ]),
                                        const SizedBox(width: 15.0),
                                      ],
                                    );
                                  }),
                                );
                              }
                            })),
                  
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Conmpany/ Team members",
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
                        Container(
                          height: size.height * 0.04,
                          width: size.width * 0.2,
                          decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              'Add +',
                              style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: gradientgreen),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Container(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemCount: appPro!.individualProfileModel!.individualProfileDetailData!.companyMembers!.length,
                          itemBuilder: (context, companyMemeberIndex) {
                            return Container(
                              margin: EdgeInsets.only(left: size.width * 0.03),
                              child: Column(
                                children: [
                                   CircleAvatar(
                                    radius: 30,
                                  backgroundImage: NetworkImage(
                                    appPro!.individualProfileModel!.individualProfileDetailData!.companyMembers![companyMemeberIndex].profileImage.toString()??"https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg"
                                  ),
                                  ),
                                  Text(
                                    '${appPro!.individualProfileModel!.individualProfileDetailData!.companyMembers![companyMemeberIndex].firstName.toString()}' + '${appPro!.individualProfileModel!.individualProfileDetailData!.companyMembers![companyMemeberIndex].lastName.toString()}',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                  ),
                                  Text(
                                    appPro!.individualProfileModel!.individualProfileDetailData!.companyMembers![companyMemeberIndex].companyName!=null?
                                    appPro!.individualProfileModel!.individualProfileDetailData!.companyMembers![companyMemeberIndex].firstName.toString():'',
                                    style: TextStyle(fontSize: size.height * 0.014, fontFamily: 'Msemibold'),
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
            
                ],
              )
            ),
            Visibility(
              visible: isShareProfile != true,
              child: Container(
                height: size.height * 2.0,
                width: size.width * 1.0,
                color: Colors.black.withOpacity(0.5),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.23,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.05),
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: size.height * 0.04,
                          backgroundColor: bckgrnd,
                          child: SvgPicture.asset(stylearrw_icon),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Container(
                        height: size.height * 0.25,
                        width: size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: primarygreen),
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Share your profile',
                                style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: bckgrnd,
                                  fontFamily: 'Msemibold',
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Text(
                                'Contrary to popular belief, Lorem Ipsum is not\nsimply random text. It has roots in a piece of\nclassical Latin literature from 45 BC, making it over\n2000 years old.',
                                style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Msemibold",
                                  color: bckgrnd,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.29,
                      ),
                      Container(
                        height: size.height * 0.05,
                        width: size.width,
                        child: ElevatedButton(
                          onPressed: () {
                           
                            setState(() {
                              isShareProfile = true;

                            });
                          },
                          child: Text(
                            'Got It!',
                            style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.018),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                              backgroundColor: MaterialStateProperty.all(primarygreen)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //Premium Text
            Column(
              children: [
                SizedBox(height: size.height * 0.15),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => IndividualPremiumScreen()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(left: 10.0),
                    // padding: EdgeInsets.only(left: 07.0),
                    height: size.height * 0.05,
                    width: size.width * 0.27,
                    decoration: BoxDecoration(
                        color: bckgrnd.withOpacity(0.1),
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0, bottom: 09.0),
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
                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: bckgrnd),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(context, IndividualProfileModel? individualProfileModel) {
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
                                size: size.height * 0.08,
                                data: '${individualProfileModel!.individualProfileDetailData!.singleProfileUser!.id}',
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
                                "${individualProfileModel.individualProfileDetailData!.singleProfileUser!.firstName!=null? individualProfileModel.individualProfileDetailData!.singleProfileUser!.firstName.toString(): ''} ${individualProfileModel.individualProfileDetailData!.singleProfileUser!.lastName!=null? individualProfileModel.individualProfileDetailData!.singleProfileUser!.lastName.toString(): ''}",
                                style: TextStyle(
                                  fontSize: size.height * 0.020,
                                  color: signupclor_dark,
                                  fontFamily: "Mbold",
                                ),
                              ),
                              Text(
                                "${individualProfileModel.individualProfileDetailData!.singleProfileUser!.jobTitle!=null? individualProfileModel.individualProfileDetailData!.singleProfileUser!.jobTitle : ''}",
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
                                        individualProfileModel.individualProfileDetailData!.singleProfileUser!.address!=null?
                                        individualProfileModel.individualProfileDetailData!.singleProfileUser!.address.toString():"",
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
                                   individualProfileModel.individualProfileDetailData!.singleProfileUser!.mobileNumber!=null? individualProfileModel.individualProfileDetailData!.singleProfileUser!.mobileNumber.toString():'' ,
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
                                          individualProfileModel.individualProfileDetailData!.singleProfileUser!.email.toString() ?? '',
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
                                          "${individualProfileModel.individualProfileDetailData!.singleProfileUser!.website}",
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
          padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Card Info',
                    style: TextStyle(color: Colors.black, fontSize: size.height * 0.018, fontFamily: 'MBold'),
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

                image: AssetImage(qr_logo),
                typeNumber: 4,
                size: size.height * 0.1,
                data: 'https://www.google.ru',
                errorCorrectLevel: QrErrorCorrectLevel.M,
                roundEdges: true,
                elementColor: signupclor_dark,
              ),
              SizedBox(height: size.height * 0.06),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>WebProfileViewToSaveContact()));
                },
                child: Row(
                  children: [
                    SvgPicture.asset(internet_icon),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      'www.company.com',
                      style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.013),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.035,
                          width: size.width * 0.2,
                          decoration:
                              BoxDecoration(border: Border.all(color: signupclor_dark), color: bckgrnd, borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Visit',
                            style: TextStyle(fontFamily: "Msemibold", color: signupclor_dark, fontSize: size.height * 0.013),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>MyMap()));
                },
                child: Row(
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
                          style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.011),
                        ),
                        Text(
                          'Al salama, Jeddah, Saudia Arabia ',
                          style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.011),
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
                          decoration:
                              BoxDecoration(border: Border.all(color: signupclor_dark), color: bckgrnd, borderRadius: BorderRadius.circular(30)),
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
                                  style: TextStyle(fontFamily: "Msemibold", color: signupclor_dark, fontSize: size.height * 0.013),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              InkWell(
                onTap:()async{
                        _sendEmail();

                },
                child: Row(
                  children: [
                    SvgPicture.asset(usermail_icon),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      'User.123@company.com',
                      style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.013),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.035,
                          width: size.width * 0.2,
                          decoration:
                              BoxDecoration(border: Border.all(color: signupclor_dark), color: bckgrnd, borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Contact',
                            style: TextStyle(fontFamily: "Msemibold", color: signupclor_dark, fontSize: size.height * 0.018),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              InkWell(
                onTap:()async{
                    await URLLauncherClass()
                                    .launchUrlMethod("+92123456789", 'tel');
                },
                child: Row(
                  children: [
                    SvgPicture.asset(phonecall_icon),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      '+966 55 889 0098',
                      style: TextStyle(fontFamily: "Stf", fontSize: size.height * 0.018),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.035,
                          width: size.width * 0.2,
                          decoration:
                              BoxDecoration(border: Border.all(color: signupclor_dark), color: bckgrnd, borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Call',
                            style: TextStyle(fontFamily: "Msemibold", color: signupclor_dark, fontSize: size.height * 0.018),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => errorDialog);
  }

  void _switchaccountModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: const Radius.circular(10), topRight: Radius.circular(10))),
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
                        color: gradientgreen, borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.01, right: size.width * 0.04, left: size.width * 0.04),
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
                                style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Stf", color: bckgrnd),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => UpgradeToPremiumIndividualScreen()));
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
                                      style: TextStyle(fontFamily: "MBold", fontSize: size.height * 0.015, color: bckgrnd),
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
                        color: bckgrnd, borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                    height: size.height * 0.35,
                    width: size.width,
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
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
                                          child: Icon(Icons.close, size: size.height * 0.025)),
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
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: gradientgreen),
                                            color: txtcolr.withOpacity(0.2)),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: size.height * 0.03,
                                                    backgroundImage: const NetworkImage(
                                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIyHJPjCfH88x39naBmI-xAytAcmffu_4lNg&usqp=CAU'),
                                                  ),
                                                  SizedBox(width: size.width * 0.03),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Assem Yamak',
                                                        style: TextStyle(
                                                          fontSize: size.height * 0.018,
                                                          fontFamily: "MBold",
                                                        ),
                                                      ),
                                                      SizedBox(height: size.height * 0.01),
                                                      Text(
                                                        'Operations Manager',
                                                        style: TextStyle(
                                                          fontSize: size.height * 0.015,
                                                          fontFamily: "Stf",
                                                        ),
                                                      ),
                                                      SizedBox(height: size.height * 0.01),
                                                      Text(
                                                        'Dynamic Oil Tools',
                                                        style: TextStyle(
                                                          fontSize: size.height * 0.015,
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
                                                      height: size.height * 0.04,
                                                      width: size.width * 0.2,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(color: signupclor_dark),
                                                        color: txtcolr.withOpacity(0.2),
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: Center(
                                                          child: Text(
                                                        'Currently in use',
                                                        style: TextStyle(fontSize: size.height * 0.01, fontFamily: "MBOld", color: signupclor_dark),
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
                                        style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Stf"),
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
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: const Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd, borderRadius: const BorderRadius.only(topLeft: const Radius.circular(10), topRight: const Radius.circular(10))),
                height: size.height * 0.28,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
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
                                  child: Icon(Icons.close, size: size.height * 0.025)),
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
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
        shape: const RoundedRectangleBorder(borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration:
                    BoxDecoration(color: bckgrnd, borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
                height: size.height * 0.28,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
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
                                  child: Icon(Icons.close, size: size.height * 0.025)),
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
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (context, setSte) {
            return Container(
              decoration: BoxDecoration(
                  color: bckgrnd, borderRadius: const BorderRadius.only(topLeft: const Radius.circular(10), topRight: Radius.circular(10))),
              height: size.height * 0.34,
              width: size.width,
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
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
                                child: Icon(Icons.close, size: size.height * 0.025)),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'Phone Number',
                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'Email Address',
                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'Identification',
                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'LinkedIn Profile',
                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBOld", color: signupclor_dark),
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
      },
    );
  }

  void _showEditAboutPopUp(BuildContext context, String? aboutId) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _aboutController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setSte) {
          return Container(
            margin: EdgeInsets.only(bottom: size.height * 0.1),
            child: Dialog(
              alignment: AlignmentDirectional.bottomCenter,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              //this right here
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: btnclr,
                ),
                height: size.height * 0.25,
                width: size.width * 0.9,
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Edit About',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.018,
                                fontFamily: 'MBold',
                              ),
                            ),
                            // Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.1,
                        width: size.width * 0.8,
                        child: TextFormField(
                          controller: _aboutController,
                          maxLines: 8,
                          minLines: 6,
                          decoration: InputDecoration(
                            hintText: 'Write About',
                            contentPadding: EdgeInsets.only(top: 0, left: 22, right: 10, bottom: 10),
                            hintStyle: TextStyle(fontFamily: "MBold", color: infocolor, fontSize: size.height * 0.015),
                            fillColor: bckgrnd,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: bckgrnd),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: bckgrnd),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.3,
                              decoration:
                                  BoxDecoration(border: Border.all(color: signupclor_dark), borderRadius: BorderRadius.circular(20), color: btnclr),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBOld", color: signupclor_dark),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              AboutProvider().changeAbout(aboutId: aboutId, AboutText: _aboutController.text.trim());
                              Navigator.pop(context);
                              appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileAbout!.text = _aboutController.text;
                            },
                            child: Container(
                              height: size.height * 0.05,
                              width: size.width * 0.3,
                              decoration:
                                  BoxDecoration(border: Border.all(color: signupclor_dark), borderRadius: BorderRadius.circular(20), color: btnclr),
                              child: Center(
                                child: Text(
                                  'Ok',
                                  style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBOld", color: signupclor_dark),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
