import 'dart:io';

import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/OthersController/image_picker_controller.dart';
import 'package:concard/Controllers/indiviualController/social_links_controller.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:concard/Views/widgets/imagePickerWidget.dart';
import 'package:concard/Views/widgets/socialLinksField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateNewSocialLink extends StatelessWidget {
  CreateNewSocialLink({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();
  var titleCon = TextEditingController();
  var urlCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<AppProvider>(builder: (context, app, _) {
      return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.25,
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
                          top: size.height * 0.06),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: const Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      color: Colors.white)),
                              Container(
                                margin:
                                    EdgeInsets.only(left: size.width * 0.08),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        radius: size.height * 0.025,
                                        backgroundImage: NetworkImage(
                                          app.indiviualProfileModel != null
                                              ? app.indiviualProfileModel!
                                                      .profileData!.image ??
                                                  "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg"
                                              : "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                        )),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '${app.indiviualProfileModel!.profileData!.firstName} ${app.indiviualProfileModel!.profileData!.lastName}',
                                              style: TextStyle(
                                                  fontFamily: 'MBold',
                                                  fontSize: size.height * 0.02,
                                                  color: bckgrnd),
                                            ),
                                            Text(
                                              '${app.indiviualProfileModel!.profileData!.email}',
                                              style: TextStyle(
                                                  fontFamily: 'Stf',
                                                  fontSize: size.height * 0.017,
                                                  color: bckgrnd),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Image.asset(safesheld_icon),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                        context) =>
                                                    const NotificationsScreen()));
                                      },
                                      child: Image.asset(
                                        notify_icon,
                                      )),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        _settingModalBottomSheet(context);
                                      },
                                      child: Icon(
                                        Icons.more_vert,
                                        color: bckgrnd,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.23),
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
                          top: size.height * 0.03),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'New Social Links',
                                style: TextStyle(
                                    fontSize: size.height * 0.025,
                                    fontFamily: "Msemibold"),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.013,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: size.height * 0.013,
                            ),
                            SizedBox(
                              // height: size.height * 0.055,
                              width: size.width,
                              child: TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Enter title";
                                  }
                                  return null;
                                },
                                controller: titleCon,
                                decoration: InputDecoration(
                                    hintText: 'Title',
                                    contentPadding: const EdgeInsets.only(
                                        top: 0.0, left: 22.0, bottom: 2.0),
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.02,
                                        color: infocolor,
                                        fontFamily: "Msemibold"),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            SizedBox(
                              // height: size.height * 0.055,
                              width: size.width,
                              child: TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Enter url";
                                  }
                                  return null;
                                },
                                controller: urlCon,
                                decoration: InputDecoration(
                                    hintText: 'Enter URL',
                                    contentPadding: const EdgeInsets.only(
                                        top: 0.0, left: 22.0, bottom: 2.0),
                                    hintStyle: TextStyle(
                                        fontSize: size.height * 0.02,
                                        color: infocolor,
                                        fontFamily: "Msemibold"),
                                    suffixIcon: Icon(
                                      Icons.link,
                                      size: 20,
                                      color: infocolor,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25))),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.025,
                            ),
                            InkWell(
                              onTap: () async {
                                getImageType(context, () async {
                                  Navigator.pop(context);
                                  app.setProfileImage(await ImagePickerMethods()
                                      .getImage(ImageSource.gallery));
                                }, () async {
                                  Navigator.pop(context);
                                  app.setProfileImage(await ImagePickerMethods()
                                      .getImage(ImageSource.camera));
                                });
                              },
                              child: app.postImage == null
                                  ? Container(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Container(
                                          //   child: Icon(
                                          //     Icons.delete,
                                          //     color: Colors.white,
                                          //     size: size.width * .06,
                                          //   ), // Image.asset(bin_icon),
                                          //   alignment: Alignment.topRight,
                                          //   margin: EdgeInsets.only(
                                          //       right: size.width * 0.03,
                                          //       top: size.height * 0.015),
                                          // ),
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
                                          )
                                          // : const SizedBox(
                                          //     height: 0,
                                          //     width: 0,
                                          //   ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      height: size.height * 0.15,
                                      width: size.width * 0.3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: FileImage(app.postImage!),
                                              fit: BoxFit.cover),
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
                                          InkWell(
                                            onTap: () {
                                              app.setProfileImage(null);
                                            },
                                            child: Container(
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: size.width * .06,
                                              ), // Image.asset(bin_icon),
                                              alignment: Alignment.topRight,
                                              margin: EdgeInsets.only(
                                                  right: size.width * 0.03,
                                                  top: size.height * 0.015),
                                            ),
                                          ),
                                        ],
                                      )),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            // const Spacer(),
                            InkWell(
                              onTap: () async {
                                if (!app.isLoading!) {
                                  if (formKey.currentState!.validate()) {
                                    app.setLoadingTrue();
                                    app.postImage != null
                                        ? await SocialLinksController()
                                            .addSocialLink(
                                            url: urlCon.text.trim(),
                                            title: titleCon.text.trim(),
                                            icon: app.postImage!.path,
                                          )
                                        : await SocialLinksController()
                                            .addSocialLink(
                                            url: urlCon.text.trim(),
                                            title: titleCon.text.trim(),
                                          );

                                    app.setLoadingFalse();
                                  }
                                }
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primarygreen),
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: size.height * 0.025,
                                        fontFamily: "Msemibold",
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            app.isLoading!
                ? Center(
                    child: SpinKitDualRing(color: primarygreen),
                  )
                : const SizedBox(height: 0, width: 0)
          ],
        ),
      );
    });
  }

  void _settingModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: Radius.circular(10))),
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
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Row(
                        children: [
                          Text(
                            'More options',
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontFamily: 'Mbold'),
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.close)),
                        ],
                      ),
                    ),
                    ListTile(
                        leading: Image.asset(
                          group,
                          color: signupclor_dark,
                        ),
                        title: Text(
                          'Groups',
                          style: TextStyle(
                              fontFamily: 'Msemibold',
                              fontSize: size.height * 0.015),
                        ),
                        onTap: () => {}),
                    ListTile(
                      leading: SvgPicture.asset(emailtwo_icon),
                      title: Text(
                        'Turn off notification',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset(newcntct_icon),
                      title: Text(
                        'Add to Contacts',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset(notfications_icon),
                      title: Text(
                        'Reminder',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset(favourite_icon),
                      title: Text(
                        'Add to Favorite',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    const SizedBox(
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
