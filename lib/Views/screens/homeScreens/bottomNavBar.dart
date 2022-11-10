import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/indiviualController/profile_controller.dart';
import 'package:concard/Controllers/compnayControllers/postController.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Models/post_list_modal.dart';
import 'package:concard/Views/screens/homeScreens/expoScreens/expoBottomBarScreen.dart';
import 'package:concard/Views/screens/homeScreens/homepge.dart';
import 'package:concard/Views/screens/homeScreens/messagesScreen/messagesScreen.dart';
import 'package:concard/Views/screens/homeScreens/nearByScreen/nearbyScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:provider/provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'cardsScrens/cardsBottomBarScreen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  // late AppProvider appPro;
  // @override
  // void initState() {
  //   appPro = Provider.of<AppProvider>(context, listen: false);
  //   getInitialMethods();
  //   super.initState();
  // }
  //
  // getInitialMethods() async {
  //   IndividualProfileModel? individualProfileModel = await ProfileController().getIndiviualProfile(Globals.userId, context);
  //   appPro.setIndividualProfileModelProfileObj = individualProfileModel;
  //   setState(() {});
  // }

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  //bottom Navigation bar
  int pageIndex = 0;

  setPageIndex(int index) {
    pageIndex = index;
    setState(() {});
  }

  List<Widget> bottomPages = [
    Homepage(),
    const ExpoBottomBarScreen(),
    CardsBottomBarScreen(),
    CardsBottomBarScreen(),
    const MessagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return
        //   PersistentTabView(
        //   context,
        //   controller: _controller,
        //   screens: bottomPages(),
        //   items: _navBarsItems(context),
        //   confineInSafeArea: true,
        //   backgroundColor: Colors.white, // Default is Colors.white.
        //   handleAndroidBackButtonPress: true, // Default is true.
        //   resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        //   stateManagement: true, // Default is true.
        //   hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        //   decoration: NavBarDecoration(
        //     borderRadius: BorderRadius.circular(10.0),
        //     colorBehindNavBar: Colors.white,
        //   ),
        //   navBarHeight: size.height * 0.12,
        //   popAllScreensOnTapOfSelectedTab: true,
        //   popActionScreens: PopActionScreensType.all,
        //   itemAnimationProperties: ItemAnimationProperties(
        //     // Navigation Bar's items animation properties.
        //     duration: Duration(milliseconds: 200),
        //     curve: Curves.ease,
        //   ),
        //   screenTransitionAnimation: ScreenTransitionAnimation(
        //     // Screen transition animation on change of selected tab.
        //     animateTabTransition: true,
        //     curve: Curves.ease,
        //     duration: Duration(milliseconds: 200),
        //   ),
        //   navBarStyle: NavBarStyle.style16, // Choose the nav bar style with this property.
        // );

        Scaffold(
      bottomNavigationBar: Container(
        height: size.height * 0.12,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomItems(size, bottom_bar_home, "Home", true, pageIndex == 0 ? prmryblue : Colors.grey, true, () {
              setPageIndex(0);
            }),
            bottomItems(size, bottom_bar_expo, "Expo", true, pageIndex == 1 ? prmryblue : Colors.grey, true, () {
              setPageIndex(1);
            }),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.1),
                          child: Dialog(
                            alignment: AlignmentDirectional.bottomEnd,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            //this right here
                            child: Container(
                              height: size.height * 0.2,
                              width: size.width,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: size.height * 0.02, right: size.width * 0.04, left: size.width * 0.04),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: size.height * 0.01,
                                            width: size.width * 0.1,
                                          ),
                                          // SizedBox(width: 90,),
                                          Text(
                                            'Concard !',
                                            style: TextStyle(color: Colors.black, fontSize: size.height * 0.02, fontFamily: 'MBold'),
                                          ),
                                          // SizedBox(width: 60,),
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
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ScannerScreen()));
                                                },
                                                child: Image.asset(scn_icon)),
                                            GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) => Container(
                                                            margin: EdgeInsets.only(bottom: size.height * 0.1),
                                                            child: Dialog(
                                                              alignment: AlignmentDirectional.bottomEnd,
                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                                              //this right here
                                                              child: Container(
                                                                height: size.height * 0.3,
                                                                width: size.width,
                                                                child: Column(
                                                                  children: <Widget>[
                                                                    Container(
                                                                      child: Padding(
                                                                        padding: EdgeInsets.only(
                                                                            right: size.width * 0.04,
                                                                            top: size.height * 0.02,
                                                                            left: size.width * 0.04),
                                                                        child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              height: size.height * 0.01,
                                                                              width: size.width * 0.03,
                                                                            ),
                                                                            // SizedBox(width: 60,),
                                                                            Text(
                                                                              'Connect by NFC',
                                                                              style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: size.height * 0.02,
                                                                                  fontFamily: 'MBold'),
                                                                            ),
                                                                            // SizedBox(width: 50,),
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
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 15,
                                                                    ),
                                                                    Image.asset(
                                                                      cnctbynfc_icon,
                                                                      height: 50,
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 15,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 10.0),
                                                                      child: Row(
                                                                        children: [
                                                                          Image.asset(
                                                                            guidline_icon,
                                                                            height: 10,
                                                                          ),
                                                                          const SizedBox(
                                                                            width: 5,
                                                                          ),
                                                                          Text(
                                                                            'Make sure that both devices are unlocked, close together &\nhave Bluetooth and location turned on. Learn more about\nNearby share.',
                                                                            style: TextStyle(
                                                                                fontSize: size.height * 0.01,
                                                                                fontFamily: 'Stf',
                                                                                color: signupclor_dark),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 15,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.only(left: 10, right: 10),
                                                                      child: GestureDetector(
                                                                        onTap: () {
                                                                          showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) => Container(
                                                                                    margin: EdgeInsets.only(bottom: size.height * 0.1),
                                                                                    child: Dialog(
                                                                                      alignment: AlignmentDirectional.bottomEnd,
                                                                                      shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(20.0)),
                                                                                      //this right here
                                                                                      child: Container(
                                                                                        alignment: Alignment.center,
                                                                                        height: size.height * 0.3,
                                                                                        width: size.width,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.only(
                                                                                              left: size.width * 0.04,
                                                                                              right: size.width * 0.04,
                                                                                              top: size.height * 0.02),
                                                                                          child: Column(
                                                                                            children: <Widget>[
                                                                                              Container(
                                                                                                child: Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      height: size.height * 0.01,
                                                                                                      width: size.width * 0.03,
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'Exchange Cards',
                                                                                                      style: TextStyle(
                                                                                                          color: Colors.black,
                                                                                                          fontSize: size.height * 0.02,
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
                                                                                              ),
                                                                                              SizedBox(
                                                                                                height: size.height * 0.03,
                                                                                              ),
                                                                                              Container(
                                                                                                width: size.width * 0.6,
                                                                                                child: Row(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      children: [
                                                                                                        Image.asset(
                                                                                                          id_icon,
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          height: size.height * 0.02,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'Assem Yamak',
                                                                                                          style: TextStyle(
                                                                                                              fontFamily: 'MBold',
                                                                                                              fontSize: size.height * 0.015),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          '6274239',
                                                                                                          style: TextStyle(
                                                                                                              fontFamily: 'Stf',
                                                                                                              fontSize: size.height * 0.015),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Container(
                                                                                                      child: Image.asset(exhngcard_icon),
                                                                                                      margin: const EdgeInsets.only(top: 10),
                                                                                                    ),
                                                                                                    Column(
                                                                                                      children: [
                                                                                                        Image.asset(
                                                                                                          id_icon,
                                                                                                        ),
                                                                                                        SizedBox(
                                                                                                          height: size.height * 0.02,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'Assem Yamak',
                                                                                                          style: TextStyle(
                                                                                                              fontFamily: 'MBold',
                                                                                                              fontSize: size.height * 0.015),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          '6274239',
                                                                                                          style: TextStyle(
                                                                                                              fontFamily: 'Stf',
                                                                                                              fontSize: size.height * 0.015),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              const SizedBox(
                                                                                                height: 30,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                                                                                child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    showDialog(
                                                                                                        context: context,
                                                                                                        builder: (BuildContext context) => Container(
                                                                                                              margin: EdgeInsets.only(
                                                                                                                  bottom: size.height * 0.1),
                                                                                                              child: Dialog(
                                                                                                                alignment:
                                                                                                                    AlignmentDirectional.bottomEnd,

                                                                                                                shape: RoundedRectangleBorder(
                                                                                                                    borderRadius:
                                                                                                                        BorderRadius.circular(20.0)),
                                                                                                                //this right here
                                                                                                                child: Container(
                                                                                                                  height: size.height * 0.32,
                                                                                                                  width: size.width,
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
                                                                                                                              Text(
                                                                                                                                'Tony is now your contact!',
                                                                                                                                style: TextStyle(
                                                                                                                                    color:
                                                                                                                                        Colors.black,
                                                                                                                                    fontSize:
                                                                                                                                        size.height *
                                                                                                                                            0.02,
                                                                                                                                    fontFamily:
                                                                                                                                        'MBold'),
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
                                                                                                                        Container(
                                                                                                                          height: size.height * 0.09,
                                                                                                                          width: size.width * 0.85,
                                                                                                                          child: TextFormField(
                                                                                                                            maxLines: 3,
                                                                                                                            decoration:
                                                                                                                                InputDecoration(
                                                                                                                                    fillColor:
                                                                                                                                        bckgrnd,
                                                                                                                                    filled: true,
                                                                                                                                    hintText:
                                                                                                                                        'Write a note',
                                                                                                                                    hintStyle: TextStyle(
                                                                                                                                        fontSize:
                                                                                                                                            size.width *
                                                                                                                                                0.04,
                                                                                                                                        color:
                                                                                                                                            infocolor),
                                                                                                                                    border:
                                                                                                                                        OutlineInputBorder(
                                                                                                                                      borderRadius:
                                                                                                                                          BorderRadius
                                                                                                                                              .circular(
                                                                                                                                                  10),
                                                                                                                                    )),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        const SizedBox(
                                                                                                                          height: 20,
                                                                                                                        ),
                                                                                                                        Padding(
                                                                                                                          padding:
                                                                                                                              const EdgeInsets.only(
                                                                                                                                  left: 10,
                                                                                                                                  right: 10),
                                                                                                                          child: Row(
                                                                                                                            mainAxisAlignment:
                                                                                                                                MainAxisAlignment
                                                                                                                                    .spaceBetween,
                                                                                                                            children: [
                                                                                                                              GestureDetector(
                                                                                                                                onTap: () {},
                                                                                                                                child: Container(
                                                                                                                                  alignment: Alignment
                                                                                                                                      .center,
                                                                                                                                  height:
                                                                                                                                      size.height *
                                                                                                                                          0.04,
                                                                                                                                  width: size.width *
                                                                                                                                      0.3,
                                                                                                                                  decoration:
                                                                                                                                      BoxDecoration(
                                                                                                                                          gradient: LinearGradient(
                                                                                                                                              begin: Alignment
                                                                                                                                                  .topLeft,
                                                                                                                                              end: Alignment
                                                                                                                                                  .bottomRight,
                                                                                                                                              colors: [
                                                                                                                                                bckgrnd,
                                                                                                                                                bckgrnd,
                                                                                                                                              ]),
                                                                                                                                          border: Border.all(
                                                                                                                                              color:
                                                                                                                                                  signupclor_dark),
                                                                                                                                          color:
                                                                                                                                              bckgrnd,
                                                                                                                                          borderRadius:
                                                                                                                                              BorderRadius.circular(
                                                                                                                                                  30)),
                                                                                                                                  child: Text(
                                                                                                                                    'Done',
                                                                                                                                    style: TextStyle(
                                                                                                                                        fontSize:
                                                                                                                                            size.height *
                                                                                                                                                0.015,
                                                                                                                                        fontFamily:
                                                                                                                                            "Msemibold",
                                                                                                                                        color:
                                                                                                                                            signupclor_dark),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Container(
                                                                                                                                alignment:
                                                                                                                                    Alignment.center,
                                                                                                                                height: size.height *
                                                                                                                                    0.04,
                                                                                                                                width:
                                                                                                                                    size.width * 0.3,
                                                                                                                                decoration:
                                                                                                                                    BoxDecoration(
                                                                                                                                        gradient: LinearGradient(
                                                                                                                                            begin: Alignment
                                                                                                                                                .topLeft,
                                                                                                                                            end: Alignment
                                                                                                                                                .bottomRight,
                                                                                                                                            colors: [
                                                                                                                                              bckgrnd,
                                                                                                                                              bckgrnd,
                                                                                                                                            ]),
                                                                                                                                        border: Border
                                                                                                                                            .all(
                                                                                                                                                color:
                                                                                                                                                    signupclor_dark),
                                                                                                                                        color:
                                                                                                                                            bckgrnd,
                                                                                                                                        borderRadius:
                                                                                                                                            BorderRadius
                                                                                                                                                .circular(
                                                                                                                                                    30)),
                                                                                                                                child: Text(
                                                                                                                                  'Skip',
                                                                                                                                  style: TextStyle(
                                                                                                                                      fontSize:
                                                                                                                                          size.height *
                                                                                                                                              0.015,
                                                                                                                                      fontFamily:
                                                                                                                                          "Msemibold",
                                                                                                                                      color:
                                                                                                                                          signupclor_dark),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
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
                                                                                                    alignment: Alignment.center,
                                                                                                    height: size.height * 0.04,
                                                                                                    width: size.width,
                                                                                                    decoration: BoxDecoration(
                                                                                                        gradient: LinearGradient(
                                                                                                            begin: Alignment.topLeft,
                                                                                                            end: Alignment.bottomRight,
                                                                                                            colors: [
                                                                                                              bckgrnd,
                                                                                                              bckgrnd,
                                                                                                            ]),
                                                                                                        border: Border.all(color: signupclor_dark),
                                                                                                        color: bckgrnd,
                                                                                                        borderRadius: BorderRadius.circular(30)),
                                                                                                    child: Text(
                                                                                                      'Exchange',
                                                                                                      style: TextStyle(
                                                                                                          fontSize: size.height * 0.015,
                                                                                                          fontFamily: 'Msemibold',
                                                                                                          color: signupclor_dark),
                                                                                                    ),
                                                                                                  ),
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
                                                                          alignment: Alignment.center,
                                                                          height: size.height * 0.04,
                                                                          width: size.width * 0.7,
                                                                          decoration: BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                  begin: Alignment.topLeft,
                                                                                  end: Alignment.bottomRight,
                                                                                  colors: [
                                                                                    bckgrnd,
                                                                                    bckgrnd,
                                                                                  ]),
                                                                              border: Border.all(color: signupclor_dark),
                                                                              color: bckgrnd,
                                                                              borderRadius: BorderRadius.circular(30)),
                                                                          child: Text(
                                                                            'Connect',
                                                                            style: TextStyle(
                                                                                fontFamily: "Msemibold",
                                                                                fontSize: size.height * 0.015,
                                                                                color: signupclor_dark),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ));
                                                },
                                                child: Image.asset(exchg_icon)),
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NearByScreen()));
                                                },
                                                child: Image.asset(nerby_icon)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Scan',
                                              style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                                            ),
                                            Text(
                                              'Exchange\n'
                                              '    NFC',
                                              style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                                            ),
                                            Text(
                                              'Nearby',
                                              style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                                            ),
                                          ],
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: SvgPicture.asset(
                con_icon,
                height: size.height * 0.07,
              ),
            ),

            // bottomItems(size, con_icon, "", pageIndex == 2 ? true : false,
            //      primaryblue, true, () {
            //   setPageIndex(2);
            // }),
            bottomItems(size, bottom_bar_card, "Cards", true, pageIndex == 3 ? prmryblue : Colors.grey, true, () {
              setPageIndex(3);
            }),
            bottomItems(size, bottom_bar_message, "Messages", true, pageIndex == 4 ? prmryblue : Colors.grey, true, () {
              setPageIndex(4);
            }),
          ],
        ),
      ),
      body: bottomPages[pageIndex],
    );
  }

  // List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  //   Size size = MediaQuery.of(context).size;
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         bottom_bar_home,
  //         height: 25,
  //       ),
  //       title: ("Home"),
  //       activeColorPrimary: prmryblue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         bottom_bar_home,
  //         height: 25,
  //       ),
  //       title: ("Expo"),
  //       activeColorPrimary: prmryblue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         con_icon,
  //         height: size.height * 0.07,
  //       ),
  //       // title: ("Home"),
  //       activeColorPrimary: prmryblue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         bottom_bar_home,
  //         height: 25,
  //       ),
  //       title: ("Cards"),
  //       activeColorPrimary: prmryblue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: SvgPicture.asset(
  //         bottom_bar_home,
  //         height: 25,
  //       ),
  //       title: ("Messages"),
  //       activeColorPrimary: prmryblue,
  //       inactiveColorPrimary: Colors.grey,
  //     ),
  //   ];
  // }

  Widget bottomItems(Size size, String icon, String title, bool textShow, Color color, bool isSvg, Function() onTap) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onTap,
            icon:
                // isSvg ?
                SvgPicture.asset(
              icon,
              height: 25,
              color: color,
            )
            // : Image.asset(
            //     icon,
            //     height: size.height * 0.04,
            //     color: color,
            //   ),
            ),
        textShow ? Text(title, style: TextStyle(color: color, fontSize: size.height * .015, fontWeight: FontWeight.w600)) : const SizedBox(),
      ],
    );
  }
}
