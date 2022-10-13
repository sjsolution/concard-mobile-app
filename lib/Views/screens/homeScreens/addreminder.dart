import 'package:concard/Constants/Colors.dart';
import 'package:concard/Views/screens/homeScreens/contactsProfileViewScreen.dart';
import 'package:flutter/material.dart';

class Addreminder extends StatefulWidget {
  const Addreminder({Key? key}) : super(key: key);

  @override
  State<Addreminder> createState() => _AddreminderState();
}

class _AddreminderState extends State<Addreminder> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Column(
        children: [
          Stack(
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
                    left: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: size.height * 0.02,
                          color: bckgrnd,
                        ),
                      ),
                      Text(
                        'Add Reminder',
                        style: TextStyle(
                          fontSize: size.height * 0.020,
                          color: bckgrnd,
                          fontFamily: 'MBold',
                        ),
                      ),
                      Container(
                        height: size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.13),
                // height: size.height*0.8,
                width: size.width,
                decoration: BoxDecoration(
                    color: btnclr,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
                  child: Container(
                    height: size.height * 0.13,
                    width: size.width * 1.0,
                    decoration: BoxDecoration(
                      color: bckgrnd,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12, left: 12, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reminder Content',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: 'Mmedium',
                                color: Color(0xffAFACAC)),
                          ),
                          SizedBox(
                            height: size.height * 0.010,
                          ),
                          Divider(
                            color: Color(0xffE6E6E6),
                          ),
                          SizedBox(
                            height: size.height * 0.010,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Date & Time',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold'),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right:size.height*0.010),
                                      child: Text(
                                    '16:00, 16/04/2022',
                                    style: TextStyle(
                                      fontSize: size.height * 0.015,
                                      color: txtcolr,
                                    ),
                                  )),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height*0.6,),
          InkWell(
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (_)=>ContactProfileViewScreen(id: ,)));
            },
            child: Container(
                          // margin: EdgeInsets.only(top: size.height * 0.35),
                          height: size.height * 0.05,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomLeft,
                              colors: [
                                signupclor_light,
                                signupclor_dark,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                color: bckgrnd,
                                fontFamily: 'MBold',
                                fontSize: size.height * 0.020,
                              ),
                            ),
                          ),
                        ),
          ),
        ],
      ),
    );
  }
}
