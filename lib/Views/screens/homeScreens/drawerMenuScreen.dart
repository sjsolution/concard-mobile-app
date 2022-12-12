import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/individual/signup/signup_choice_class.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/createTeamScreen.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/appSettingsScreen.dart';
import 'package:concard/Views/screens/homeScreens/faqs.dart';
import 'package:concard/Views/screens/homeScreens/individualPremium/individualPremiumScreen.dart';
import 'package:concard/Views/screens/homeScreens/secretaryModeScreen.dart';
import 'package:concard/Views/screens/homeScreens/upgradePremiumIndividual/updgratToPremiumIndividual.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:concard/Views/screens/globals.dart' as globals;
import 'package:provider/provider.dart';

class DrawerMenuScreen extends StatefulWidget {
  DrawerMenuScreen({Key? key}) : super(key: key);

  @override
  State<DrawerMenuScreen> createState() => _DrawerMenuScreenState();
}

class _DrawerMenuScreenState extends State<DrawerMenuScreen> {
  AppProvider? appPro;
  @override
  void initState() {
    appPro = Provider.of<AppProvider>(context, listen: false);
    super.initState();
  }

  bool? switchValue = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        height: size.height * 0.1,
        width: size.width * 0.3,
        // margin: EdgeInsets.only(left: 15, right: 15),
        child: ListView(
          padding: EdgeInsets.only(top: size.height * 0.03),
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.03, top: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(con_icon),
                      Text(
                        'C O N C A R D',
                        style: TextStyle(fontSize: size.height * 0.03, fontFamily: 'MBold', color: signupclor_dark),
                      ),
                      Text(
                        "Now You're Connected",
                        style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'Stf', color: signupclor_dark),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            globals.isAccespremium!
                ? InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => IndividualPremiumScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.03),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          gradient:
                              LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [signupclor_light, signupclor_dark]),
                          borderRadius: const BorderRadius.only(
                            topLeft: const Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(premium_icon),
                              Text(
                                'Access My Premium',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: bckgrnd),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: size.height * 0.02,
                                color: bckgrnd,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => UpgradeToPremiumIndividualScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.03),
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [signupclor_light, signupclor_dark]),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(premium_icon),
                              Text(
                                'Upgrade to Premium',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: bckgrnd),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: size.height * 0.02,
                                color: bckgrnd,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: size.height * 0.01,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [

            //   ],
            // ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Theme(
              data: ThemeData(
                colorScheme: ColorScheme.fromSwatch().copyWith(
                  secondary: Colors.black,
                ),
              ),
              child: ExpansionTile(
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Stf', color: Colors.black),
                ),
                leading: SvgAsset(
                  picture: drawer_profile,
                  height: size.height * 0.035,
                ),
                trailing: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                childrenPadding: EdgeInsets.only(bottom: size.height * 0.009),
                collapsedTextColor: Colors.black,
                children: [
                  Column(
                    children: [
                      Container(
                        color: btnclr,
                        child: Padding(
                          padding: EdgeInsets.only(left: size.width * 0.15, right: size.width * 0.04),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) => CreateTeamScreen(
                                                type: "norm",
                                                teamName: "",
                                              )));
                                },
                                child: Row(
                                  children: [
                                    SvgAsset(picture: drawer_team, height: size.height * 0.025, color: infocolor),
                                    // Image.asset(
                                    //   drwrteam_icon,
                                    //   color: infocolor,
                                    // ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Teams',
                                      style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Msemibold', color: infocolor),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [Image.asset(teamlock_icon)],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SecretaryModeScreen()));
                                },
                                child: Row(
                                  children: [
                                    SvgAsset(picture: drawer_secretary_mode, height: size.height * 0.025, color: infocolor),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      'Secretary Mode',
                                      style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Msemibold', color: infocolor),
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: [Image.asset(teamlock_icon)],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.15,
                          bottom: size.width * 0.015,
                        ),
                        child: Row(
                          children: [
                            SvgAsset(picture: drawer_dashboard, height: size.height * 0.025, color: infocolor),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Dashboard',
                              style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Msemibold', color: infocolor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.15),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              drawer_groups,
                              height: size.height * 0.025,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Groups',
                              style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Msemibold', color: infocolor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.03),
            //   child: Row(
            //     children: [
            //       SvgAsset(
            //         picture: drawer_profile,
            //         height: size.height * 0.035,
            //       ),
            //       const SizedBox(
            //         width: 20,
            //       ),
            //       Text(
            //         'Profile',
            //         style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Stf'),
            //       ),
            //       const Spacer(),
            //       const Icon(
            //         Icons.arrow_drop_down,
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Column(
            //   children: [
            //     Container(
            //       color: btnclr,
            //       child: Padding(
            //         padding: EdgeInsets.only(left: size.width * 0.15, right: size.width * 0.04),
            //         child: Column(
            //           children: [
            //             InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                         builder: (BuildContext context) => CreateTeamScreen(
            //                               type: "norm",
            //                               teamName: "",
            //                             )));
            //               },
            //               child: Row(
            //                 children: [
            //                   SvgAsset(picture: drawer_team, height: size.height * 0.025, color: infocolor),
            //                   // Image.asset(
            //                   //   drwrteam_icon,
            //                   //   color: infocolor,
            //                   // ),
            //                   const SizedBox(
            //                     width: 5,
            //                   ),
            //                   Text(
            //                     'Teams',
            //                     style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Msemibold', color: infocolor),
            //                   ),
            //                   const Spacer(),
            //                   Row(
            //                     children: [Image.asset(teamlock_icon)],
            //                   )
            //                 ],
            //               ),
            //             ),
            //             const SizedBox(
            //               height: 10,
            //             ),
            //             InkWell(
            //               onTap: () {
            //                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SecretaryModeScreen()));
            //               },
            //               child: Row(
            //                 children: [
            //                   SvgAsset(picture: drawer_secretary_mode, height: size.height * 0.025, color: infocolor),
            //                   const SizedBox(
            //                     width: 7,
            //                   ),
            //                   Text(
            //                     'Secretary Mode',
            //                     style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Msemibold', color: infocolor),
            //                   ),
            //                   const Spacer(),
            //                   Row(
            //                     children: [Image.asset(teamlock_icon)],
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       height: size.height * 0.015,
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(left: size.width * 0.15),
            //       child: Row(
            //         children: [
            //           SvgAsset(picture: drawer_dashboard, height: size.height * 0.025, color: infocolor),
            //           const SizedBox(
            //             width: 10,
            //           ),
            //           Text(
            //             'Dashboard',
            //             style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Msemibold', color: infocolor),
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       height: size.height * 0.015,
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(left: size.width * 0.15),
            //       child: Row(
            //         children: [
            //           SvgPicture.asset(
            //             drawer_groups,
            //             height: size.height * 0.025,
            //           ),
            //           const SizedBox(
            //             width: 10,
            //           ),
            //           Text(
            //             'Groups',
            //             style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Msemibold', color: infocolor),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: size.height * 0.01,
            // ),
            // const Divider(
            //   thickness: 1,
            // ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgAsset(picture: drawer_near_me, height: size.height * 0.035),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            'Near By',
                            style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Stf'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.04,
                        ),
                        child: Row(
                          children: [
                            Transform.scale(
                              // transformHitTests: false,
                              scale: 0.6,
                              child: CupertinoSwitch(
                                value: switchValue!,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;
                                  });
                                },
                                activeColor: gradientgreen,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Now you're discoverable to Near by Contacts",
                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf", color: infocolor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const AppSettingsScreen()));
              },
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.03),
                child: Row(
                  children: [
                    SvgAsset(picture: drawer_app_settings, height: size.height * 0.035),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      'App Settings',
                      style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Stf'),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(
              height: size.height * 0.01,
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
                              height: size.height * 0.2,
                              width: size.width * 0.9,
                              child: Padding(
                                padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: size.height * 0.01,
                                            width: size.width * 0.02,
                                          ),
                                          Text(
                                            'Talk to us!',
                                            style: TextStyle(color: Colors.black, fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                          ),
                                          // Spacer(),
                                          InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                size: 20,
                                              ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.06,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (_) => const FAQSScreen()));
                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                faq_icon,
                                                height: size.height * 0.035,
                                              ),
                                              Text(
                                                'FAQs',
                                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                                              )
                                            ],
                                          ),
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
                                                          height: size.height * 0.29,
                                                          width: size.width * 0.9,
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                                            child: Column(
                                                              children: <Widget>[
                                                                Container(
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Feedback',
                                                                        style: TextStyle(
                                                                            color: Colors.black, fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                                                      ),
                                                                      // Spacer(),
                                                                      InkWell(
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
                                                                  height: size.height * 0.03,
                                                                ),
                                                                TextFormField(
                                                                  maxLines: 4,
                                                                  decoration: InputDecoration(
                                                                    hintText: 'please describe your problem or\nsuggestion',
                                                                    contentPadding: const EdgeInsets.only(top: 0, left: 22, right: 10, bottom: 10),
                                                                    hintStyle: TextStyle(
                                                                      fontFamily: "MBold",
                                                                      color: infocolor,
                                                                      fontSize: size.height * 0.018,
                                                                    ),
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
                                                                SizedBox(
                                                                  height: size.height * 0.02,
                                                                ),
                                                                Center(
                                                                  child: Container(
                                                                    height: size.height * 0.05,
                                                                    width: size.width * 0.8,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(color: signupclor_dark),
                                                                        borderRadius: BorderRadius.circular(20),
                                                                        color: btnclr),
                                                                    child: Center(
                                                                      child: Text(
                                                                        'Send',
                                                                        style: TextStyle(
                                                                            fontFamily: "MSemibold",
                                                                            fontSize: size.height * 0.018,
                                                                            color: signupclor_dark),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(feedback_icon, height: size.height * 0.035),
                                              Text(
                                                'Feedbacks',
                                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                                              )
                                            ],
                                          ),
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
                                                    height: size.height * 0.2,
                                                    width: size.width * 0.9,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(height: 10, width: 10),
                                                                Text(
                                                                  'Contact Us!',
                                                                  style: TextStyle(
                                                                      color: Colors.black, fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                                                ),
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
                                                          ),
                                                          SizedBox(
                                                            height: size.height * 0.05,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'Email:',
                                                                style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Msemibold"),
                                                              ),
                                                              SizedBox(
                                                                width: size.width * 0.02,
                                                              ),
                                                              Text(
                                                                'support@concard.io',
                                                                style: TextStyle(
                                                                    fontSize: size.height * 0.018, fontFamily: "Msemibold", color: signupclor_dark),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Image.asset(support_icon, height: size.height * 0.035),
                                              Text(
                                                'Support',
                                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
              
              },
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.03),
                child: Row(
                  children: [
                    SvgAsset(picture: drawer_talk_to_us, height: size.height * 0.035),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      'Talk to us',
                      style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Stf'),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.03),
              child: Row(
                children: [
                  SvgPicture.asset(
                    drawer_my_account,
                    height: size.height * 0.035,
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                    'My Account',
                    style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Stf'),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 15,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Divider(
              thickness: 1,
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.03),
              child: InkWell(
                onTap: () async {
                  LocalStorageClass().removeData(LocalStorageClass().tokenKey);
                  LocalStorageClass().removeData(LocalStorageClass().userIdKey);
                  LocalStorageClass().removeData(LocalStorageClass().userTypeKey);
                  Navigator.pushReplacementNamed(context, '/intialScreen');
                  // Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (BuildContext context) =>const SignupChoiceClass()));
                },
                child: Row(
                  children: [
                    Image.asset(
                      drwrlogout_icon,
                      height: size.height * 0.035,
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Stf'),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget SvgAsset({required String picture, required double height, Color? color}) {
    return SvgPicture.asset(
      picture,
      height: height,
      color: color == null ? Colors.black : color,
    );
  }
}
