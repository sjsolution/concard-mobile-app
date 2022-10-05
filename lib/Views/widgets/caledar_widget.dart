import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarWidget extends StatefulWidget {
  CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
                              height: size.height*0.4,
                               child: TableCalendar(firstDay: DateTime.utc(2010,10,20),
                    lastDay: DateTime.utc(2040,10,20),
                    focusedDay: DateTime.now(),
                    headerVisible: true,
                    daysOfWeekVisible: true,
                    sixWeekMonthsEnforced: true,
                    shouldFillViewport: false,
                    headerStyle:const HeaderStyle(titleTextStyle: TextStyle(fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.w800)),
                    calendarStyle:const CalendarStyle(todayTextStyle: TextStyle(fontSize:20, color: Colors.white, fontWeight: FontWeight.bold )),
                  ),
                             ),
    );
  }
}