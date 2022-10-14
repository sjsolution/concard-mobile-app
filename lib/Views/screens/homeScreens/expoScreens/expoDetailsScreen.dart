import 'dart:async';

import 'package:concard/Controllers/ExpoController/expo_badge_controller.dart';
import 'package:concard/Views/screens/homeScreens/expoScreens/expoTopParticipantsScreen.dart';
import 'package:concard/Views/screens/homeScreens/expoScreens/expoSeeAllScreen.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/cupertino.dart';
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
  DateTime? dateTime;
  String? datFormat;

  final Completer<GoogleMapController>? _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  //  Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller!.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
  // }
  @override
  void initState() {
    // TODO: implement initState
    getExpoDetail();
    dateTime = DateTime.now();
    datFormat = DateFormat('EEE,MMM d' 'YYYY').format(dateTime!);
    super.initState();
  }

  getExpoDetail() async {
    Globals.expoDetailModel=null;
    Globals.expoDetailModel =
        await ExpoController().getExpoBadgeDetail(widget.id);
        print('Id.........'+ widget.id.toString());
        setState(() {
          
        });
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
                                      backgroundImage: NetworkImage(Globals.expoDetailModel!.data!.image.toString()),
                                                                            backgroundColor: Colors.white,
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          Globals.expoDetailModel!.data!.badgeName
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: size.height * 0.017,
                                              fontFamily: "Msemibold"),
                                        ),
                                         SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                      Globals.expoDetailModel!.data!.location !=
                                              null
                                          ? Globals
                                              .expoDetailModel!.data!.location
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expo location details',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "Stf"),
                                  ),
                                  Container(
                                    height: 0.23,
                                    child: GoogleMap(
                                      mapType: MapType.normal,
                                      initialCameraPosition: _kGooglePlex,
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        _controller!.complete(controller);
                                      },
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
                          Globals.expoDetailModel!.data!.categories != null
                              ? Container(
                                  height: size.height * 0.15,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: bckgrnd,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Globals.expoDetailModel!.data!
                                          .categories!.isNotEmpty
                                      ? ListView.builder(
                                          padding: const EdgeInsets.all(0),
                                          itemCount: Globals.expoDetailModel!
                                              .data!.categories!.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, catIndex) {
                                            return Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.02,
                                                  right: size.width * 0.02,
                                                  top: size.height * 0.02),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: btnclr,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Center(
                                                            child: Text(
                                                          Globals
                                                              .expoDetailModel!
                                                              .data!
                                                              .categories![
                                                                  catIndex]
                                                              .title
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize:
                                                                  size.height *
                                                                      0.015,
                                                              fontFamily:
                                                                  "Stf"),
                                                        )),
                                                        height:
                                                            size.height * 0.03,
                                                        width: size.width * 0.2,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                      : const Center(
                                          child: Text('No catogries')),
                                  // child: Padding(
                                  //   padding:  EdgeInsets.only(top: size.height*0.02,left: size.width*0.02,right: size.width*0.02),
                                  //   child: Column(
                                  //     children: [
                                  //       Row(
                                  //         children: [
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //               color: btnclr,
                                  //               borderRadius: BorderRadius.circular(15)
                                  //             ),
                                  //             child: Center(child: Text('my',style: TextStyle(
                                  //               fontSize: size.height*0.015,
                                  //               fontFamily: "Stf"
                                  //             ),)),
                                  //             height: size.height*0.03,
                                  //             width: size.width*0.2,
                                  //           ),
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //               color: btnclr,
                                  //               borderRadius: BorderRadius.circular(15)
                                  //             ),
                                  //             child: Center(child: Text('Finance',
                                  //               style: TextStyle(
                                  //                   fontSize: size.height*0.015,
                                  //                   fontFamily: "Stf"
                                  //               ),)),
                                  //             height: size.height*0.03,
                                  //             width: size.width*0.2,
                                  //           ),
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //               color: btnclr,
                                  //               borderRadius: BorderRadius.circular(15)
                                  //             ),
                                  //             child: Center(child: Text('Management',
                                  //               style: TextStyle(
                                  //                   fontSize: size.height*0.015,
                                  //                   fontFamily: "Stf"
                                  //               ),)),
                                  //             height: size.height*0.03,
                                  //             width: size.width*0.27,
                                  //           ),
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //               color: btnclr,
                                  //               borderRadius: BorderRadius.circular(15)
                                  //             ),
                                  //             child: Center(child: Text('Now',
                                  //               style: TextStyle(
                                  //                   fontSize: size.height*0.015,
                                  //                   fontFamily: "Stf"
                                  //               ),)),
                                  //             height: size.height*0.03,
                                  //             width: size.width*0.15,
                                  //           ),
                                  //         ],
                                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //       ),
                                  //       SizedBox(height: 9,),
                                  //       Row(
                                  //         children: [
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: btnclr,
                                  //                 borderRadius: BorderRadius.circular(15)
                                  //             ),
                                  //             child: Center(child: Text('Administration',
                                  //               style: TextStyle(
                                  //                   fontSize: size.height*0.015,
                                  //                   fontFamily: "Stf"
                                  //               ),)),
                                  //             height: size.height*0.03,
                                  //             width: size.width*0.3,
                                  //           ),
                                  //           SizedBox(width:size.height*0.01,),
                                  //           Container(
                                  //             decoration: BoxDecoration(
                                  //                 color: btnclr,
                                  //                 borderRadius: BorderRadius.circular(15)
                                  //             ),
                                  //             child: Center(child: Text('Now',
                                  //               style: TextStyle(
                                  //                   fontSize: size.height*0.015,
                                  //                   fontFamily: "Stf"
                                  //               ),)),
                                  //             height: size.height*0.03,
                                  //             width: size.width*0.15,
                                  //           ),
                                  //         ],
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                )
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
                                        Globals
                                                      .expoDetailModel!
                                                      .data!
                                                      .dateTime!=null?  DateFormat('EEEE').format(
                                                  DateTime.parse(Globals
                                                      .expoDetailModel!
                                                      .data!
                                                      .dateTime
                                                      .toString())) +
                                              ", " +
                                              DateFormat.yMMMd()
                                                  .format(DateTime.parse(Globals
                                                      .expoDetailModel!
                                                      .data!
                                                      .dateTime
                                                      .toString()))
                                                  .toString():'',
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
                                        Globals
                                                      .expoDetailModel!
                                                      .data!
                                                      .dateTime!=null?  DateFormat('KK:mm a')
                                              .format(DateTime.parse(Globals
                                                  .expoDetailModel!
                                                  .data!
                                                  .dateTime
                                                  .toString()))
                                              .toString():'',
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
                                    Globals.expoDetailModel!.data!.description
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
                                             ExpoTopParticipantsScreen(
                                            )));
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
                          Globals.expoDetailModel!.data!.participants != null
                              ? Container(
                                  height: size.height * 0.1,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: bckgrnd,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Globals.expoDetailModel!.data!
                                          .participants!.isNotEmpty
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: Globals.expoDetailModel!
                                              .data!.participants!.length,
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
                                     backgroundImage: NetworkImage(Globals.expoDetailModel!.data!.participants![participantsIndex].image.toString())??NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVLDP5s2j9u1x86fOb7kNKXanJeMn8zZ30ZQ&usqp=CAU'),
                                                        
                                                        backgroundColor:
                                                            infocolor
                                                                .withOpacity(
                                                                    0.3),
                                                      ),
                                                      Text(
                                                        Globals
                                                            .expoDetailModel!
                                                            .data!
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
                                                            .data!
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
                      ): const ShimmerLoadWidget(),
                    ),
                  )
                ,
          ],
        ),
      ),
    );
  }
}
