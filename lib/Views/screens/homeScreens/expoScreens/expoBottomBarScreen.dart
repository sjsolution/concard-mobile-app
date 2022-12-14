import 'package:concard/Views/screens/homeScreens/expoScreens/expoDetailsScreen.dart';
import 'package:concard/Views/screens/homeScreens/expoScreens/expoSeeAllScreen.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import '../../../../Controllers/ExpoController/expo_badge_controller.dart';
import '../../../../Controllers/providers/app_providers.dart';
import '../personalProfileViewScreen.dart';
import 'package:concard/Constants/globals.dart' as Globals;

class ExpoBottomBarScreen extends StatefulWidget {
  const ExpoBottomBarScreen({Key? key}) : super(key: key);

  @override
  State<ExpoBottomBarScreen> createState() => _ExpoBottomBarScreenState();
}

class _ExpoBottomBarScreenState extends State<ExpoBottomBarScreen> {
  @override
  void initState() {
    getListOfExpoBadge();
    // getFilterList();
    // TODO: implement initState
    super.initState();
  }
  // List<>? badgeList = [];
  getListOfExpoBadge() async {
    Globals.expoBadgeListModal= await ExpoController().getExpoBadgeList();
    // print('Expo Home'+ Globals.expoBadgeListModal.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      height: size.height * 0.15,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [signupclor_light, signupclor_dark]),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(more_icon),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  expo_icon,
                                  height: size.height * 0.03,
                                  color: bckgrnd,
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'Expo',
                                  style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBold", color: bckgrnd),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(srchIcon),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                InkWell(
                                    child: Stack(
                                    children: [
                                      SvgPicture.asset(bellIcon),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: SvgPicture.asset(notifyDot),
                                      ),
                                    ],
                                  ),),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const PersonalProfileViewScreen()));
                                  },
                                  child: CircleAvatar(
                                      radius: size.height * 0.02,
                                      backgroundImage: NetworkImage(
                                        appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileImage.toString() ??
                                            "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.13),
                // height: size.height*0.8,
                width: size.width,
                decoration: BoxDecoration(
                    color: btnclr,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Globals.expoBadgeListModal != null
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.width * 0.04,
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
                                              height: size.height * 0.5228,
                                              width: size.width * 0.9,
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Expo Badge',
                                                              style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Msemibold"),
                                                            ),
                                                            Spacer(),
                                                            Row(
                                                              children: [
                                                                SvgPicture.asset(stylearrw_icon),
                                                                SizedBox(
                                                                  width: size.width * 0.03,
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      Navigator.pop(context);
                                                                    },
                                                                    child: Icon(
                                                                      Icons.close,
                                                                      size: size.height * 0.03,
                                                                    ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: size.height * 0.02,
                                                      ),
                                                      PrettyQr(
                                                        typeNumber: null,
                                                        image: AssetImage(concard_icon),
                                                        elementColor: signupclor_dark,
                                                        size: size.height * 0.1,
                                                        data: appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.id.toString(),
                                                        errorCorrectLevel: QrErrorCorrectLevel.M,
                                                        roundEdges: true,
                                                      ),
                                                      SizedBox(
                                                        height: size.height * 0.03,
                                                      ),
                                                      Divider(
                                                        thickness: 1,
                                                        indent: size.width * 0.07,
                                                        endIndent: size.width * 0.07,
                                                      ),
                                                      SizedBox(
                                                        height: size.height * 0.02,
                                                      ),
                                                      Image.asset(adpec, height: size.height * 0.06),
                                                      SizedBox(
                                                        height: size.height * 0.04,
                                                      ),
                                                      Container(
                                                          width: size.width,
                                                          child: ClipRRect(
                                                            child: Image.asset(badgebckgrnd, fit: BoxFit.cover),
                                                          )),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: size.height * 0.32),
                                                    alignment: Alignment.center,
                                                    child: Column(
                                                      children: [
                                                        CircleAvatar(
                                                            radius: size.height * 0.04,
                                                            backgroundImage: NetworkImage(
                                                              appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileImage != null
                                                                  ? appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileImage.toString() ??
                                                                      "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg"
                                                                  : "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                                            )),
                                                        SizedBox(
                                                          height: size.height * 0.01,
                                                        ),
                                                        Text(
                                                          "${appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.firstName} ${appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.lastName} ",
                                                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: bckgrnd),
                                                        ),
                                                        SizedBox(
                                                          height: size.height * 0.01,
                                                        ),
                                                        Text(
                                                          appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.jobTitle.toString() ?? '',
                                                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf", color: bckgrnd),
                                                        ),
                                                        SizedBox(
                                                          height: size.height * 0.01,
                                                        ),
                                                        Text(
                                                          appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.companyName.toString() ?? '',
                                                          style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: bckgrnd),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                              },
                              child: Container(
                                height: size.height * 0.055,
                                width: size.width * 0.7,
                                decoration: BoxDecoration(
                                  border: Border.all(color: signupclor_dark),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Image.asset(badge),
                                  SizedBox(
                                    width: size.width * 0.04,
                                  ),
                                  Text('Expo Badge'),
                                ]),
                              ),
                            ),
                            // Row(

                            //   children: [
                            //   Container(
                            //     decoration: BoxDecoration(
                            //       // color: prmryblue,
                            //       border: Border.all(color: signupclor_dark),
                            //       borderRadius: BorderRadius.circular(30)
                            //     ),
                            //     child: Padding(
                            //       padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           SvgPicture.asset(congreen_icon,color: signupclor_dark,),
                            //           Text('Watchlist',
                            //           style: TextStyle(
                            //             fontSize: size.height*0.015,
                            //             fontFamily: "Msemibold",

                            //           ),),
                            //           Container(
                            //             height: size.height*0.03,
                            //             width: size.width*0.02,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     height: size.height*0.05,
                            //     width: size.width*0.4,
                            //   ),

                            //   Container(
                            //     decoration: BoxDecoration(
                            //       color: signupclor_light,
                            //       borderRadius: BorderRadius.circular(30)
                            //     ),
                            //     child: Padding(
                            //       padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.02),
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Image.asset(exchg_icon,height: size.height*0.02,color: bckgrnd,),
                            //           Text('Expo Badge',
                            //           style: TextStyle(
                            //             fontSize: size.height*0.015,
                            //             color: bckgrnd,
                            //             fontFamily: "Msemibold"
                            //           ),),
                            //           Container(
                            //             height: size.height*0.03,
                            //             width: size.width*0.02,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     height: size.height*0.05,
                            //     width: size.width*0.4,
                            //   ),
                            //   ],
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => ExpoSeeAllScreen(
                                          textType: 'Top',
                                        )));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Top',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBold"),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'See all',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Msemibold", color: txtcolr),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Globals.expoBadgeListModal!.expoListData!.top!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => ExpoDetailsScreen(id: Globals.expoBadgeListModal!.expoListData!.top![index].id.toString())));
                                      },
                                      child: SizedBox(
                                        width: size.width * 0.32,
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              // SizedBox(height: 20,),
                                              Image.network(
                                                    Globals.expoBadgeListModal!.expoListData!.top![index].image.toString(),
                                                    height: size.height * 0.05,
                                                  ) ??
                                                  SvgPicture.asset(
                                                    expo_icon,
                                                    height: size.height * 0.035,
                                                  ),
                                              SizedBox(
                                                height: size.height * 0.03,
                                              ),
                                              Text(
                                                Globals.expoBadgeListModal!.expoListData!.top![index].badgeName.toString(),
                                                style: TextStyle(fontSize: size.height * 0.012, fontFamily: "Msemibold"),
                                              ),
                                              Text(
                                                Globals.expoBadgeListModal!.expoListData!.top![index].location != null
                                                    ? Globals.expoBadgeListModal!.expoListData!.top![index].location.toString()
                                                    : '',
                                                style: TextStyle(fontSize: size.height * 0.012, fontFamily: "Stf", color: infocolor),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                              margin: EdgeInsets.only(
                                top: size.height * 0.01,
                              ),
                              height: size.height * 0.14,
                              width: size.width,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => ExpoSeeAllScreen(
                                          textType: 'Nearby',
                                        )));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Nearby',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Mbold"),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'See all',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Msemibold", color: txtcolr),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Globals.expoBadgeListModal!.expoListData!.nearBy!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    ExpoDetailsScreen(id: Globals.expoBadgeListModal!.expoListData!.nearBy![index].id.toString())));
                                      },
                                      child: SizedBox(
                                        width: size.width * 0.32,
                                        child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.network(
                                                      Globals.expoBadgeListModal!.expoListData!.nearBy![index].image.toString(),
                                                      height: size.height * 0.05,
                                                    ) ??
                                                    SvgPicture.asset(
                                                      expo_icon,
                                                      height: size.height * 0.035,
                                                    ),
                                                SizedBox(
                                                  height: size.height * 0.03,
                                                ),
                                                Text(
                                                  Globals.expoBadgeListModal!.expoListData!.nearBy![index].badgeName.toString(),
                                                  style: TextStyle(fontSize: size.height * 0.012, fontFamily: "Msemibold"),
                                                ),
                                                Text(
                                                  Globals.expoBadgeListModal!.expoListData!.nearBy![index].location != null
                                                      ? Globals.expoBadgeListModal!.expoListData!.nearBy![index].location.toString()
                                                      : '',
                                                  style: TextStyle(fontSize: size.height * 0.012, fontFamily: "Stf", color: infocolor),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  }),
                              margin: EdgeInsets.only(
                                top: size.height * 0.01,
                              ),
                              height: size.height * 0.14,
                              width: size.width,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => ExpoSeeAllScreen(
                                          textType: 'Ongoing',
                                        )));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Ongoing',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBold"),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'See all',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Msemibold", color: txtcolr),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Globals.expoBadgeListModal!.expoListData!.ongoing!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    ExpoDetailsScreen(id: Globals.expoBadgeListModal!.expoListData!.ongoing![index].id.toString())));
                                      },
                                      child: SizedBox(
                                        width: size.width * 0.32,
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.network(
                                                    Globals.expoBadgeListModal!.expoListData!.ongoing![index].image.toString(),
                                                    height: size.height * 0.05,
                                                  ) ??
                                                  SvgPicture.asset(
                                                    expo_icon,
                                                    height: size.height * 0.035,
                                                  ),
                                              SizedBox(
                                                height: size.height * 0.03,
                                              ),
                                              Text(
                                                Globals.expoBadgeListModal!.expoListData!.ongoing![index].badgeName.toString(),
                                                style: TextStyle(fontSize: size.height * 0.012, fontFamily: "Msemibold"),
                                              ),
                                              Text(
                                                Globals.expoBadgeListModal!.expoListData!.ongoing![index].location != null
                                                    ? Globals.expoBadgeListModal!.expoListData!.ongoing![index].location.toString()
                                                    : '',
                                                style: TextStyle(fontSize: size.height * 0.012, fontFamily: "Stf", color: infocolor),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                              margin: EdgeInsets.only(
                                top: size.height * 0.01,
                              ),
                              height: size.height * 0.14,
                              width: size.width,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => ExpoSeeAllScreen(
                                          textType: 'Upcoming',
                                        )));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Upcoming',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBold"),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'See all',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Msemibold", color: txtcolr),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Globals.expoBadgeListModal!.expoListData!.upcoming!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    ExpoDetailsScreen(id: Globals.expoBadgeListModal!.expoListData!.upcoming![index].id.toString())));
                                      },
                                      child: SizedBox(
                                        width: size.width * 0.32,
                                        child: Card(
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Image.network(
                                                      Globals.expoBadgeListModal!.expoListData!.upcoming![index].image.toString(),
                                                      height: size.height * 0.05,
                                                    ) ??
                                                    SvgPicture.asset(
                                                      expo_icon,
                                                      height: size.height * 0.035,
                                                    ),
                                                SizedBox(
                                                  height: size.height * 0.03,
                                                ),
                                                Text(
                                                  Globals.expoBadgeListModal!.expoListData!.upcoming![index].badgeName.toString(),
                                                  style: TextStyle(fontSize: size.height * 0.012, fontFamily: "Msemibold"),
                                                ),
                                                Text(
                                                  Globals.expoBadgeListModal!.expoListData!.upcoming![index].location != null
                                                      ? Globals.expoBadgeListModal!.expoListData!.upcoming![index].location.toString()
                                                      : '',
                                                  style: TextStyle(fontSize: size.height * 0.012, fontFamily: "Stf", color: infocolor),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                )
                                              ],
                                            )),
                                      ),
                                    );
                                  }),
                              margin: EdgeInsets.only(
                                top: size.height * 0.01,
                              ),
                              height: size.height * 0.14,
                              width: size.width,
                            ),
                          ],
                        ),
                      )
                    : const ShimmerLoadWidget(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
