import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/homeScreens/companyProfileScreen.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import '../../widgets/customCardInputField.dart';

class EditMyCardScreen extends StatelessWidget {
  EditMyCardScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, app, _) {
      return Scaffold(
          drawer: DrawerMenuScreen(),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: size.height * 0.34,
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
                          top: size.height * 0.08),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: bckgrnd,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            CompanyProfileScreen()));
                              },
                              child: Icon(
                                Icons.check,
                                size: 25,
                                color: bckgrnd,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
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
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.03,
                            left: size.width * 0.04,
                            right: size.width * 0.04),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Edit Card',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: 'MBold'),
                                  )),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Card Info',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: 'Msemibold'),
                                  )),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                height: size.height * 0.2,
                                width: size.width,
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.04,
                                        right: size.width * 0.04),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${app.indiviualProfileModel!.data!.firstName} ${app.indiviualProfileModel!.data!.lastName}',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.02,
                                                      fontFamily: "Stf"),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(
                                                  'Job title',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.02,
                                                      fontFamily: "Stf"),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(
                                                  'Company',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.02,
                                                      fontFamily: "Stf"),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${app.indiviualProfileModel!.data!.email}',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.02,
                                                      fontFamily: "Stf"),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(
                                                  'Website',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.02,
                                                      fontFamily: "Stf"),
                                                ),
                                                SizedBox(
                                                  height: size.height * 0.01,
                                                ),
                                                Text(
                                                  '${app.indiviualProfileModel!.data!.mobileNumber}',
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.02,
                                                      fontFamily: "Stf"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(editpen_icon),
                                            SvgPicture.asset(txt_icon),
                                            SvgPicture.asset(paint_icon),
                                            SvgPicture.asset(smallcard_icon),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                height: size.height * 0.05,
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.04,
                                      right: size.width * 0.01),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Insert Card',
                                        style: TextStyle(
                                            fontSize: size.height * 0.02,
                                            fontFamily: "Msemibold",
                                            color: infocolor),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height: size.height * 0.04,
                                        width: size.width * 0.2,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  signupclor_light,
                                                  signupclor_dark
                                                ]),
                                            border: Border.all(
                                                color: signupclor_dark),
                                            color: bckgrnd,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Text(
                                          'Upload',
                                          style: TextStyle(
                                              fontFamily: "Mbold",
                                              fontSize: size.height * 0.02,
                                              color: bckgrnd),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.01,
                                    right: size.width * 0.01),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: size.height * 0.15,
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                signupclor_light,
                                                signupclor_dark,
                                              ])),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Image.asset(bin_icon),
                                            alignment: Alignment.topRight,
                                            margin: EdgeInsets.only(
                                                right: size.width * 0.03,
                                                top: size.height * 0.015),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                child: Image.asset(camera_icon),
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    top: size.height * 0.015),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              Container(
                                                height: size.height * 0.023,
                                                width: size.width * 0.15,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: bckgrnd
                                                        .withOpacity(0.5)),
                                                child: Center(
                                                  child: Text(
                                                    'Photo',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.015,
                                                        fontFamily: "Stf",
                                                        color: bckgrnd),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SvgPicture.asset(crop_icon),
                                    Container(
                                      height: size.height * 0.15,
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                signupclor_light,
                                                signupclor_dark,
                                              ])),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Image.asset(bin_icon),
                                            alignment: Alignment.topRight,
                                            margin: EdgeInsets.only(
                                                right: size.width * 0.03,
                                                top: size.height * 0.015),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                child: Image.asset(camera_icon),
                                                alignment: Alignment.center,
                                                margin: EdgeInsets.only(
                                                    top: size.height * 0.015),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              Container(
                                                height: size.height * 0.023,
                                                width: size.width * 0.15,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: bckgrnd
                                                        .withOpacity(0.5)),
                                                child: Center(
                                                  child: Text(
                                                    'Logo',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.015,
                                                        fontFamily: "Stf",
                                                        color: bckgrnd),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Company',
                                    style: TextStyle(
                                        fontSize: size.height * 0.02,
                                        fontFamily: 'MBold'),
                                  )),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              CustomCardInputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Enter company name";
                                    }
                                    return null;
                                  },
                                  hinttxt: 'Company Name',
                                  textInputType: TextInputType.text,
                                  controller: controller),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              CustomCardInputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Enter company name";
                                    }
                                    return null;
                                  },
                                  hinttxt: 'Website',
                                  textInputType: TextInputType.text,
                                  controller: controller),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              CustomCardInputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Enter company name";
                                    }
                                    return null;
                                  },
                                  hinttxt: 'Field',
                                  textInputType: TextInputType.text,
                                  controller: controller),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Tel',
                                    style: TextStyle(
                                        fontSize: size.height * 0.02,
                                        fontFamily: 'MBold'),
                                  )),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: size.height * 0.06,
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border:
                                              Border.all(color: Colors.grey),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.04,
                                            right: size.width * 0.04),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Work',
                                              style: TextStyle(
                                                  fontFamily: "Msemibold",
                                                  fontSize: size.height * 0.018,
                                                  color: infocolor),
                                            ),
                                            Image.asset(downarrow_icon)
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: size.height * 0.06,
                                    width: size.width * 0.6,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'Number',
                                          contentPadding: EdgeInsets.only(
                                              top: 0.0,
                                              left: 22.0,
                                              bottom: 2.0),
                                          hintStyle: TextStyle(
                                              fontSize: size.height * 0.018,
                                              color: infocolor,
                                              fontFamily: "Msemibold"),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: size.height * 0.06,
                                    width: size.width * 0.3,
                                    child: Container(
                                        height: size.height * 0.06,
                                        width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.04,
                                              right: size.width * 0.04),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Mobile',
                                                style: TextStyle(
                                                    fontFamily: "Msemibold",
                                                    fontSize:
                                                        size.height * 0.02,
                                                    color: infocolor),
                                              ),
                                              Image.asset(downarrow_icon)
                                            ],
                                          ),
                                        )),
                                  ),
                                  Container(
                                    height: size.height * 0.06,
                                    width: size.width * 0.6,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'Number',
                                          contentPadding: EdgeInsets.only(
                                              top: 0.0,
                                              left: 22.0,
                                              bottom: 2.0),
                                          hintStyle: TextStyle(
                                              fontSize: size.width * 0.04,
                                              color: infocolor),
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: size.height * 0.02,
                                        fontFamily: 'MBold'),
                                  )),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Container(
                                height: size.height * 0.055,
                                width: size.width,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Email',
                                      contentPadding: EdgeInsets.only(
                                          top: 0.0, left: 22.0, bottom: 2.0),
                                      hintStyle: TextStyle(
                                          fontSize: size.width * 0.04,
                                          color: infocolor),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Address',
                                    style: TextStyle(
                                        fontSize: size.height * 0.02,
                                        fontFamily: 'MBold'),
                                  )),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: size.height * 0.05,
                                        // width: size.width * 0.25,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.04,
                                              right: size.width * 0.04),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'City',
                                                style: TextStyle(
                                                    fontFamily: "Msemibold",
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: infocolor),
                                              ),
                                              Image.asset(downarrow_icon)
                                            ],
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: size.height * 0.05,
                                        // width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.04,
                                              right: size.width * 0.03),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Province',
                                                style: TextStyle(
                                                    fontFamily: "Msemibold",
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: infocolor),
                                              ),
                                              Image.asset(downarrow_icon)
                                            ],
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: size.height * 0.05,
                                        // width: size.width * 0.3,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.04,
                                              right: size.width * 0.04),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Country',
                                                style: TextStyle(
                                                    fontFamily: "Msemibold",
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: infocolor),
                                              ),
                                              Image.asset(downarrow_icon)
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: size.height * 0.055,
                                        // width: size.width * 0.31,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: size.width * 0.02,
                                              right: size.width * 0.02),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Postal code',
                                                style: TextStyle(
                                                    fontFamily: "Msemibold",
                                                    fontSize:
                                                        size.height * 0.014,
                                                    color: infocolor),
                                              ),
                                              Image.asset(downarrow_icon)
                                            ],
                                          ),
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      height: size.height * 0.06,
                                      // width: size.width * 0.58,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Address',
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 0.0,
                                                    left: 22.0,
                                                    bottom: 2.0),
                                            hintStyle: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: infocolor,
                                              fontFamily: "Msemibold",
                                            ),
                                            fillColor: Colors.white,
                                            filled: true,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '+ Add Another',
                                    style: TextStyle(
                                        fontSize: size.height * 0.02,
                                        color: cgreen,
                                        fontFamily: 'Stf'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.lock,
                                    size: 20,
                                    color: infocolor,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: size.height * 0.15, left: size.width * 0.04),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: bckgrnd,
                      child: SvgPicture.asset(con_icon),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.21, left: size.width * 0.17),
                      child: Image.asset(compcamera_icon)),
                ],
              ),
            ],
          ));
    });
  }
}
