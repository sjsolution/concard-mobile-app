import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/indiviualController/notification_controller.dart';
import 'package:concard/Controllers/notidications_controller.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/homeScreens/personalProfileViewScreen.dart';
import 'package:concard/Views/widgets/loader_widget.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../Constants/colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListNotifications();
  }
  DateTime? dateTime;
  String? datFormat;
getListNotifications()async{
  Globals.notificationsListModel= await NotificationControll().notificationList();
  debugPrint('New Notification'+Globals.notificationsListModel.toString());
  setState(() {
    
  });
}
 
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(
      builder: (context, appPro,_) {
        return Scaffold(
          body: Stack(
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
                          size: 20,
                          color: bckgrnd,
                        ),
                      ),
                      // SizedBox(
                      //   width: 130,
                      // ),
                      Text(
                        'Notifications',
                        style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold', color: bckgrnd),
                      ),
                      // SizedBox(
                      //   width: 110,
                      // ),
                      Row(
                        children: [
                          Image.asset(notify_icon),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => PersonalProfileViewScreen()));
                            },
                            child: CircleAvatar(
                                radius: size.height * 0.02,
                                backgroundImage: NetworkImage(
                                  appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileImage!=null?appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileImage!.toString(): "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.13),
                // height: size.height*0.95,
                width: size.width,
                decoration: BoxDecoration(
                    color: btnclr,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: ListView(
                  padding: EdgeInsets.only(left: size.width*0.03,right: size.width*0.03,top: size.height*0.02),
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Notifications',
                              style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                            ),
                          ),
                          SizedBox(height: size.height*0.02,),
                          Container(
                            child: Text(
                              'Wednesday, 24 February 2021',
                              style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Stf'),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(height: size.height*0.02,),
                          
                          Container(
                            child: Text(
                              'New',
                              style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Globals.notificationsListModel!=null?
                          Container(
                              height: size.height * 0.25,
                              width: size.width,
                              color: cgreen.withOpacity(0.2),
                              child: ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  scrollDirection: Axis.vertical,
                                  itemCount: Globals.notificationsListModel!.notificationsData!.newNotifications!.length,
                                  itemBuilder: (context, index) {
                                    return Globals.notificationsListModel!.notificationsData!=null? Padding(
                                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                               backgroundImage: NetworkImage(
                                                Globals.notificationsListModel!.notificationsData!.newNotifications![index].data!.image.toString()
                                               ),
                                                backgroundColor: bckgrnd,
                                              ),
                                              SizedBox(
                                                width: size.width * 0.03,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    Globals.notificationsListModel!.notificationsData!.newNotifications![index].data!.username.toString(),
                                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'MBold'),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Text(
                                                    'Profile',
                                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                Globals.notificationsListModel!.notificationsData!.newNotifications![index].data!.message.toString(),
                                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    _settingModalBottomSheet(context);
                                                  },
                                                  child: Icon(
                                                    Icons.more_vert,
                                                    color: Colors.grey,
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.005,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: size.width * 0.13),
                                                height: size.height * 0.035,
                                                width: size.width * 0.15,
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: gradientgreen), color: bckgrnd, borderRadius: BorderRadius.circular(30)),
                                                child: Container(
                                                  color: cgreen.withOpacity(0.2),
                                                  child: Center(
                                                    child: Text(
                                                      'View',
                                                      style: TextStyle(
                                                        color: gradientgreen,
                                                        fontSize: size.height * 0.015,
                                                        fontFamily: 'Msemibold',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                Globals.notificationsListModel!.notificationsData!.newNotifications![index].readAt!=null?
                                                Globals.notificationsListModel!.notificationsData!.newNotifications![index].readAt.toString():'',
                                                style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'Msemibold', color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: infocolor.withOpacity(0.3),
                                          ),
                                          // SizedBox(height: size.height*0.01,),
                                          // Row(crossAxisAlignment: CrossAxisAlignment.start,
                                          //   children: [
                                          //     CircleAvatar(
                                          //       radius: 20,
                                          //       child: ClipRRect(
                                          //         child: Image.asset(
                                          //           office,
                                          //           height: 20,
                                          //           fit: BoxFit.cover,
                                          //         ),
                                          //       ),
                                          //       backgroundColor: bckgrnd,
                                          //     ),
                                          //     SizedBox(width:size.width*0.03,),
                                          //     Column(
                                          //       crossAxisAlignment: CrossAxisAlignment.start,
                                          //       children: [
                                          //         Text('Company',style: TextStyle(
                                          //             fontSize: size.height*0.018,
                                          //             fontFamily: 'MBold'
                                          //         ),),
                                          //         SizedBox(height: size.height*0.01,),
                                          //         Text('Brochure',style: TextStyle(
                                          //             fontSize: size.height*0.018,
                                          //             fontFamily: 'Msemibold'
                                          //         ),),
                                          //       ],
                                          //     ),
                                          //     Text(' has updated company',style: TextStyle(
                                          //         fontSize: size.height*0.018,
                                          //         fontFamily: 'Msemibold'
                                          //     ),),
                                          //     Spacer(),
                                          //     Icon(Icons.more_vert,color: Colors.grey,)
                                          //   ],
                                          // ),
                                          // SizedBox(height: size.height*0.005,),
                                          // Row(
                                          //   crossAxisAlignment: CrossAxisAlignment.start,
                                          //   children: [
                                          //     Container(
                                          //       margin: EdgeInsets.only(left: size.width*0.13),
                                          //       alignment: Alignment.center,
                                          //       height: size.height * 0.035,
                                          //       width: size.width * 0.15,
                                          //       decoration: BoxDecoration(
                                          //           gradient: LinearGradient(
                                          //               begin: Alignment.topCenter,
                                          //               end: Alignment.bottomCenter,
                                          //               colors: [
                                          //                 gradientgreen,
                                          //                 primarygreen,
                                          //               ]
                                          //           ),
                                          //           color: bckgrnd,
                                          //           borderRadius: BorderRadius.circular(30)
                                          //       ),
                                          //       child: Container(
                                          //         child: Center(
                                          //           child: Text('View', style: TextStyle(
                                          //               color: bckgrnd,
                                          //               fontSize: size.height*0.015,
                                          //               fontWeight: FontWeight.bold,
                                          //               fontFamily: 'Msemibold'
                                          //           ),),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Spacer(),
                                          //     Text('4m',style: TextStyle(
                                          //         fontSize: size.height*0.018,
                                          //         fontFamily: 'Msemibold',
                                          //         color: Colors.grey
                                          //     ),),
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                    ):Text('No notifications');
                                  })):ShimmerLoadWidget(),
                          SizedBox(height: size.height*0.02,),

                          Container(
                            child: Text(
                              'Recent',
                              style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'Msemibold'),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                              height: size.height * 0.3,
                              width: size.width,
                              color: bckgrnd,
                              child: ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  itemCount: 3,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                  radius: size.height * 0.025,
                                                  backgroundImage: NetworkImage(
                                                    "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                                  )),
                                              SizedBox(
                                                width: size.width * 0.03,
                                              ),
                                              Text(
                                                'User 1',
                                                style: TextStyle(fontSize: size.height * 0.017, fontFamily: 'MBold'),
                                              ),
                                              Text(
                                                ' has updated Profile pic',
                                                style: TextStyle(fontSize: size.height * 0.017, fontFamily: 'Msemibold'),
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                  onTap: () {
                                                    _settingModalBottomSheet(context);
                                                  },
                                                  child: Icon(
                                                    Icons.more_vert,
                                                    color: Colors.grey,
                                                  ))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(left: size.width * 0.13),
                                                height: size.height * 0.035,
                                                width: size.width * 0.15,
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: gradientgreen), color: bckgrnd, borderRadius: BorderRadius.circular(30)),
                                                child: Container(
                                                  // margin: EdgeInsets.only(left: size.width*0.04),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'View',
                                                    style: TextStyle(color: gradientgreen, fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                '2h',
                                                style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'Msemibold', color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: infocolor.withOpacity(0.3),
                                          ),
                                        ],
                                      ),
                                    );
                                  })),
                          SizedBox(height: size.height*0.02,),

                          Container(
                            child: Text(
                              'Today',
                              style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'Msemibold'),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.4,
                            width: size.width,
                            child: ListView.builder(
                                padding: EdgeInsets.all(0),
                                itemCount: Globals.notificationsListModel!.notificationsData!.todayNotifications!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return Globals.notificationsListModel!.notificationsData!=null? Padding(
                                    padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                                radius: size.height * 0.025,
                                                backgroundImage: NetworkImage(
                                                  Globals.notificationsListModel!.notificationsData!.todayNotifications![index].data!.image.toString()??
                                                  "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                                )),
                                            SizedBox(
                                              width: size.width * 0.02,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${Globals.notificationsListModel!.notificationsData!.todayNotifications![index].data!.username.toString()}'+ "  "  + '${Globals.notificationsListModel!.notificationsData!.todayNotifications![index].data!.message.toString()}' ,
                                                  style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'at',
                                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                                    ),
                                                    Text(
                                                      ' Company 1',
                                                      style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'Msemibold'),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                                onTap: () {
                                                  _settingModalBottomSheet(context);
                                                },
                                                child: Icon(
                                                  Icons.more_vert,
                                                  color: Colors.grey,
                                                ))
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: size.width * 0.12),
                                              height: size.height * 0.035,
                                              width: size.width * 0.27,
                                              decoration: BoxDecoration(
                                                  border: Border.all(color: gradientgreen), color: bckgrnd, borderRadius: BorderRadius.circular(30)),
                                              child: Container(
                                                color: btnclr,
                                                // margin: EdgeInsets.only(left: size.width*0.04),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Say Congrats',
                                                  style: TextStyle(color: gradientgreen, fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              DateFormat('k').format(DateTime.parse(Globals.notificationsListModel!.notificationsData!.todayNotifications![index].createdAt.toString())),
                                              style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Msemibold', color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: infocolor.withOpacity(0.3),
                                        ),
                                      ],
                                    ),
                                  ):Text('No data');
                                }),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          )
                        ],
                      )
              
                  ],
                )
              )
            ],
          ),
        );
      }
    );
  }

  void _settingModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Row(
                        children: [
                          Text(
                            'More options',
                            style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Mbold'),
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close)),
                        ],
                      ),
                    ),
                    new ListTile(
                        leading: SvgPicture.asset(
                          recyclebin_icon,
                          color: crs_clr,
                        ),
                        title: new Text(
                          'Delete notificaton',
                          style: TextStyle(fontFamily: 'Msemibold', fontSize: size.height * 0.018, color: crs_clr),
                        ),
                        onTap: () => {}),
                    new ListTile(
                      leading: Image.asset(turnoffnotify_icon),
                      title: new Text(
                        'Turn off notification',
                        style: TextStyle(
                          fontFamily: 'Stf',
                          fontSize: size.height * 0.018,
                        ),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: Image.asset(muteuser_icon),
                      title: Row(
                        children: [
                          new Text(
                            'Mute',
                            style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.018),
                          ),
                          new Text(
                            '(User 1)',
                            style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'MBold'),
                          ),
                        ],
                      ),
                      onTap: () => {},
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
