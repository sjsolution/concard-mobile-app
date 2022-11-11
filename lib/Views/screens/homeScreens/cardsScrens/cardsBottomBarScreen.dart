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
   CardsBottomBarScreen({Key? key,this.initialIndex}) : super(key: key);
int? initialIndex=0;

  @override
  State<CardsBottomBarScreen> createState() => _CardsBottomBarScreenState();
}

class _CardsBottomBarScreenState extends State<CardsBottomBarScreen> {
  String? isSelect;
  bool? isMore = false;
  bool? isSelctedt = false;
  bool? isRadio = false;
  bool? isIndexSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    getCardList();
  }

  getCardList() async {
    Globals.cardListModal = await CardController().cardList('0', '0');
    // print('My Card List........\n' + Globals.cardListModal.toString());
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 4,
      initialIndex:int.parse(widget.initialIndex.toString()) ,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: size.height * 0.02,
                          color: bckgrnd,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Cards',
                          style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBold", color: bckgrnd),
                        ),
                      ),
                      SizedBox(
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
                  ),
                ),
                child: Globals.cardListModal != null
                    ? Padding(
                        padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02, top: size.height * 0.02),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width * 0.65,
                                  child: Column(
                                    children: [
                                      TabBar(
                                          labelColor: primaryblue,
                                          unselectedLabelColor: Colors.grey,
                                          indicatorColor: btnclr,
                                          // labelStyle: ,
                                          isScrollable: true,
                                          tabs: [
                                            Text(
                                              'All Cards (${Globals.cardListModal!.cardListData!.allCardsCounts.toString()})',
                                              style: TextStyle(),
                                            ),
                                            Text(
                                              'Reached Concards (${Globals.cardListModal!.cardListData!.reachedCardsCounts.toString()})',
                                              style: TextStyle(),
                                            ),
                                            Text(
                                              'Favourites (${Globals.cardListModal!.cardListData!.favouriteCardsCounts.toString()})',
                                              style: TextStyle(),
                                            ),
                                            Text(
                                              'Saved Concards (${Globals.cardListModal!.cardListData!.savedCardsCounts.toString()})',
                                              style: TextStyle(),
                                            ),
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
                                      ],
                                    ),
                                    color: bckgrnd,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => showManageDialog(context),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Manage',
                                        style: TextStyle(color: bckgrnd, fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                              height: size.height,
                              child: TabBarView(
                                children: [
                                  AllCards(),
                                  ReachedCardsScreen(),
                                  FavouritesScreen(),
                                  SavedCards(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ShimmerLoadWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showManageDialog(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: size.height * 0.1),
        child: Dialog(
          alignment: AlignmentDirectional.bottomEnd,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //this right here
          child: Container(
            height: size.height * 0.18,
            width: size.width,
            child: Padding(
              padding: EdgeInsets.only(left: size.width * 0.01, right: size.width * 0.01, top: size.height * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          'Manage',
                          style: TextStyle(color: Colors.black, fontSize: size.height * 0.02, fontFamily: 'MBold'),
                        ),
                        // Spacer(),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              size: size.height * 0.025,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.01, right: size.width * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GroupsCardsScreen()));
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    grptwo_icon,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Text(
                                    'Groups',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  'Export',
                                  style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ImportCardsScreen()));
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    import_icon,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.007,
                                  ),
                                  Text(
                                    'Import',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddContactCardsScreen()));
                                  },
                                  child: SvgPicture.asset(
                                    addcntct_icon,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  'Add Contact',
                                  style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
      ),
    );
  }
}
