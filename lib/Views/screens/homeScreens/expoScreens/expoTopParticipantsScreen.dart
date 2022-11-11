import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';
import 'package:concard/Constants/globals.dart' as Globals;


class ExpoTopParticipantsScreen extends StatefulWidget {
   ExpoTopParticipantsScreen({Key? key,}) : super(key: key);

  @override
  State<ExpoTopParticipantsScreen> createState() => _ExpoTopParticipantsScreenState();
}

class _ExpoTopParticipantsScreenState extends State<ExpoTopParticipantsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
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
                              size: size.height * 0.02,
                              color: bckgrnd,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                expo_icon,
                                height: size.height * 0.025,
                                color: bckgrnd,
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Text(
                                'Expo',
                                style: TextStyle(
                                    fontSize: size.height * 0.018,
                                    fontFamily: "MBold",
                                    color: bckgrnd),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                notify_icon,
                                height: 30,
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.13),
              // height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.02),
                child:Globals.expoDetailModel!.expoDetaildata!.participants!=null? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Top Participants',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "MBold",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  Globals.expoDetailModel!.expoDetaildata!.participants!.isNotEmpty?  Container(
                        height: size.height * 0.25,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: bckgrnd,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: GridView.builder(
                            padding: const EdgeInsets.all(0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 2,
                              childAspectRatio: 4/ 4,
                              // mainAxisExtent: 150,
                            ),
                            itemCount: Globals.expoDetailModel!.expoDetaildata!.participants!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Padding(
                                padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03,top: size.height*0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: size.height * 0.02,
                                     backgroundImage: NetworkImage(Globals.expoDetailModel!.expoDetaildata!.participants![index].image.toString()),
                                      backgroundColor: infocolor.withOpacity(0.3),
                                    ),
                                    Text(
                                      Globals.expoDetailModel!.expoDetaildata!.participants![index].title.toString(),
                                      style: TextStyle(
                                          fontSize: size.height * 0.013,
                                          fontFamily: "Msemibold"),
                                    ),
                                    Text(
                                      Globals.expoDetailModel!.expoDetaildata!.participants![index].position.toString(),
                                      style: TextStyle(
                                          fontSize: size.height * 0.01,
                                          fontFamily: "Stf",
                                          color: infocolor),
                                    ),
                                  ],
                                ),
                              );
                            })):const Text('No Top Participants'),
                  ],
                ): const ShimmerLoadWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
