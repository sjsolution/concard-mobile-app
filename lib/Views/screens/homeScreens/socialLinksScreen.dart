import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/individual/Social/new_social_link.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:concard/Views/widgets/socialLinksField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import 'notifications/notificationsScreen.dart';

class SocialLinksScreen extends StatelessWidget {
  SocialLinksScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var linkdinCon = TextEditingController();
    var twitterCon = TextEditingController();
    var facebookCon = TextEditingController();
    var instagramCon = TextEditingController();
    var beCon = TextEditingController();
    var attachmentCon = TextEditingController();
    var titleCon = TextEditingController();
    var urlCon = TextEditingController();
    var size = MediaQuery.of(context).size;

    return Consumer<AppProvider>(builder: (context, app, _) {
      return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
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
                          // InkWell(
                          //     onTap: () =>
                          //         _scaffoldKey.currentState!.openDrawer(),
                          //     child: Image.asset(
                          //       more_icon,
                          //       height: 15,
                          //     )),
                          Container(
                            margin: EdgeInsets.only(left: size.width * 0.08),
                            child: Column(
                              children: [
                                CircleAvatar(
                                    radius: size.height * 0.025,
                                    backgroundImage: NetworkImage(
                                      app.indiviualProfileModel != null
                                          ? app.indiviualProfileModel!.profileData!
                                                  .image ??
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
                                            builder: (BuildContext context) =>
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
                            'Social Links',
                            style: TextStyle(
                                fontSize: size.height * 0.025,
                                fontFamily: "Msemibold"),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        SocialLinksField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter url";
                            }
                            return null;
                          },
                          hinttext: 'Enter URL',
                          controller: linkdinCon,
                          textInputType: TextInputType.text,
                          image: linkdin,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SocialLinksField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter url";
                            }
                            return null;
                          },
                          hinttext: 'Enter URL',
                          controller: twitterCon,
                          textInputType: TextInputType.text,
                          image: twiter,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SocialLinksField(
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter url";
                              }
                              return null;
                            },
                            hinttext: 'Enter URL',
                            controller: facebookCon,
                            textInputType: TextInputType.text,
                            image: facebook),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SocialLinksField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter url";
                            }
                            return null;
                          },
                          hinttext: 'Enter URL',
                          controller: instagramCon,
                          textInputType: TextInputType.text,
                          image: instagram,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SocialLinksField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter url";
                            }
                            return null;
                          },
                          hinttext: 'Enter URL',
                          controller: beCon,
                          textInputType: TextInputType.text,
                          image: behance,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SocialLinksField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Enter url";
                            }
                            return null;
                          },
                          hinttext: 'Enter URL',
                          controller: beCon,
                          textInputType: TextInputType.text,
                          image: link,
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SizedBox(
                          height: size.height * 0.013,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        
                        SizedBox(
                          height: size.height * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            CreateNewSocialLink()));
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey),
                                child: Center(
                                  child: Text(
                                    'Add New',
                                    style: TextStyle(
                                        fontSize: size.height * 0.025,
                                        fontFamily: "Msemibold",
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                   
                                // if (formKey.currentState!.validate()) {}
                              },
                              child: Container(
                                height: size.height * 0.05,
                                width: size.width * 0.4,
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
                          ],
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
