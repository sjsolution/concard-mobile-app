import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/OthersController/general_method.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';
import '../../../../Constants/colors.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:flutter/services.dart';

class InviteToJoinScreen extends StatelessWidget {
  InviteToJoinScreen({Key? key, required this.inviteLink}) : super(key: key);
  String? inviteLink;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
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
                      size: 20,
                      color: bckgrnd,
                    ),
                  ),
                  // SizedBox(
                  //   width: 110,
                  // ),
                  // SizedBox(
                  //   width: 5,
                  // ),
                  Text(
                    'Invite to Join',
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        fontFamily: 'Msemibold',
                        color: bckgrnd),
                  ),
                  // SizedBox(
                  //   width: 110,
                  // ),
                  Container(
                    width: size.width * 0.05,
                  )
                  // Image.asset(notify_icon),
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'Invite new member to your created team',
                    style: TextStyle(
                      fontSize: size.height * 0.018,
                      fontFamily: 'MBold',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'Contrary to popular belief, Lorem Ipsum is not\nsimply random text. It has roots in a piece of\nclassical Latin literature from 45 BC, making it over\n2000 years old.',
                    style: TextStyle(
                      fontSize: size.height * 0.015,
                      fontFamily: 'Msemibold',
                    ),
                  ),
                  shareTileWidget(size, () async {
                    print(inviteLink!);
                    await GeneralMethodsDart()
                        .shareDataMethod(inviteLink, 'Share this with you friends.');
                  }, sms_icon, 'Invite via SMS'),
                  shareTileWidget(size, () async {
                    await GeneralMethodsDart()
                        .shareDataMethod(inviteLink, 'Share this with you friends.');
                  }, mail_icon, 'Invite via Email'),
                  shareTileWidget(size, () async {
                    await GeneralMethodsDart().copyData(inviteLink);
                    // await Share.share(inviteLink!,
                    //     subject: 'Share this with you friends.');
                  }, link_icon, 'Copy invitation link'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  shareTileWidget(Size size, Function()? onTap, String? icon, String? text) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                icon!,
                height: size.height * 0.035,
              ),
              SizedBox(
                width: size.width * 0.1,
              ),
              Text(
                text!,
                style: TextStyle(
                  fontSize: size.height * 0.015,
                  fontFamily: 'Msemibold',
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 12,
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        const Divider(
          thickness: 1,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
      ],
    );
  }
}
