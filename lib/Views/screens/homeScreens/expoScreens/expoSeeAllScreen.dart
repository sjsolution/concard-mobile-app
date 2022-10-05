import 'package:concard/Controllers/ExpoController/expo_badge_controller.dart';
import 'package:concard/Views/screens/homeScreens/expoScreens/expoDetailsScreen.dart';
import 'package:concard/Views/widgets/loader_widget.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import '../../../../Controllers/ExpoController/expo_badge_controller.dart';
import '../../../widgets/customButton.dart';
import 'package:concard/Constants/globals.dart' as Globals;

class ExpoSeeAllScreen extends StatefulWidget {
  ExpoSeeAllScreen({Key? key, required this.textType}) : super(key: key);
// List<ListData>? expoFilterListModal;
// String? isNearby;
// String? isOngoing;
// String? isUpcoming;
  String? textType;
  @override
  State<ExpoSeeAllScreen> createState() => _ExpoSeeAllScreenState();
}

class _ExpoSeeAllScreenState extends State<ExpoSeeAllScreen> {
  @override
  void initState() {
    super.initState();
    getFilterList(widget.textType!.toLowerCase());
  }

  getFilterList(String? expoType) async {
    Globals.expoFilterListModal=null;
    Globals.expoFilterListModal =
        await ExpoController().expoBadgeFilter(expoType);
    // print('12344.............' + Globals.expoFilterListModal.toString());
    setState(() {});
  }

  bool? isLocation = false;
  bool? isCatgry = false;
  bool? filterLocation = false;
  bool? filterCatgry = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
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
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                expo_icon,
                                height: size.height * 0.025,
                                color: bckgrnd,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                'Expo',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: "MBold",
                                    color: bckgrnd),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                notify_icon,
                                height: 30,
                              ),
                            ],
                          )
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
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.04),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // widget.isTop.toString()=='Top'?
                        Text(
                          widget.textType.toString().toUpperCase(),
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: "MBold"),
                        ),
                        //:widget.isNearby.toString()=='Nearby'? Text(
                        //     'NearBy',
                        //     style: TextStyle(
                        //       fontSize: size.height * 0.018,
                        //       fontFamily: "MBold"
                        //     ),
                        //   ):widget.isOngoing.toString()=='Ongoing'?Text(
                        //     'Ongoing',
                        //     style: TextStyle(
                        //       fontSize: size.height * 0.018,
                        //       fontFamily: "MBold"
                        //     ),
                        //   ):widget.isUpcoming.toString()=='Upcoming'?Text(
                        //     'Upcoming',
                        //     style: TextStyle(
                        //       fontSize: size.height * 0.018,
                        //       fontFamily: "MBold"
                        //     ),
                        //   ):Text(''),
                        Spacer(),
                        Visibility(
                          visible: filterLocation = true,
                          child: Container(
                            height: size.height * 0.03,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: infocolor.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.02,
                                  left: size.width * 0.04),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'filter by Location',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: size.height * 0.02,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: filterCatgry!,
                          child: Container(
                            height: size.height * 0.03,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: infocolor.withOpacity(0.3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.02,
                                  left: size.width * 0.04),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'filter by categories',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: size.height * 0.02,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                        GestureDetector(
                            onTap: () {
                              _settingModalBottomSheet(context);
                            },
                            child: SvgPicture.asset(
                              filter_icon,
                              height: size.height * 0.02,
                            ))
                      ],
                    ),
                    Globals.expoFilterListModal != null
                        ? Container(
                            child: GestureDetector(
                             
                              child: Globals.expoFilterListModal!.data!.list!
                                      .isNotEmpty
                                  ? ListView.builder(
                                      padding: const EdgeInsets.all(0),
                                      scrollDirection: Axis.vertical,
                                      itemCount: Globals.expoFilterListModal!
                                          .data!.list!.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                           onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ExpoDetailsScreen(id: Globals.expoFilterListModal!.data!.list![index].id.toString(),)));
                              },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: size.height * 0.02),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: size.height * 0.025,
                                                 backgroundImage: NetworkImage( Globals
                                                                  .expoFilterListModal!
                                                                  .data!
                                                                  .list![index].image.toString()),
                                                  backgroundColor: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.03,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Globals
                                                          .expoFilterListModal!
                                                          .data!
                                                          .list![index]
                                                          .badgeName
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height * 0.015,
                                                          fontFamily:
                                                              "Msemibold"),
                                                    ),
                                                    Text(
                                                      Globals
                                                                  .expoFilterListModal!
                                                                  .data!
                                                                  .list![index]
                                                                  .location !=
                                                              null
                                                          ? Globals
                                                              .expoFilterListModal!
                                                              .data!
                                                              .list![index]
                                                              .location!
                                                          : '',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height * 0.012,
                                                          fontFamily: "Stf",
                                                          color: infocolor),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_sharp,
                                                      size: size.height * 0.02,
                                                      color: infocolor,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      })
                                  : const Center(
                                      child: Text("There is no expo")),
                            ),
                            margin: EdgeInsets.only(
                              top: size.height * 0.02,
                            ),
                            height: size.height * 1.0,
                            width: size.width,
                          )
                        :const  ShimmerLoadWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 1,
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
                            children: [
                              Text(
                                'Filter',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: "MBold"),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  size: size.height * 0.025,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                overlayColor:
                                    MaterialStateProperty.all(infocolor),
                                fillColor: MaterialStateProperty.all(txtcolr),
                                value: isLocation,
                                shape: CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    setSte(() {
                                      isLocation = value!;
                                    });
                                  });
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                'Location',
                                style: TextStyle(
                                    fontFamily: "Msemibold",
                                    fontSize: size.height * 0.015),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: size.height * 0.02,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                hoverColor: infocolor,
                                fillColor: MaterialStateProperty.all(txtcolr),
                                value: isCatgry,
                                shape: CircleBorder(),
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCatgry = value!;
                                  });
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Text(
                                'Categories',
                                style: TextStyle(
                                    fontFamily: "Msemibold",
                                    fontSize: size.height * 0.015),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                size: size.height * 0.02,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Container(
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
}
