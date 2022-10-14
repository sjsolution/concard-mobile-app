import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/CardsController/card_controller.dart';
import 'package:concard/Models/Cards/card_list_modal.dart';
import 'package:concard/Views/screens/homeScreens/addContactCardsScreen.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/allCards.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/favouritescards.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/reachedCards.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/savedCards.dart';
import 'package:concard/Views/screens/homeScreens/contactsProfileViewScreen.dart';
import 'package:concard/Views/screens/homeScreens/followingCardScreen.dart';
import 'package:concard/Views/screens/homeScreens/groupsCardScreen.dart';
import 'package:concard/Views/screens/homeScreens/importCardsScreen.dart';
import 'package:concard/Views/widgets/customContainer.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:flutter_svg/svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../Constants/colors.dart';
import '../../../widgets/customButton.dart';

class CardsBottomBarScreen extends StatefulWidget {
  @override
  State<CardsBottomBarScreen> createState() => _CardsBottomBarScreenState();
}

class _CardsBottomBarScreenState extends State<CardsBottomBarScreen> {
  String? isSelect;
  bool? isMore = false;
  bool? isSelctedt = false;
  bool? isRadio = false;
  bool? isIndexSelected=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCardList();
  }

  getCardList() async {
    Globals.cardListModal = await CardController().cardList('0','0');
    print('My Card List........\n' + Globals.cardListModal.toString());
    setState(() {});
  }
 

 


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      
      length: 4,
      initialIndex: 0,
      child: Scaffold(
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
                      alignment: Alignment.center,
                      child: Text(
                        'Cards',
                        style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "MBold",
                            color: bckgrnd),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: 5,
                    )
                  ],
                ),
              ),
            ),

           
            Container(
              margin: EdgeInsets.only(top: size.height * 0.13),
              // height: size.height * 1.0,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child:  Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.02,
                    right: size.width * 0.02,
                    top: size.height * 0.02),
                child: Globals.cardListModal!= null? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width*0.65,
                          child: Column(
                            children: [
                              TabBar(
                                labelColor: primaryblue,
                                unselectedLabelColor: Colors.grey,
                                indicatorColor: btnclr,
                                
                                // labelStyle: ,
                                
              isScrollable: true,
              tabs: [
                
              Text('All Cards (${Globals.cardListModal!.cardListData!.allCardsCounts.toString()})',style: TextStyle(
                
              ),),
              Text('Reached Concards (${Globals.cardListModal!.cardListData!.reachedCardsCounts.toString()})',style: TextStyle(
              ),),
              Text('Favourites (${Globals.cardListModal!.cardListData!.favouriteCardsCounts.toString()})',style: TextStyle(
              ),),
              Text('Saved Concards (${Globals.cardListModal!.cardListData!.savedCardsCounts.toString()})',style: TextStyle(
              ),),

            ]),

            
                            ],
                          ),
                        ),

                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: size.height * 0.035,
                          width: size.width * 0.2,
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
                                                  BorderRadius.circular(10)),
                                          //this right here
                                          child: Container(
                                            height: size.height * 0.18,
                                            width: size.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.01,
                                                  right: size.width * 0.01,
                                                  top: size.height * 0.02),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          height:
                                                              size.height * 0.01,
                                                          width:
                                                              size.width * 0.03,
                                                        ),
                                                        Text(
                                                          'Manage',
                                                          style: TextStyle(
                                                              color: Colors.black,
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
                                                            child: Icon(
                                                              Icons.close,
                                                              size: size.height *
                                                                  0.025,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.015),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left:
                                                                size.width * 0.01,
                                                            right: size.width *
                                                                0.01),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            GroupsCardsScreen()));
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    grptwo_icon,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        size.height *
                                                                            0.01,
                                                                  ),
                                                                  Text(
                                                                    'Groups',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            size.height *
                                                                                0.015,
                                                                        fontFamily:
                                                                            "Stf"),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                SvgPicture.asset(
                                                                  export_icon,
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      size.height *
                                                                          0.01,
                                                                ),
                                                                Text(
                                                                  'Export',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          size.height *
                                                                              0.015,
                                                                      fontFamily:
                                                                          "Stf"),
                                                                ),
                                                              ],
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            ImportCardsScreen()));
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    import_icon,
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        size.height *
                                                                            0.007,
                                                                  ),
                                                                  Text(
                                                                    'Import',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            size.height *
                                                                                0.015,
                                                                        fontFamily:
                                                                            "Stf"),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (BuildContext context) =>
                                                                                  AddContactCardsScreen()));
                                                                    },
                                                                    child:
                                                                        SvgPicture
                                                                            .asset(
                                                                      addcntct_icon,
                                                                    )),
                                                                SizedBox(
                                                                  height:
                                                                      size.height *
                                                                          0.01,
                                                                ),
                                                                Text(
                                                                  'Add Contact',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          size.height *
                                                                              0.015,
                                                                      fontFamily:
                                                                          "Stf"),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
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
                              child: Text(
                                'Manage',
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
                      height: size.height*0.02,
                    ),
                    Container(
                      height: size.height,
                      child: TabBarView(children: [

                        AllCards(),
                        
                        ReachedCardsScreen(),
                        
                        
                        FavouritesScreen(),
                        
                        SavedCards(),
                      ]),
                    )
                  ],
                ):ShimmerLoadWidget(),
              ),
            ),
          ],
        ),
      )),
    );
  }

  void _optionsModalBottomSheet(context, Cards? cards) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return SizedBox(
                height: size.height * 0.26,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  'Options',
                                  style: TextStyle(
                                    fontFamily: "MBold",
                                    fontSize: size.height * 0.018,
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        setSte(() {
                                          isMore = false;
                                          isRadio=false;
                                        });
                                      });
                                    },
                                    child: Icon(Icons.close)),
                              ]),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  SvgPicture.asset(
                                    grptwo_icon,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    'Groups',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    msgs_icon,
                                    color: signupclor_dark,
                                    height: size.height * 0.04,
                                  ),
                                  Text(
                                    'Message',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    email_icon,
                                    color: signupclor_dark,
                                    height: size.height * 0.04,
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  CardController().favouriteCardList(cards!.id.toString());
                                  setState(() {
                                    setSte((){
                                      
                                    });
                                  });
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      favoutline_icon,
                                      color: signupclor_dark,
                                      height: size.height * 0.03,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.008,
                                    ),
                                    Text(
                                      'Favourites',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Stf"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.01,
                                right: size.width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      share_icon,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.022,
                                    ),
                                    Text(
                                      'Share',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Stf"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      reminder,
                                      color: signupclor_dark,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.013,
                                    ),
                                    Text(
                                      'Reminder',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Stf"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      meeting,
                                      color: signupclor_dark,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      'Meeting',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Stf"),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      recyclebin_icon,
                                      color: signupclor_dark,
                                      height: size.height * 0.03,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.025,
                                    ),
                                    Text(
                                      'Delete',
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Stf"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
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

  void _settingModalBottomSheet(context) {
    bool? isName = false;
    bool? isDate = false;
    bool? isComp = false;
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, setSte) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.02,
                      right: size.width * 0.02,
                      top: size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: <Widget>[
                          Text(
                            'Sort by',
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontFamily: 'Mbold'),
                          ),
                          new ListTile(
                              minLeadingWidth: 5,
                              leading: Checkbox(
                                checkColor: Colors.white,
                                overlayColor:
                                    MaterialStateProperty.all(infocolor),
                                fillColor: MaterialStateProperty.all(txtcolr),
                                value: isName,
                                shape: CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    setSte(() {
                                      isName = value!;
                                    });
                                  });
                                },
                              ),
                              title: new Text(
                                'by Name',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Msemibold"),
                              ),
                              onTap: () => {}),
                          new ListTile(
                            leading: Checkbox(
                              checkColor: Colors.white,
                              hoverColor: infocolor,
                              fillColor: MaterialStateProperty.all(txtcolr),
                              value: isDate,
                              shape: CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isDate = value!;
                                });
                              },
                            ),
                            title: new Text(
                              'by Date',
                              style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Msemibold"),
                            ),
                            onTap: () => {},
                          ),
                          new ListTile(
                            leading: Checkbox(
                              checkColor: Colors.white,
                              hoverColor: infocolor,
                              fillColor: MaterialStateProperty.all(txtcolr),
                              value: isComp,
                              shape: CircleBorder(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isComp = value!;
                                });
                              },
                            ),
                            title: new Text(
                              'by Company name',
                              style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Msemibold"),
                            ),
                            onTap: () => {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Filter by',
                        style: TextStyle(
                            fontSize: size.height * 0.02, fontFamily: 'Mbold'),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [gradientgreen, primarygreen]),
                        ),
                        height: size.height * 0.05,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.04,
                              right: size.width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Supplier',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "MBold",
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Image.asset(
                                downarrow_icon,
                                color: bckgrnd,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [gradientgreen, primarygreen]),
                        ),
                        height: size.height * 0.05,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.04,
                              right: size.width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Managment',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "MBold",
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Image.asset(
                                downarrow_icon,
                                color: bckgrnd,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                infocolor.withOpacity(0.3),
                                infocolor.withOpacity(0.3)
                              ]),
                        ),
                        height: size.height * 0.05,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.04,
                              right: size.width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Select Country',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "MBold",
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Image.asset(
                                downarrow_icon,
                                color: bckgrnd,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                infocolor.withOpacity(0.3),
                                infocolor.withOpacity(0.3)
                              ]),
                        ),
                        height: size.height * 0.05,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.04,
                              right: size.width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Select Position',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "MBold",
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Image.asset(
                                downarrow_icon,
                                color: bckgrnd,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                infocolor.withOpacity(0.3),
                                infocolor.withOpacity(0.3)
                              ]),
                        ),
                        height: size.height * 0.05,
                        width: size.width,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.04,
                              right: size.width * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Selcet Product & Services',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "MBold",
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Image.asset(
                                downarrow_icon,
                                color: bckgrnd,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          height: size.height * 0.05,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    signupclor_light,
                                    signupclor_dark,
                                  ]),
                              border: Border.all(color: Colors.grey),
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            // margin: EdgeInsets.only(left: size.width*0.04),
                            alignment: Alignment.center,
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                  color: bckgrnd,
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Msemibold'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }

  Widget cardWidget(context, CardListModal? cardListModal) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.29,
      // margin:const EdgeInsets.all(0.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      // child: Stack(
      //   children: [
      //     ClipRRect(
      //         borderRadius: BorderRadius.circular(20),
      //         child: Image.asset(
      //           deccard,
      //           height: size.height * 0.30,
      //           fit: BoxFit.cover,
      //         )),
      //     Padding(
      //       padding: EdgeInsets.only(right: size.width * 0.01),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Icon(
      //             Icons.arrow_back_ios_new,
      //             color: Colors.black,
      //             size: size.height * 0.018,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.only(
      //               top: size.height * 0.047,
      //               left: size.width * 0.02,
      //             ),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   children: [
      //                     Column(
      //                       children: [
      //                         SvgPicture.asset(con_icon),
      //                         const SizedBox(height: 10 //size.height * 0.015,
      //                             ),
      //                         Text(
      //                           "CONCARD",
      //                           style: TextStyle(
      //                             fontSize: size.height * 0.016,
      //                             color: signupclor_dark,
      //                             fontFamily: "Mbold",
      //                             letterSpacing: 5,
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: size.height * 0.015,
      //                         ),
      //                         PrettyQr(
      //                           typeNumber: 4,
      //                           size: size.height * 0.06,
      //                           data:
      //                               '${cardListModal!.data?? "0"}',
      //                           errorCorrectLevel: QrErrorCorrectLevel.M,
      //                           roundEdges: true,
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(width: size.width * 0.03),
      //                     Container(
      //                       height: size.height * 0.2,
      //                       width: 1,
      //                       color: cgreen,
      //                     ),
      //                     SizedBox(width: size.width * 0.08),
      //                     Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           "${indiviualProfileModel.profileData!.firstName ?? ''} ${indiviualProfileModel.profileData!.lastName ?? ''}",
      //                           style: TextStyle(
      //                             fontSize: size.height * 0.013,
      //                             color: signupclor_dark,
      //                             fontFamily: "Mbold",
      //                           ),
      //                         ),
      //                         Text(
      //                           "${indiviualProfileModel.profileData!.jobTitle ?? ''}",
      //                           style: TextStyle(
      //                             fontSize: size.height * 0.015,
      //                             color: signupclor_dark,
      //                             fontFamily: "Stf",
      //                           ),
      //                         ),
      //                         const SizedBox(height: 8 //size.height * 0.01,
      //                             ),
      //                         Row(
      //                           children: [
      //                             Column(children: [
      //                               SvgPicture.asset(location_icon),
      //                             ]),
      //                             const SizedBox(
      //                               width: 4, //size.width * 0.015,
      //                             ),
      //                             Container(
      //                               width: size.width * .35,
      //                               child: Column(children: [
      //                                 Text(
      //                                   "${indiviualProfileModel.profileData!.address}",
      //                                   style: TextStyle(
      //                                     fontSize: size.height * 0.015,
      //                                     color: signupclor_dark,
      //                                     fontFamily: "Mbold",
      //                                   ),
      //                                 ),
      //                               ]),
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: size.height * 0.015,
      //                         ),
      //                         Row(
      //                           children: [
      //                             SvgPicture.asset(phonecall_icon),
      //                             SizedBox(
      //                               width: size.width * 0.02,
      //                             ),
      //                             Text(
      //                               indiviualProfileModel
      //                                       .profileData!.mobileNumber ??
      //                                   '',
      //                               style: TextStyle(
      //                                 fontSize: size.height * 0.015,
      //                                 color: signupclor_dark,
      //                                 fontFamily: "Mbold",
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: size.height * 0.015,
      //                         ),
      //                         Row(
      //                           children: [
      //                             Image.asset(
      //                               email_icon,
      //                               color: signupclor_dark,
      //                             ),
      //                             SizedBox(
      //                               width: size.width * 0.01,
      //                             ),
      //                             Container(
      //                               width: size.width * .35,
      //                               child: Column(
      //                                 children: [
      //                                   Text(
      //                                     indiviualProfileModel
      //                                             .profileData!.email ??
      //                                         '',
      //                                     style: TextStyle(
      //                                       fontSize: size.height * 0.012,
      //                                       color: signupclor_dark,
      //                                       fontFamily: "Mbold",
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           height: size.height * 0.015,
      //                         ),
      //                         Row(
      //                           children: [
      //                             SvgPicture.asset(internet_icon),
      //                             SizedBox(
      //                               width: size.width * 0.02,
      //                             ),
      //                             Container(
      //                               width: size.width * .35,
      //                               child: Column(
      //                                 children: [
      //                                   Text(
      //                                     "${indiviualProfileModel.profileData!.website}",
      //                                     style: TextStyle(
      //                                       fontSize: size.height * 0.015,
      //                                       color: signupclor_dark,
      //                                       fontFamily: "Mbold",
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           ],
      //                         )
      //                       ],
      //                     ),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //           Icon(
      //             Icons.arrow_forward_ios,
      //             color: Colors.black,
      //             size: size.height * 0.02,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
