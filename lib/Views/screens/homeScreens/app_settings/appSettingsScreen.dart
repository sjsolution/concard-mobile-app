import 'package:concard/Views/screens/authScreens/individual/signin/forgetPassword.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/aaplock.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/cloudsync.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/fontsize.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/forgotPasswordAppSettingScreen.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/notification.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/recognition_languages.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/twostepverification.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/Colors.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool _contact = false;
  bool _camera = false;
  bool _concard = false;
  var scountrycode;
  bool  _isvisiable=false;
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
                    'App Settings',
                    style: TextStyle(
                      fontSize: size.height * 0.020,
                      color: bckgrnd,
                      fontFamily: 'Msemibold',
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
            child: ListView(
              padding: EdgeInsets.all(0),
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'General Settings',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: 'MBold',
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      Container(
                        height: size.height * 0.53,
                        width: size.width * 1.0,
                        decoration: BoxDecoration(
                          color: bckgrnd,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Fontsizescreen())));
                                },
                                child: Text(
                                  'Font Size',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Recoginitionlanguages())));
                                },
                                child: Text(
                                  'Recognition languages ',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              Text(
                                'Rate Us Now ',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: 'Mmedium',
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Pushnotifications())));
                                },
                                child: Text(
                                  'Notifications',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              Text(
                                'Check for updates',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: 'Mmedium',
                                ),
                              ),
                              Divider(
                                height: size.height * 0.015,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Auto save to contacts',
                                    style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      fontFamily: 'Mmedium',
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 0.6,
                                    child: CupertinoSwitch(
                                        activeColor: txtcolr,
                                        // thumbColor: Color(0xffF16522),
                                        trackColor: Color(0xffD0D0D0),
                                        value: _contact,
                                        onChanged: (value) {
                                          setState(() {
                                            _contact = value;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                              Divider(
                                height: size.height * 0.01,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Use System camera',
                                    style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      fontFamily: 'Mmedium',
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 0.6,
                                    child: CupertinoSwitch(
                                        activeColor: txtcolr,
                                        // thumbColor: Color(0xffF16522),
                                        trackColor: Color(0xffD0D0D0),
                                        value: _camera,
                                        onChanged: (value) {
                                          setState(() {
                                            _camera = value;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                              Divider(
                                height: size.height * 0.01,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Promote your Concard\nMake you card visible when\npeople search on Concard or Google',
                                    style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      fontFamily: 'Mmedium',
                                    ),
                                  ),
                                  Transform.scale(
                                    scale: 0.6,
                                    child: CupertinoSwitch(
                                        activeColor: txtcolr,
                                        // thumbColor: Color(0xffF16522),
                                        trackColor: Color(0xffD0D0D0),
                                        value: _concard,
                                        onChanged: (value) {
                                          setState(() {
                                            _concard = value;
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: size.height*0.02,),
                      Text(
                        'Account & Sync',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: 'MBold',
                        ),
                      ),
                        SizedBox(height: size.height*0.02,),
                      Container(
                        height: size.height * 0.7,
                        width: size.width * 1.0,
                        decoration: BoxDecoration(
                          color: bckgrnd,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                         padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.03),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              AppSettingsScreen())));
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              bottom: size.height * 0.1),
                                          child: AlertDialog(
                                           
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            alignment:
                                                AlignmentDirectional.bottomCenter,
                                          
                                            title: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                        height:
                                                            size.height * 0.01),
                                                    Text(
                                                      'Current Phone Number',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height * 0.018,
                                                          fontFamily:
                                                              'MBold'),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Icon(
                                                        Icons.close,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.020,
                                                ),
                                                Text(
                                                  '+966 581118957',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.018,
                                                      fontFamily: 'MBold'),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.020,
                                                ),
                                                Text(
                                                  'Note: This number will be removed from this account',
                                                  // textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: size.height * 0.015,
                                                    fontFamily: "Stf",
                                                    color: signupclor_dark,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.020,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    _phonenumberchangeModalBottomSheet(context);
                                                  },
                                                  child: Container(
                                                    height: size.height * 0.05,
                                                    width: size.width * 0.4,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(30),
                                                      color: Colors.transparent,
                                                      border: Border.all(
                                                          color: signupclor_dark),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      'Change',
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.height * 0.015,
                                                          fontFamily: 'MBold',
                                                          color: signupclor_dark),
                                                    ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bind Your Phone Number',
                                      style: TextStyle(
                                        fontFamily: 'Mmedium',
                                        fontSize: size.height * 0.018,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.010,
                                    ),
                                    Text(
                                      '+966 511558833',
                                      style: TextStyle(
                                        fontFamily: 'Mmedium',
                                        fontSize: size.height * 0.018,
                                        color: txtcolr,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) => AppSettingsScreen())));
                                  showDialog(
                                    context: context,
                                     builder: (context)
                                     {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: size.height*0.08),
                                    child: AlertDialog(
                                       insetPadding: EdgeInsets.all(10),
                                       shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)
                                      ),
                                      alignment: AlignmentDirectional.bottomCenter,
                                      actionsAlignment: MainAxisAlignment.center,
                                       title:Column(
                                         children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      height:
                                                          size.height * 0.01
                                                          ),
                                                  Text(
                                                    'Current Email',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.018,
                                                        fontFamily:
                                                            'MBold'),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: size.height*0.020,),
                                              Text('assem.yamak@hotmail.com',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'MBold'),),
                                              SizedBox(height: size.height*0.020,),
                                              Text('Note: This email will be removed from this account',style: TextStyle(fontSize: size.height*0.015,fontFamily: 'Stf',color: signupclor_dark),),
                                              SizedBox(height: size.height*0.020,),
                                              InkWell(
                                                onTap: () {
                                                  _emailchangeModalBottomSheet(context);
                                                },
                                                child: Container(
                                                  height: size.height * 0.05,
                                                  width: size.width * 0.4,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        color: signupclor_dark),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Change',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.018,
                                                        fontFamily: 'MBold',
                                                        color: signupclor_dark),
                                                  ),
                                                  ),
                                                ),
                                              ),
                                         ],
                                       ),
                                    ),
                                  );
                                  }
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        fontFamily: 'Mmedium',
                                        fontSize: size.height * 0.018,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.010,
                                    ),
                                    Text(
                                      'user@email.com',
                                      style: TextStyle(
                                        fontFamily: 'Mmedium',
                                        fontSize: size.height * 0.018,
                                        color: txtcolr,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Identification',
                                    style: TextStyle(
                                      fontFamily: 'Mmedium',
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.010,
                                  ),
                                  Text(
                                    'Passport',
                                    style: TextStyle(
                                      fontFamily: 'Mmedium',
                                      fontSize: size.height * 0.018,
                                      color: txtcolr,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Linkedin',
                                    style: TextStyle(
                                      fontFamily: 'Mmedium',
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.010,
                                  ),
                                  Text(
                                    'http://www.linkedin.com/in/assem-yamak-187b387a',
                                    style: TextStyle(
                                      fontFamily: 'Mmedium',
                                      fontSize: size.height * 0.018,
                                      color: txtcolr,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  Cloudsyncscreen())));
                                    },
                                    child: Text(
                                      'Cloud Sync',
                                      style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: 'Mmedium',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.030,
                                  ),
                                  Icon(
                                    Icons.lock_outline_rounded,
                                    size: size.height * 0.020,
                                    color: Color(0xffB3B3B3),
                                  ),
                                ],
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              InkWell(
                                onTap: () {
                                  _settingModalBottomSheet(context);
                                },
                                child: Text(
                                  'Change password',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Twostepvarificatio())));
                                },
                                child: Text(
                                  'Two-step verification',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.012),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Applockscreen())));
                                },
                                child: Text(
                                  'App lock',
                                  style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Mmedium',
                                  ),
                                ),
                              ),
                              Divider(
                                height: size.height * 0.02,
                                color: Color(0xffE6E6E6),
                              ),
                              SizedBox(height: size.height * 0.030),
                              Container(
                                height: size.height * 0.06,
                                width: size.width * 1.0,
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
                                    'Sign out',
                                    style: TextStyle(
                                      color: bckgrnd,
                                      fontFamily: 'Msemibold',
                                      fontSize: size.height * 0.020,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

  void _settingModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 0.55,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                        padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.03),
                    
                          
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'Change Password',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'MBold',
                                    color: signupclor_dark),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Current password',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "Stf",
                                  color: infocolor),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'New password',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "Stf",

                                  color:infocolor),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Retype new password',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "Stf",

                                  color: infocolor),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgetPasswordAppSettingScreen()));
                            },
                            child: Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: txtcolr,
                                    fontFamily: "MBold",
                          
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          Text(
                            'Enter a password that is at least 8 characters long and contain\n1 upper case, 1 lower case, 1 special character and 1 number.',
                            style: TextStyle(
                              fontSize: size.height * 0.012,
                              fontFamily: "Stf"
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => AppSettingsScreen())));
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          bottom: size.height * 0.1),
                                      // width: size.width*1.0,
                                      child: AlertDialog(
                                        insetPadding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
                                        backgroundColor: Color(0xffF7F7F7),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        alignment:
                                            AlignmentDirectional.bottomCenter,
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        title: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: txtcolr,
                                          child: Icon(Icons.check,size: size.height*0.03,color: bckgrnd,),
                                        ),
                                        content: Text(
                                          'Your Password has been successfully changed',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: 'Stf'),
                                        ),
                                        actions: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: ((context) =>
                                                          AppSettingsScreen())));
                                            },
                                            child: Container(
                                              height: size.height * 0.05,
                                              width: size.width * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: signupclor_dark),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.018,
                                                    fontFamily: 'MBold',
                                                    color: signupclor_dark),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.3),
                              height: size.height * 0.06,
                              width: size.width * 1.0,
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
                                  'Reset',
                                  style: TextStyle(
                                    color: bckgrnd,
                                    fontFamily: 'MBold',
                                    fontSize: size.height * 0.018,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
  void _phonenumberchangeModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 0.38,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                     padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'Change Phone Number',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold',
                                    color: signupclor_dark),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          Row(
                            children: [
                          
                              
                               Container(
                                height: size.height*0.065,
                                width: size.width*0.25,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Color(0xffC6C6C6),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child:
                                    Row(
                                      children: [
                                        CountryCodePicker(
                                          padding: EdgeInsets.all(0),
                                           textStyle:
                              TextStyle(color: Color(0xffC6C6C6), fontSize: size.height*0.018),
                          onChanged: (value) {
                            scountrycode = value.toString();
                          },
                          showFlag: false,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: '+965',
                          favorite: const ['+965', '+965'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                                        ),
                                  // Image.asset(),

                                      ],
                                    ),
                                    
                                  
                                ),
                                SizedBox(width: size.width*0.030,),
                              Expanded(
                                child: TextFormField(
                                  onChanged: (value) {
                                if(value.length>0)
                                {
                                  setState(() {
                                    _isvisiable=true;
                                  });
                                }
                                else{
                                  setState(() {
                                    _isvisiable=false;
                                  });
                                }
                              },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: 'Phone Number',
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.018,
                                        color: Color(0xffC6C6C6)),
                                    contentPadding: EdgeInsets.only(left: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xffC6C6C6)),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xffC6C6C6)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                         
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your account password',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Color(0xffC6C6C6)),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          InkWell(
                            onTap: () {
                              _varificationcodeModalBottomSheet(context);
                            },
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.3),
                              height: size.height * 0.06,
                              width: size.width * 1.0,
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
                                  'Change',
                                  style: TextStyle(
                                    color: bckgrnd,
                                    fontFamily: 'Reset',
                                    fontSize: size.height * 0.020,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
   void _varificationcodeModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 0.35,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                     padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'Verification Code',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold',
                                    color: signupclor_dark),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                         
                            
                           
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                         
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Verification code',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Color(0xffC6C6C6)),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                           SizedBox(
                            height: size.height * 0.030,
                          ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('02:00',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'Mbold',color: signupclor_dark),),
                                 Text('Resend Code',style: TextStyle(fontSize: size.height*0.018,fontFamily: 'Mbold',color: signupclor_dark),),
                             ],
                           ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          InkWell(
                            onTap: () {
                               Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => AppSettingsScreen())));
                                showDialog(
                                  context: context,
                                   builder: (context){
                                     return Container(
                                       margin:
                                    EdgeInsets.only(bottom: size.height * 0.1),
                                     child: AlertDialog(
                                   insetPadding: EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  alignment: AlignmentDirectional.bottomCenter,
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: txtcolr,
                                    child: Icon(Icons.check,size: size.height*0.03,color:bckgrnd),
                                  ),
                                  content: Text(
                                    'Your (email/phone) has been successfully changed',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: 'Mmedium'),
                                  ),
                                  actions: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    AppSettingsScreen())));
                                      },
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: signupclor_dark),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'OK',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: 'Stf',
                                              color: signupclor_dark),
                                        )),
                                      ),
                                    ),
                                  ],
                                  ),
                                     );
                                   }
                                  );
                            },
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.3),
                              height: size.height * 0.06,
                              width: size.width * 1.0,
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
                                  'Confirm Change',
                                  style: TextStyle(
                                    color: bckgrnd,
                                    fontFamily: 'Reset',
                                    fontSize: size.height * 0.020,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
  void _emailchangeModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height * 0.38,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),
                    
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: size.height * 0.02,
                              ),
                              Text(
                                'Change Email Address ',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'Msemibold',
                                    color: signupclor_dark),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                         
                           SizedBox(width: size.width*0.030,),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: 'New Email Address',
                                  hintStyle: TextStyle(
                                      fontSize: size.height * 0.018,
                                      color: Color(0xffC6C6C6)),
                                  contentPadding: EdgeInsets.only(left: 15),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffC6C6C6)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffC6C6C6)),
                                  ),
                                ),
                              ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                         
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your account password',
                              hintStyle: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Color(0xffC6C6C6)),
                              contentPadding: EdgeInsets.only(left: 15),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xffC6C6C6)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.030,
                          ),
                          InkWell(
                            onTap: () {
                              _varificationcodeModalBottomSheet(context);
                            },
                            child: Container(
                              // margin: EdgeInsets.only(top: size.height * 0.3),
                              height: size.height * 0.06,
                              width: size.width * 1.0,
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
                                  'Change',
                                  style: TextStyle(
                                    color: bckgrnd,
                                    fontFamily: 'Reset',
                                    fontSize: size.height * 0.020,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
