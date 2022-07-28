
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);


  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    var size =MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body:  Stack(
        children: [
          Container(
            height: size.height*0.25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: [
                    signupclor_light,
                    signupclor_dark
                  ]
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.06),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(more_icon,height: 15,),

                      Container(
                        margin: EdgeInsets.only(left: size.width*0.08,),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(drwrmyacunt_icon),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text('John Smith',style: TextStyle(
                                        fontFamily: 'MBold',
                                        fontSize: size.height*0.02,
                                        color: bckgrnd
                                    ),),
                                    Text('Lorem ipsum',style: TextStyle(
                                        fontFamily: 'Stf',
                                        fontSize: size.height*0.017,
                                        color: bckgrnd
                                    ),),
                                    SizedBox(height: size.height*0.01,),
                                    Container(
                                      height: size.height*0.023,
                                      width: size.width*0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: bckgrnd),
                                      ),
                                      child: Center(
                                        child: Text('Promote',style: TextStyle(
                                            fontFamily: "Stf",
                                            fontSize: size.height*0.015,
                                            color: bckgrnd
                                        ),),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: size.width*0.01,),
                                Image.asset(safesheld_icon),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>NotificationsScreen()));
                            },
                              child: Image.asset(notify_icon,)),
                          SizedBox(width: size.width*0.02,),
                          GestureDetector(

                              onTap: (){
                                _settingModalBottomSheet(context);
                              },
                              child: Icon(Icons.more_vert,color: bckgrnd,)),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height*0.23
            ),
            // height: size.height*0.8,
            width: size.width,
            decoration: BoxDecoration(
                color: bckgrnd,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.1,right: size.width*0.14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(switch_icon,height: size.height*0.03,),
                      SizedBox(width: size.width*0.03,),
                      Container(
                          margin: EdgeInsets.only(right: size.width*0.03),
                          child: GestureDetector(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CalenderScreen()));
                              },
                              child: Image.asset(planner_icon,height: size.height*0.03,))),
                      SizedBox(width: size.width*0.03,),
                      SvgPicture.asset(stylearrw_icon,height: size.height*0.03,),
                    ],
                  ),
                ),
                Container(
                  child: TableCalendar(firstDay: DateTime.utc(2010,10,20),
                    lastDay: DateTime.utc(2040,10,20),
                    focusedDay: DateTime.now(),
                    headerVisible: true,
                    daysOfWeekVisible: true,
                    sixWeekMonthsEnforced: true,
                    shouldFillViewport: false,
                    headerStyle: HeaderStyle(titleTextStyle: TextStyle(fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.w800)),
                    calendarStyle: CalendarStyle(todayTextStyle: TextStyle(fontSize:20, color: Colors.white, fontWeight: FontWeight.bold )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _settingModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
        ),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 4,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10,top: 20),
                      child: Row(
                        children: [
                          Text(
                            'More options',
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontFamily: 'Mbold'
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close)),
                        ],
                      ),
                    ),
                    new ListTile(
                        leading:Image.asset(group,color: signupclor_dark,),
                        title: new Text('Groups',style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height*0.015
                        ),),
                        onTap: () => {}),
                    new ListTile(
                      leading:SvgPicture.asset(emailtwo_icon),
                      title: new Text('Turn off notification',style: TextStyle(
                          fontFamily: 'Msemibold',
                          fontSize: size.height*0.015
                      ),),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading:SvgPicture.asset(newcntct_icon),
                      title:  new Text('Add to Contacts',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height*0.015
                        ),),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading:SvgPicture.asset(notfications_icon),
                      title:  new Text('Reminder',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height*0.015
                        ),),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading:SvgPicture.asset(favourite_icon),
                      title:  new Text('Add to Favorite',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height*0.015
                        ),),
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
