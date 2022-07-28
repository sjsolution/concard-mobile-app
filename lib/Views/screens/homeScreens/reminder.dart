import 'package:concard/Constants/Colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/addreminder.dart';
import 'package:flutter/material.dart';

class Reminderscreen extends StatefulWidget {
  const Reminderscreen({Key? key}) : super(key: key);

  @override
  State<Reminderscreen> createState() => _ReminderscreenState();
}

class _ReminderscreenState extends State<Reminderscreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Stack(
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
                    'Reminder',
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
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.3,
                ),
                Image.asset(reminder),
                SizedBox(
                  height: size.height * 0.030,
                ),
                Text('No Reminders Yet',
                style: TextStyle(
                  fontFamily: "Mbold",
                  fontSize: size.height*0.018
                ),),
                SizedBox(
                  height: size.height * 0.3,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Addreminder()));
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
                        'Add',
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
          ),
        ],
      ),
    );
  }
}
