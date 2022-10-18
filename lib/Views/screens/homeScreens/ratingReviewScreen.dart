import 'package:concard/Constants/images.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;

import '../../../Constants/colors.dart';
import '../../../Controllers/OthersController/date_time.dart';
import '../../../Controllers/RatingsController/add_rating_controller.dart';

class RatingReviewScreen extends StatefulWidget {
  RatingReviewScreen({Key? key, required this.userId}) : super(key: key);
  String? userId;
  @override
  State<RatingReviewScreen> createState() => _RatingReviewScreenState();
}

class _RatingReviewScreenState extends State<RatingReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRatingListData();
  }
  getRatingListData() async {
    Globals.ratingListModal = await RatingController().ratingList(widget.userId);
    
// print('id.....'+widget.id.toString());
    // print('Rating Views.........' + Globals.ratingListModal.toString());
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                    left: size.width * 0.04, right: size.width * 0.04),
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
                    Row(
                      children: [
                        SvgPicture.asset(ratereview_icon),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          'Ratings',
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.bold,
                              color: bckgrnd),
                        ),
                      ],
                    ),

                    // SizedBox(
                    //   width: 110,
                    // ),
                    Container(
                      width: size.width * 0.05,
                    ),
                    // Image.asset(notify_icon),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
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
              child:Globals.ratingListModal!=null? Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    top: size.height * 0.03,
                    right: size.width * 0.04),
                child:  Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Rating & Reviews',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              color: Colors.black,
                              fontFamily: 'MBold'),
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Image.asset(
                          downarrow_icon,
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    Container(
                      height: size.height * 0.77,
                      width: size.width,
                      child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: Globals.ratingListModal!.ratinListData!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Globals.ratingListModal!.ratinListData!=null? Container(
                              // height: size.height * 0.22,
                              width: size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.04,
                                    right: size.width * 0.04,
                                    top: size.height * 0.02,
                                    bottom: size.height*0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundImage:NetworkImage(Globals.ratingListModal!.ratinListData![index].user!.profileImage.toString())
                                        ),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  Globals.ratingListModal!.ratinListData![index].user!.firstName.toString() + Globals.ratingListModal!.ratinListData![index].user!.firstName.toString() ,
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.018,
                                                      fontFamily: "MBold"),
                                                ),
                                                Container(
                                                  child: RatingBar.builder(
                                                    itemSize:
                                                        size.height * 0.02,
                                                    initialRating: double.parse(Globals.ratingListModal!.ratinListData![index].rate!),
                                                    minRating: 0,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.0),
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: str_clr,
                                                    ),
                                                    onRatingUpdate: (ratingList) {
                                                      // print(rating);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: size.height * 0.04),
                                          child: Text(
                                             DateTimeManueplate()
                                                                .giveDifferenceInTime(
                                                                    DateTime.parse( Globals.ratingListModal!.ratinListData![index].createdAt.toString()))!
                                           ,
                                            style: TextStyle(
                                                fontFamily: 'Stf',
                                                fontSize: size.height * 0.018,
                                                color: infocolor),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Text(
                                      Globals.ratingListModal!.ratinListData![index].text.toString(),
                                      style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          fontFamily: "Msemibold"),
                                    )
                                  ],
                                ),
                              ),
                              margin:
                                  EdgeInsets.only(bottom: size.height * 0.02),
                            ):Center(
                              child: Text('There is no data'),
                                                        );
                          }),
                    ),
                  ],
                ),
              ):ShimmerLoadWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
