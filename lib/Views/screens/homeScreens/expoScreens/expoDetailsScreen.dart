import 'dart:async';

import 'package:concard/Controllers/ExpoController/expo_badge_controller.dart';
import 'package:concard/Views/screens/homeScreens/expoScreens/expoTopParticipantsScreen.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:concard/Constants/globals.dart' as Globals;

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';

class ExpoDetailsScreen extends StatefulWidget {
  ExpoDetailsScreen({Key? key, required this.id}) : super(key: key);
  String? id;
  @override
  State<ExpoDetailsScreen> createState() => _ExpoDetailsScreenState();
}

class _ExpoDetailsScreenState extends State<ExpoDetailsScreen> {


 static final LatLng _kMapCenter =
      LatLng(31.5336, 74.2988);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  DateTime? dateTime;
  String? datFormat;
 
 
  @override
  void initState() {
    getExpoDetail();
    dateTime = DateTime.now();
    datFormat = DateFormat('EEE,MMM d' 'YYYY').format(dateTime!);
    super.initState();
  }

  getExpoDetail() async {
    Globals.expoDetailModel = null;
    Globals.expoDetailModel =
        await ExpoController().getExpoBadgeDetail(widget.id);
    // print('Id.........' + widget.id.toString());
    setState(() {});
  }

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
                             Stack(
                                    children: [
                                      SvgPicture.asset(bellIcon),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: SvgPicture.asset(notifyDot),
                                      ),
                                    ],
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
                    top: size.height * 0.02),
                child: Globals.expoDetailModel != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      radius: size.height * 0.05,
                                      backgroundImage: NetworkImage(Globals
                                          .expoDetailModel!.expoDetaildata!.image
                                          .toString()),
                                      backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          Globals
                                              .expoDetailModel!.expoDetaildata!.badgeName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: size.height * 0.017,
                                              fontFamily: "Msemibold"),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Text(
                                          Globals.expoDetailModel!.expoDetaildata!
                                                      .location !=
                                                  null
                                              ? Globals.expoDetailModel!.expoDetaildata!
                                                  .location
                                                  .toString()
                                              : '',
                                          style: TextStyle(
                                              fontSize: size.height * 0.014,
                                              fontFamily: "Stf",
                                              color: infocolor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // SizedBox(
                                //   width:size.width*0.,
                                // ),
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      stylearrw_icon,
                                      height: size.height * 0.02,
                                      color: prmryblue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Location',
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "Mbold",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.25,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.03,
                                  right: size.width * 0.03,
                                  top: size.height * 0.02),
                              child: Stack(
                                children: [
                                  Text(
                                    'Expo location details',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                   Container(
                                   height: size.height*0.2,
                                    child:GoogleMap(
        initialCameraPosition: _kInitialPosition,
      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "MBold",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Globals.expoDetailModel!.expoDetaildata!.categories != null
                              ? Container(
                            // height: size.height,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Wrap(
                              children: 
                                List.generate(
                              Globals.expoDetailModel?.expoDetaildata?.categories?.length == null ? 0:Globals.expoDetailModel!.expoDetaildata!.categories!.length ,(index){
                                                  return Padding(
                                                    padding: const EdgeInsets.all(3),
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: btnclr,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(20)),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                                  size.width * 0.02,
                                                              right: size.width *
                                                                  0.02,top: size.height*0.01,bottom: size.width*0.01),
                                                          child: Text(
                                                            // 'Laptop,Mac,Apple,Iphone,Airpods,Android',
                                                 Globals.expoDetailModel!.expoDetaildata!.categories![index].title
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.height *
                                                                        0.015,
                                                                fontFamily: "Stf"),
                                                          ),
                                                        ),
                                                        // height:
                                                        //     size.height * 0.03,
                                                        // width: size.width * 0.2,
                                                      ),
                                                  );
                                                }
                          ),
                              
                          ),
                            ), )
                              : const ShimmerLoadWidget(),

                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Date',
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "MBold",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                              height: size.height * 0.1,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: bckgrnd,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    right: size.width * 0.04,
                                    top: size.height * 0.03),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          clndr_icon,
                                          height: size.height * 0.02,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                          Globals.expoDetailModel!.expoDetaildata!.startDateTime
                                                     !=
                                                  null
                                              ? DateFormat('EEEE').format(
                                                      DateTime.parse(Globals
                                                          .expoDetailModel!
                                                          .expoDetaildata!
                                                          .startDateTime
                                                          .toString())) +
                                                  ", " +
                                                  DateFormat.yMMMd()
                                                      .format(DateTime.parse(
                                                          Globals
                                                              .expoDetailModel!
                                                              .expoDetaildata!
                                                              .startDateTime
                                                              .toString()))
                                                      .toString()
                                              : '',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: "Msemibold"),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          timer_icon,
                                          height: size.height * 0.02,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Text(
                                          Globals.expoDetailModel!.expoDetaildata!
                                                      .startDateTime!=
                                                  null
                                              ? DateFormat('KK:mm a')
                                                  .format(DateTime.parse(Globals
                                                      .expoDetailModel!
                                                      .expoDetaildata!
                                                      .startDateTime
                                                      .toString()))
                                                  .toString()
                                              : '',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: "Msemibold"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            child: Text(
                              'About',
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "MBold",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
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
                                  left: size.width * 0.04,
                                  right: size.width * 0.04,
                                  top: size.height * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Globals.expoDetailModel!.expoDetaildata!.description
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ExpoTopParticipantsScreen()));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Top Participants',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: "MBold"),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'See all',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: "Msemibold",
                                        color: txtcolr),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Globals.expoDetailModel!.expoDetaildata!.participants != null
                              ? Container(
                                  height: size.height * 0.1,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: bckgrnd,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Globals.expoDetailModel!.expoDetaildata!
                                          .participants!.isNotEmpty
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: Globals.expoDetailModel!
                                              .expoDetaildata!.participants!.length,
                                          itemBuilder:
                                              (context, participantsIndex) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.height * 0.02,
                                                  right: size.width * 0.04,
                                                  top: size.height * 0.02),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      CircleAvatar(
                                                        radius:
                                                            size.height * 0.02,
                                                        backgroundImage: NetworkImage(Globals
                                                                .expoDetailModel!
                                                                .expoDetaildata!
                                                                .participants![
                                                                    participantsIndex]
                                                                .image
                                                                .toString()) ??
                                                            NetworkImage(
                                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVLDP5s2j9u1x86fOb7kNKXanJeMn8zZ30ZQ&usqp=CAU'),
                                                        backgroundColor:
                                                            infocolor
                                                                .withOpacity(
                                                                    0.3),
                                                      ),
                                                      Text(
                                                        Globals
                                                            .expoDetailModel!
                                                            .expoDetaildata!
                                                            .participants![
                                                                participantsIndex]
                                                            .title
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.015,
                                                            fontFamily:
                                                                "Msemibold"),
                                                      ),
                                                      Text(
                                                        Globals
                                                            .expoDetailModel!
                                                            .expoDetaildata!
                                                            .participants![
                                                                participantsIndex]
                                                            .position
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.01,
                                                            fontFamily: "Stf",
                                                            color: infocolor),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                      : const Center(
                                          child: Text("No Participents Found"),
                                        ))
                              : const ShimmerLoadWidget(),

                          //umatr
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Center(
                            child: Container(
                              width: size.width * 0.3,
                              height: size.height * 0.035,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'For more',
                                  style: TextStyle(
                                      fontSize: size.height * 0.015,
                                      fontFamily: "Msemibold"),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(primarygreen),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          )
                        ],
                      )
                    : const ShimmerLoadWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
 
}
