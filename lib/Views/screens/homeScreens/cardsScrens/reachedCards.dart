import 'package:concard/Constants/Colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/CardsController/card_controller.dart';
import 'package:concard/Views/screens/homeScreens/contactsProfileViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../Models/Cards/card_list_modal.dart';
import '../../../widgets/shimmer_widgets.dart';

class ReachedCardsScreen extends StatefulWidget {
  ReachedCardsScreen({Key? key}) : super(key: key);

  @override
  State<ReachedCardsScreen> createState() => _ReachedCardsScreenState();
}

class _ReachedCardsScreenState extends State<ReachedCardsScreen> {
  getCardList() async {
    Globals.cardListModal = await CardController().cardList('1', '');
    print('My Card List........\n' + Globals.cardListModal.toString());
    setState(() {});
  }

  String? isSelect;
  bool? isMore = false;
  bool? isSelctedt = false;
  bool? isRadio = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Globals.cardListModal!.cardListData!=null?  Column(
        children: [
          Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: size.height * 0.09,
                          width: size.width * 0.8,
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
                              prefixIcon: Icon(Icons.search,size: size.height*0.05,color: signupclor_dark,),
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
                        prefixIcon: Icon(
                          Icons.search,
                          size: size.height * 0.05,
                          color: signupclor_dark,
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
                      child: SvgPicture.asset(
                        sort_icon,
                        height: 20,
                      )),
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
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Globals.cardListModal!.cardListData != null
                        ? GestureDetector(
                          onLongPress: (){
    
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
                                      builder: (_) =>
                                           ContactProfileViewScreen(id: Globals.cardListModal!.cardListData!.cards![index].id.toString(),)));
                            },
                                        child: Column(
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
                                                                                '${Globals.cardListModal!.cardListData!.cards![index].userId.toString() ?? "0"}',
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
                                                                              PrettyQr(
                                                                                typeNumber:
                                                                                    4,
                                                                                size: size
                                                                                        .height *
                                                                                    0.01,
                                                                                data:
                                                                                    '${Globals.cardListModal!.cardListData!.cards![index].userId.toString() ?? "0"}',
                                                                                errorCorrectLevel:
                                                                                    QrErrorCorrectLevel
                                                                                        .M,
                                                                                roundEdges:
                                                                                    true,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height: size.height * 0.001,
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "${Globals.cardListModal!.cardListData!.cards![index].username.toString() ?? ''}",
                                                                                style:
                                                                                    TextStyle(
                                                                                  fontSize:
                                                                                      size.height *
                                                                                          0.007,
                                                                                  color:
                                                                                      signupclor_dark,
                                                                                  fontFamily:
                                                                                      "Mbold",
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                "${Globals.cardListModal!.cardListData!.cards![index].jobTitle.toString() ?? ''}",
                                                                                style:
                                                                                    TextStyle(
                                                                                  fontSize:
                                                                                      size.height *
                                                                                          0.007,
                                                                                  color:
                                                                                      signupclor_dark,
                                                                                  fontFamily:
                                                                                      "Stf",
                                                                                ),
                                                                              ),
                                                                              const SizedBox(
                                                                                  height:
                                                                                      1 //size.height * 0.01,
                                                                                  ),
                                                                              Row(
                                                                                children: [
                                                                                  Column(
                                                                                      children: [
                                                                                        SvgPicture.asset(
                                                                                          location_icon,
                                                                                          height: size.height * 0.006,
                                                                                        ),
                                                                                      ]),
                                                                                  const SizedBox(
                                                                                    width:
                                                                                        1, //size.width * 0.015,
                                                                                  ),
                                                                                  Column(
                                                                                      children: [
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
                                                                                width: size.width * 0.01,
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: size.width *
                                                                                        0.15,
                                                                                    child:
                                                                                        Text(
                                                                                      Globals.cardListModal!.cardListData!.cards![index].mobileNo ??
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
                                                                              SizedBox(
                                                                                height: size
                                                                                        .height *
                                                                                    0.001,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Image
                                                                                      .asset(
                                                                                    email_icon,
                                                                                    height: size.height *
                                                                                        0.005,
                                                                                    color:
                                                                                        signupclor_dark,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: size.width *
                                                                                        0.01,
                                                                                  ),
                                                                                  Column(
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width:
                                                                                            size.width * 0.15,
                                                                                        child:
                                                                                            Text(
                                                                                          Globals.cardListModal!.cardListData!.cards![index].email.toString() ?? '',
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
                                                                                width: size.width * 0.01,
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  SizedBox(
                                                                                    width: size.width *
                                                                                        0.01,
                                                                                  ),
                                                                                  Column(
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width:
                                                                                            size.width * 0.15,
                                                                                        child:
                                                                                            Text(
                                                                                          "${Globals.cardListModal!.cardListData!.cards![index].website}",
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
                                                      Globals.cardListModal!.cardListData!.cards![index].companyName.toString(),
                                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold"),
                                                    ),
                                                    SizedBox(
                                                      height: size.height * 0.02,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                         Globals.cardListModal!.cardListData!.cards![index].companyName!=null?
                                                Globals.cardListModal!.cardListData!.cards![index].companyName.toString():'',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  size.height * 0.015,
                                                              fontFamily: "MBold"),
                                                        ),
                                                        SizedBox(
                                                          height: size.height * 0.02,
                                                        ),
                                                        Text(
                                                         Globals.cardListModal!.cardListData!.cards![index].jobTitle!=null?
                                                Globals.cardListModal!.cardListData!.cards![index].jobTitle.toString():'',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  size.height * 0.01,
                                                              fontFamily: "Msemibold",
                                                              color: infocolor),
                                                        ),
                                                        SizedBox(
                                                          height: size.height * 0.01,
                                                        ),
                                                        Text(
                                                         Globals.cardListModal!.cardListData!.cards![index].companyName!=null?
                                                Globals.cardListModal!.cardListData!.cards![index].companyName.toString():'',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  size.height * 0.01,
                                                              fontFamily: "Msemibold",
                                                              color: infocolor),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                               
                                               Spacer(),
                                                InkWell(
                                                    onTap: () {
                                                      _optionsModalBottomSheet(
                                                          context,Globals.cardListModal!.cardListData!.cards![index]);
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
          )
        : ShimmerLoadWidget();
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
                                      isRadio = false;
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
                                  CardController().favouriteCardList(cards!.id.toString());
                                  setState(() {
                                    setSte(() {});
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
                  padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02, top: size.height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: <Widget>[
                          Text(
                            'Sort by',
                            style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Mbold'),
                          ),
                          new ListTile(
                              minLeadingWidth: 5,
                              leading: Checkbox(
                                checkColor: Colors.white,
                                overlayColor: MaterialStateProperty.all(infocolor),
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
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
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
                              style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
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
                              style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold"),
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
                        style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Mbold'),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [gradientgreen, primarygreen]),
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
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [gradientgreen, primarygreen]),
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
                              style: TextStyle(color: bckgrnd, fontSize: size.height * 0.02, fontWeight: FontWeight.bold, fontFamily: 'Msemibold'),
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
}
