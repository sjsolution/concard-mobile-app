import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/CardsController/card_controller.dart';
import 'package:concard/Models/Cards/card_list_modal.dart';
import 'package:concard/Views/screens/homeScreens/addContactCardsScreen.dart';
import 'package:concard/Views/screens/homeScreens/contactsProfileViewScreen.dart';
import 'package:concard/Views/screens/homeScreens/followingCardScreen.dart';
import 'package:concard/Views/screens/homeScreens/groupsCardScreen.dart';
import 'package:concard/Views/screens/homeScreens/importCardsScreen.dart';
import 'package:concard/Views/widgets/customContainer.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:flutter_svg/svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../Constants/colors.dart';
import '../../../widgets/customButton.dart';

class AllCards extends StatefulWidget {
  AllCards({
    Key? key,
  }) : super(key: key);

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  String? isSelect;
  bool? isMore = false;
  bool? isSelctedt = false;
  bool? isRadio = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCardList('0', '0');
  }

  getCardList(String? filterBy, String? sortType) async {
    Globals.cardListModal = await CardController().cardList(filterBy, sortType);
    print('My Card List........\n' + Globals.cardListModal.toString());
    setState(() {});
  }

  String? searchValue;
  CardListModal? cardList;

  // onSearchTextChanged(String text) async {
  //   _searchResult.clear();
  //   if (text.isEmpty) {
  //     setState(() {});
  //     return;
  //   }
  //
  //   _userDetails.forEach((userDetail) {
  //     if (userDetail.firstName.contains(text) || userDetail.lastName.contains(text)) _searchResult.add(userDetail);
  //   });
  //
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.09,
              width: size.width * 0.8,
              child: TextFormField(
                onChanged: (value) {
                  cardList?.cardListData?.cards?.clear();
                  Globals.cardListModal!.cardListData!.cards!.forEach((element) {
                    if (element.companyName!.toLowerCase().contains(value)) {
                      print("available");
                      cardList?.cardListData?.cards?.add(element);
                    } else {
                      print("not available");
                    }
                    // print(element.companyName.toString());
                  });
                  // print("abc___________" + abc.toString());
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: Container(
                    height: size.height * 0.04,
                    width: size.width * 0.05,
                    child: Icon(
                      Icons.search,
                      size: size.height * 0.05,
                      color: signupclor_dark,
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search cards',
                  contentPadding: EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                  hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _settingModalBottomSheet(context);
              },
              child: Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02, right: size.width * 0.02),
                child: SvgPicture.asset(
                  sort_icon,
                  height: 20,
                ),
              ),
            ),
          ],
        ),
      
        SizedBox(
          height: size.height * 0.02,
        ),
        Visibility(
          visible: isSelctedt != isMore,
          child: Row(
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
                style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBOld"),
              ),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: size.height * 0.035,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
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
                      style: TextStyle(color: bckgrnd, fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Globals.cardListModal!.cardListData != null
            ? GestureDetector(
                onLongPress: () {
                  setState(() {
                    // isRadio=true;
                  });
                },
                child: Container(
                  height: size.height * 0.8,
                  width: size.width,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    itemCount: Globals.cardListModal!.cardListData!.cards!.length,
                    itemBuilder: (context, index) {
                      return Globals.cardListModal!.cardListData!.cards != null
                          ? InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ContactProfileViewScreen(
                                              id: Globals.cardListModal!.cardListData!.cards![index].id.toString(),
                                            )));
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Visibility(
                                            visible: isRadio!,
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 19,
                                                  child: Radio(
                                                    toggleable: false,
                                                    value: index.toString(),
                                                    groupValue: isSelect,
                                                    onChanged: (dynamic newValue) => setState(() => isSelect = newValue),
                                                    activeColor: signupclor_light,
                                                    // selected: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.04,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                height: size.height * 0.1,
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: Image.asset(
                                                          deccard,
                                                          height: size.height * 0.08,
                                                          fit: BoxFit.cover,
                                                        )),
                                                    Padding(
                                                        padding: EdgeInsets.only(
                                                            right: size.width * 0.01, left: size.width * 0.02, top: size.height * 0.015),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    SvgPicture.asset(
                                                                      con_icon,
                                                                      height: size.height * 0.02,
                                                                    ),
                                                                    const SizedBox(height: 5 //size.height * 0.015,
                                                                        ),
                                                                    Text(
                                                                      "CONCARD",
                                                                      style: TextStyle(
                                                                        fontSize: size.height * 0.003,
                                                                        color: signupclor_dark,
                                                                        fontFamily: "Mbold",
                                                                        letterSpacing: 2,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: size.height * 0.004,
                                                                    ),
                                                                    PrettyQr(
                                                                      typeNumber: 4,
                                                                      size: size.height * 0.01,
                                                                      data:
                                                                          '${Globals.cardListModal!.cardListData!.cards![index].user!.id.toString() ?? "0"}',
                                                                      errorCorrectLevel: QrErrorCorrectLevel.M,
                                                                      roundEdges: true,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(width: size.width * 0.01),
                                                                Container(
                                                                  height: size.height * 0.06,
                                                                  width: 1,
                                                                  color: cgreen,
                                                                ),
                                                                SizedBox(width: size.width * 0.02),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      "${Globals.cardListModal!.cardListData!.cards![index].username.toString() ?? ''}",
                                                                      style: TextStyle(
                                                                        fontSize: size.height * 0.007,
                                                                        color: signupclor_dark,
                                                                        fontFamily: "Mbold",
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "${Globals.cardListModal!.cardListData!.cards![index].jobTitle.toString() ?? ''}",
                                                                      style: TextStyle(
                                                                        fontSize: size.height * 0.007,
                                                                        color: signupclor_dark,
                                                                        fontFamily: "Stf",
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 1 //size.height * 0.01,
                                                                        ),
                                                                    Row(
                                                                      children: [
                                                                        Column(children: [
                                                                          SvgPicture.asset(
                                                                            location_icon,
                                                                            height: size.height * 0.006,
                                                                          ),
                                                                        ]),
                                                                        const SizedBox(
                                                                          width: 1, //size.width * 0.015,
                                                                        ),
                                                                        Column(children: [
                                                                          SizedBox(
                                                                            width: size.width * 0.15,
                                                                            child: Text(
                                                                              "${Globals.cardListModal!.cardListData!.cards![index].address.toString()}",
                                                                              style: TextStyle(
                                                                                fontSize: size.height * 0.006,
                                                                                color: signupclor_dark,
                                                                                fontFamily: "Mbold",
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ]),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: size.height * 0.001,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                          phonecall_icon,
                                                                          height: size.height * 0.006,
                                                                        ),
                                                                        SizedBox(
                                                                          width: size.width * 0.01,
                                                                        ),
                                                                        SizedBox(
                                                                          width: size.width * 0.15,
                                                                          child: Text(
                                                                            Globals.cardListModal!.cardListData!.cards![index].mobileNo ?? '',
                                                                            style: TextStyle(
                                                                              fontSize: size.height * 0.006,
                                                                              color: signupclor_dark,
                                                                              fontFamily: "Mbold",
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: size.height * 0.001,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Image.asset(
                                                                          email_icon,
                                                                          height: size.height * 0.005,
                                                                          color: signupclor_dark,
                                                                        ),
                                                                        SizedBox(
                                                                          width: size.width * 0.01,
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: size.width * 0.15,
                                                                              child: Text(
                                                                                Globals.cardListModal!.cardListData!.cards![index].email.toString() ??
                                                                                    '',
                                                                                style: TextStyle(
                                                                                  fontSize: size.height * 0.004,
                                                                                  color: signupclor_dark,
                                                                                  fontFamily: "Mbold",
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: size.height * 0.001,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                          internet_icon,
                                                                          height: size.height * 0.005,
                                                                        ),
                                                                        SizedBox(
                                                                          width: size.width * 0.01,
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: size.width * 0.15,
                                                                              child: Text(

                                                                                "${Globals.cardListModal!.cardListData!.cards![index].username}",
                                                                                style: TextStyle(
                                                                                  fontSize: size.height * 0.006,
                                                                                  color: signupclor_dark,
                                                                                  fontFamily: "Mbold",
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: size.width * 0.05,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                Globals.cardListModal!.cardListData!.cards![index].companyName!=null?
                                                Globals.cardListModal!.cardListData!.cards![index].companyName.toString():'',
                                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold"),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              Text(
                                                Globals.cardListModal!.cardListData!.cards![index].jobTitle!=null?
                                                Globals.cardListModal!.cardListData!.cards![index].jobTitle.toString():'',
                                                style: TextStyle(fontSize: size.height * 0.01, fontFamily: "Msemibold", color: infocolor),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                Globals.cardListModal!.cardListData!.cards![index].companyName!=null?
                                                Globals.cardListModal!.cardListData!.cards![index].companyName.toString():'',
                                                style: TextStyle(fontSize: size.height * 0.01, fontFamily: "Msemibold", color: infocolor),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            _optionsModalBottomSheet(context, Globals.cardListModal!.cardListData!.cards![index]);
                                            setState(() {
                                              isMore = true;
                                            });
                                          },
                                          child: Visibility(
                                              visible: isMore != true,
                                              child: Icon(
                                                Icons.more_vert,
                                                color: signupclor_dark,
                                              )))
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : const Center(
                              child: Text('There is no card'),
                            );
                    },
                  ),
                ),
              )
            : const ShimmerLoadWidget(),
      ],
    );
  }

  void _optionsModalBottomSheet(context, Cards? cards) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
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
                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  // CardController().favouriteCardList(cards!.id.toString());
                                  // setSte(() {
                                  //   if (cards.isFavourite == true) {
                                  //     cards.isFavourite = false;
                                  //   } else {
                                  //     cards.isFavourite = true;
                                  //   }
                                  // });
                                  // setState(() {
                                  //   debugPrint('Status updated SuccessFully');
                                  // });
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      favoutline_icon,
                                      color: cards!.isFavourite! == true ? Colors.red : signupclor_dark,
                                      height: size.height * 0.03,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.008,
                                    ),
                                    Text(
                                      'Favorites',
                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                            padding: EdgeInsets.only(left: size.width * 0.01, right: size.width * 0.02),
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
                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
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
    var sortType = '0';
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, setSte) {
                return Padding(
                    padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02, top: size.height * 0.02),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Wrap(
                        children: <Widget>[
                          Text(
                            'Sort by',
                            style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Mbold'),
                          ),
                          Row(
                            children: [
                              Radio(
                                  activeColor: primarygreen,
                                  value: '0',
                                  groupValue: sortType,
                                  onChanged: (dynamic value) {
                                    setSte(() {
                                      setState(() {
                                        sortType = value;
                                        print(value);
                                      });
                                    });
                                  }),
                              Text(
                                'by Name',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  activeColor: primarygreen,
                                  value: '1',
                                  groupValue: sortType,
                                  onChanged: (dynamic value) {
                                    setSte(() {
                                      setState(() {
                                        sortType = value;
                                        print(value);
                                      });
                                    });
                                  }),
                              Text(
                                'by Date',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  activeColor: primarygreen,
                                  value: '2',
                                  groupValue: sortType,
                                  onChanged: (dynamic value) {
                                    setSte(() {
                                      setState(() {
                                        sortType = value;
                                        print(value);
                                      });
                                    });
                                  }),
                              Text(
                                'by Company Name',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'Filter by',
                            style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Mbold'),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient:
                                  LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [gradientgreen, primarygreen]),
                            ),
                            height: size.height * 0.05,
                            width: size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Supplier',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: Colors.white),
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
                              gradient:
                                  LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [gradientgreen, primarygreen]),
                            ),
                            height: size.height * 0.05,
                            width: size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Managment',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: Colors.white),
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
                                  colors: [infocolor.withOpacity(0.3), infocolor.withOpacity(0.3)]),
                            ),
                            height: size.height * 0.05,
                            width: size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Select Country',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: Colors.white),
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
                                  colors: [infocolor.withOpacity(0.3), infocolor.withOpacity(0.3)]),
                            ),
                            height: size.height * 0.05,
                            width: size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Select Position',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: Colors.white),
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
                                  colors: [infocolor.withOpacity(0.3), infocolor.withOpacity(0.3)]),
                            ),
                            height: size.height * 0.05,
                            width: size.width,
                            child: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Selcet Product & Services',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: Colors.white),
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
                            child: InkWell(
                              onTap: () async {
                                //sort by filters api => by name
                                // Globals.cardListModal =
                                //     await CardController().cardList('0', '0');
                                getCardList('0', sortType);
                                Navigator.pop(context);
                                setSte(() {
                                  setState(() {});
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: size.height * 0.05,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
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
                                    style:
                                        TextStyle(color: bckgrnd, fontSize: size.height * 0.02, fontWeight: FontWeight.bold, fontFamily: 'Msemibold'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          )
                        ],
                      ),
                    ]));
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
      //                           "${individualProfileModel.profileData!.firstName ?? ''} ${individualProfileModel.profileData!.lastName ?? ''}",
      //                           style: TextStyle(
      //                             fontSize: size.height * 0.013,
      //                             color: signupclor_dark,
      //                             fontFamily: "Mbold",
      //                           ),
      //                         ),
      //                         Text(
      //                           "${individualProfileModel.profileData!.jobTitle ?? ''}",
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
      //                                   "${individualProfileModel.profileData!.address}",
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
      //                               individualProfileModel
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
      //                                     individualProfileModel
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
      //                                     "${individualProfileModel.profileData!.website}",
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
