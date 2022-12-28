import 'package:concard/Constants/Colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:concard/Views/screens/homeScreens/manageCompanyCards.dart';
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:concard/Views/screens/homeScreens/upgradeCompanyPremium/upgradeCompanyPremium.dart';
import 'package:concard/Views/widgets/add_product_and_services.dart';
import'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:concard/Constants/globals.dart' as Globals;

import '../../../Controllers/RatingsController/add_rating_controller.dart';
import '../../../Controllers/providers/app_providers.dart';
import '../../../Models/Cards/single_card_detail_modal.dart';



class CompanyExEmployeeScreen extends StatefulWidget {
  CompanyExEmployeeScreen({Key? key,required this.individualUser}) : super(key: key);
  SingleProfileUser? individualUser;
  
  @override
  State<CompanyExEmployeeScreen> createState() => _CompanyExEmployeeScreenState();
}

class _CompanyExEmployeeScreenState extends State<CompanyExEmployeeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
   @override
  void initState() {
    super.initState();
   
    // isUserExist();
    // addMyNotes();
  }
//    addUserReview() async {
//     Globals.addUserRatingModal =
//         await RatingController().addUserRating('', '','' );
// // print('id.....'+widget.id.toString());
// // print('Singl card.........'+Globals.singleCardDetailModal.toString());
//     setState(() {});
//   }
  

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Consumer<AppProvider>(
      builder: (context, app,_) {
        return Scaffold(
            key: _scaffoldKey,
            drawer: DrawerMenuScreen(),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.35,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [signupclor_light, signupclor_dark]),
                    ),
                    child: Container(
                      width: size.width,
                      child: SvgPicture.asset(
                        prfilemask_icon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.28),
                    // height: size.height*0.8,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: btnclr,
                        borderRadius: const BorderRadius.only(
                          topLeft: const Radius.circular(15),
                          topRight: const Radius.circular(15),
                        )),
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.03),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Concard',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Mbold"),
                                  ),
                                  Text(
                                    'Company detail',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf", color: infocolor),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(stylearrw_icon)
                            ],
                          ),
                          // Stories View Line
                        
                         SizedBox(
                            height: size.height * 0.03,
                          ),
                           
                            SizedBox(
                            height: size.height * 0.03,
                          ),
                        
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            // height: size.height * 0.3,
                            width: size.width,
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ' Company Card',
                                          style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                          
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                'Edit Card',
                                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Stf'),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.03,
                                              ),
                                              Image.asset(
                                                edit_icon,
                                                color: cgreen,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                 cardWidget(context, app.individualProfileModel!.individualProfileDetailData!.singleProfileUser ),
                                 
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: size.height * 0.05,
                                    width: size.width * 0.4,
                                    decoration:
                                        BoxDecoration(border: Border.all(color: signupclor_dark), color: btnclr, borderRadius: BorderRadius.circular(30)),
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          'Profile file',
                                          style: TextStyle(color: signupclor_dark, fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: size.height * 0.05,
                                    width: size.width * 0.4,
                                    decoration:
                                        BoxDecoration(border: Border.all(color: signupclor_dark), color: btnclr, borderRadius: BorderRadius.circular(30)),
                                    child: Container(
                                      margin: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.02),
                                      child: Center(
                                        child: Text(
                                          'Brochure file',
                                          style: TextStyle(color: signupclor_dark, fontSize: size.height * 0.015, fontFamily: "Msemibold"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                               _reviewModalBottomSheet(
                                            context,
                                           widget.individualUser);
                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RatingReviewScreen(userId: '',)));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Container(
                                            height: size.height * 0.04,
                                            width: size.width * 0.25,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: gradientgreen),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.02,
                                                  right: size.width * 0.01),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      'Review',
                                                      style: TextStyle(
                                                          fontFamily: 'MBold',
                                                          fontSize:
                                                              size.height *
                                                                  0.018,
                                                          color: gradientgreen),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    star_icon,
                                                    color: gradientgreen,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        
                                Row(
                                  children: [
                                    Container(
                                      child: RatingBar.builder(
                                        itemSize: size.height * 0.02,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: primarygreen,
                                        ),
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.01,
                                    ),
                                    Text(
                                      '4.5',
                                      style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                        
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                                Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Notes',
                                          style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              color: Colors.black,
                                              fontFamily: 'Mbold'),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                          
                                          },
                                          child: Container(
                                            height: size.height * 0.04,
                                            width: size.width * 0.2,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: gradientgreen),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                'Edit',
                                                style: TextStyle(
                                                    fontFamily: 'MBold',
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: gradientgreen),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                      SizedBox(
                                      height: size.height * 0.015,
                                    ),
                                    Container(
                                      height: size.height*0.15,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: bckgrnd),
                                        child: Container(
                                              width: size.width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(''),
                                              ),
                                            )
                                        
                                    ),
                          Row(
                            children: [
                              Text(
                                "product & Services",
                                style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(
                                app.productAndServicesModel?.data?.length == null ? "0" : app.productAndServicesModel!.data!.length.toString(),
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: primarygreen,
                                  fontFamily: 'Mbold',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Wrap(
                            children: List.generate(
                              app.productAndServicesModel?.data?.length == null ? 0 : app.productAndServicesModel!.data!.length + 1,
                              (index) {
                                if (index == app.productAndServicesModel!.data!.length) {
                                  return Padding(
                                    padding: EdgeInsets.only(left: size.width * 0.01, right: size.width * 0.01, top: size.height * 0.01),
                                    child: InkWell(
                                      onTap: () {
                                        app.setLoadingTrue();
                                        addProductsAndServices(context);
                                        app.setLoadingFalse();
                                      },
                                      child: Container(
                                        height: size.height * 0.03,
                                        width: size.width * 0.15,
                                        decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                                        child: Center(
                                          child: Text(
                                            'Add +',
                                            style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: txtcolr),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                                    height: size.height * 0.04,
                                    width: size.width * 0.2,
                                    child: Center(
                                      child: Text(
                                        app.productAndServicesModel!.data![index].name.toString(),
                                        style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.015),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Container(
                          //   width: size.width,
                          //   decoration: BoxDecoration(
                          //     color: bckgrnd,
                          //     borderRadius: BorderRadius.circular(15),
                          //   ),
                          //   child:
                          //           }
                          //           return Padding(
                          //             padding: const EdgeInsets.all(3),
                          //             child: Container(
                          //               decoration: BoxDecoration(color: btnclr, borderRadius: BorderRadius.circular(15)),
                          //               height: size.height * 0.04,
                          //               width: size.width * 0.2,
                          //               child: Center(
                          //                 child: Text(
                          //                   app.productAndServicesModel!.data![index].name.toString(),
                          //                   style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.015),
                          //                 ),
                          //               ),
                          //             ),
                          //           );
                          //         },
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: size.height * 0.035,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "About",
                                style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
                              ),
                              Container(
                                height: size.height * 0.035,
                                width: size.width * 0.2,
                                decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.018, color: txtcolr),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Container(
                            height: size.height * 0.13,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                app.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileAbout!.text.toString(),
                                    
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          GestureDetector(
                            onTap: () {
                             
                            },
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Social media",
                                style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                           Globals
                                              .singleCardDetailModal!=null?
                           Container(
                                      height: size.height * 0.1,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.all(0),
                                          itemCount: Globals
                                              .singleCardDetailModal!
                                              .singleCardData!
                                              .socialLinks!
                                              .length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: size.width * 0.03,
                                                    ),
                                                    Image.network(
                                                      Globals
                                                          .singleCardDetailModal!
                                                          .singleCardData!
                                                          .socialLinks![index]
                                                          .image
                                                          .toString(),
                                                      height:
                                                          size.height * 0.04,
                                                    )
                                                  ],
                                                )
                                              ],
                                            );
                                          }),
                                    ):Text('no links'),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       width: size.width * 0.001,
                          //     ),
                          //     GestureDetector(
                          //       child: Image.asset(circllinkedin_icon),
                          //     ),
                          //     SizedBox(
                          //       width: size.width * 0.03,
                          //     ),
                          //     Image.asset(twitterone_icon),
                          //     SizedBox(
                          //       width: size.width * 0.03,
                          //     ),
                          //     Image.asset(circlefb_icon),
                          //     SizedBox(
                          //       width: size.width * 0.03,
                          //     ),
                          //     Image.asset(instaicon_icon),
                          //   ],
                          // ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Conmpany/ Team members",
                                    style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      color: Colors.black,
                                      fontFamily: 'Msemibold',
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Image.asset(
                                    hideeye_icon,
                                    height: size.height * 0.04,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => ManageCompanyCardsScreen()));
                                },
                                child: Container(
                                  height: size.height * 0.035,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      'Manage',
                                      style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.018, color: txtcolr),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Container(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                scrollDirection: Axis.horizontal,
                                itemCount: app.individualProfileModel!.individualProfileDetailData!.companyMembers!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:  EdgeInsets.only(left: size.width*0.03),
                                    child: Column(
                                      children: [
                                         CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                            app.individualProfileModel!.individualProfileDetailData!.companyMembers![index].image.toString()??
                                            "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                          ),
                                        ),
                                        Text(
                                          "${app.individualProfileModel!.individualProfileDetailData!.companyMembers![index].firstName}"+"${app.individualProfileModel!.individualProfileDetailData!.companyMembers![index].lastName}".toString(),
                                          style: TextStyle(fontSize: size.height * 0.017, fontFamily: 'Msemibold'),
                                        ),
                                        Text(
                                          app.individualProfileModel!.individualProfileDetailData!.companyMembers![index].companyName.toString(),
                                          style: TextStyle(fontSize: size.height * 0.012, fontFamily: 'Stf'),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                            margin: const EdgeInsets.only(
                              top: 15,
                            ),
                            height: size.height * 0.15,
                            width: size.width * 0.9,
                          ),
                          const SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: size.height * 0.15, left: size.width * 0.04),
                        child: CircleAvatar(
                          radius: 35,
                          //Profile Pic internal Icon
                          backgroundImage: NetworkImage(widget.individualUser!.profileImage.toString()),
                          // child: SvgPicture.asset(con_icon),
                        ),
                      ),
                      Container(margin: EdgeInsets.only(top: size.height * 0.21, left: size.width * 0.18), child: Image.asset(compcamera_icon)),
                    ],
                  ),
                  InkWell(
                    onTap: () => _scaffoldKey.currentState!.openDrawer(),
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.08, left: size.width * 0.04),
                      child: Image.asset(more_icon),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.08),
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NotificationsScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: size.width * 0.04),
                              child: Image.asset(notify_icon),
                            )),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => UpgradeToPremiumCompanyScreen()));
                          },
                          child: Container(
                            height: size.height * 0.04,
                            width: size.width * 0.3,
                            decoration: BoxDecoration(
                                color: bckgrnd.withOpacity(0.1),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: size.width * 0.04,
                                right: size.width * 0.01,
                              ),
                              child: Row(children: [
                                Image.asset(
                                  premium_icon,
                                  height: size.height * 0.04,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  'Premium',
                                  style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold", color: bckgrnd),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          height: size.height * 0.04,
                          width: size.width * 0.32,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(topLeft: const Radius.circular(10), bottomLeft: Radius.circular(10)),
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  camera_icon,
                                  height: size.height * 0.015,
                                ),
                                Text(
                                  'Select a cover photo',
                                  style: TextStyle(fontFamily: "MBold", fontSize: size.height * 0.011, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
      }
    );
    
  }
    Widget cardWidget(context, SingleProfileUser? individualUser){
    
    var size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.29,
      // margin:const EdgeInsets.all(0.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                deccard,
                height: size.height * 0.25,
                fit: BoxFit.cover,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: size.height * 0.018,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.047,
                  left: size.width * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(con_icon),
                            const SizedBox(height: 10 //size.height * 0.015,
                                ),
                            Text(
                              "CONCARD",
                              style: TextStyle(
                                fontSize: size.height * 0.016,
                                color: signupclor_dark,
                                fontFamily: "Mbold",
                                letterSpacing: 5,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            PrettyQr(
                              typeNumber: 4,
                              size: size.height * 0.06,
                              data: '${individualUser!.id.toString() ?? ""}',
                              errorCorrectLevel: QrErrorCorrectLevel.M,
                              roundEdges: true,
                            ),
                          ],
                        ),
                        SizedBox(width: size.width * 0.03),
                        Container(
                          height: size.height * 0.2,
                          width: 1,
                          color: cgreen,
                        ),
                        SizedBox(width: size.width * 0.08),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${individualUser!= null ? individualUser!.toString() : ''}",
                              style: TextStyle(
                                fontSize: size.height * 0.013,
                                color: signupclor_dark,
                                fontFamily: "Mbold",
                              ),
                            ),
                            Text(
                              "${individualUser!.jobTitle!= null ? individualUser!.jobTitle.toString() : ''}",
                              style: TextStyle(
                                fontSize: size.height * 0.015,
                                color: signupclor_dark,
                                fontFamily: "Stf",
                              ),
                            ),
                            const SizedBox(height: 8 //size.height * 0.01,
                                ),
                            Row(
                              children: [
                                Column(children: [
                                  SvgPicture.asset(location_icon),
                                ]),
                                const SizedBox(width: 10 //size.width * 0.015,
                                    ),
                                Container(
                                  width: size.width * .28,
                                  child: Column(children: [
                                    Text(
                                      "${individualUser!.address.toString()}",
                                      style: TextStyle(
                                        fontSize: size.height * 0.01,
                                        color: signupclor_dark,
                                        fontFamily: "Mbold",
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(phonecall_icon),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text(
                                  individualUser!.mobileNumber.toString(),
                                  style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    color: signupclor_dark,
                                    fontFamily: "Mbold",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  email_icon,
                                  color: signupclor_dark,
                                ),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Container(
                                  width: size.width * .27,
                                  child: Column(
                                    children: [
                                      Text(
                                       individualUser!.email.toString(),
                                        style: TextStyle(
                                          fontSize: size.height * 0.012,
                                          color: signupclor_dark,
                                          fontFamily: "Mbold",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(internet_icon),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Container(
                                  // width: size.width * .35,
                                  child: Column(
                                    children: [
                                      Text(
                                        "${individualUser!.website}",
                                        style: TextStyle(
                                          fontSize: size.height * 0.015,
                                          color: signupclor_dark,
                                          fontFamily: "Mbold",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: size.height * 0.02,
              ),
            ],
          ),
        ],
      ),
    );
  }

 void _reviewModalBottomSheet(context, SingleProfileUser? individualUser){   
   var reviewController = TextEditingController();
    double? myRating;
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
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
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: Image.asset(
                                    star_icon,
                                    color: cgreen,
                                  ),
                                  // height: size.height*0.1,
                                  // width: size.width*0.15,
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                Text(
                                  'Add Review',
                                  style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      fontFamily: 'Msemibold'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Divider(
                              indent: 5,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                              child: RatingBar.builder(
                                itemSize: size.height * 0.05,
                                initialRating: 0,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: str_clr,
                                ),
                                onRatingUpdate: (value) {
                                  // print(rating);
                                  myRating = value;
                                  setSte(() {
                                    setState(() {});
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.015,
                            ),
                            Divider(
                              indent: 5,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            TextFormField(
                              controller: reviewController,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.withOpacity(0.1),
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintText: 'Describe your review',
                                  hintStyle: TextStyle(
                                      fontSize: size.height * 0.015,
                                      fontFamily: "Msemibold")),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            InkWell(
                              onTap: () async {
                               
                                  Globals.addUserRatingModal = await RatingController().addUserRating(
                                        reviewController.text.trim(),
                                        myRating.toString(),
                                        widget.individualUser!.id.toString());
                                        // print(widget.individualUserData!.individualUser!.id.toString());

                                // debugPrint('id.............................'+user.id.toString());
                                setSte(() {
                                  setState(() {});
                                });
                                if (Globals.addUserRatingModal!.code == 200) {
                                  Globals.showToastMethod(
                                      msg: 'You Rated Successfuly');
                                  Navigator.pop(context);

                                } else {
                                  Globals.showToastMethod(
                                      msg: 'There is something wromg');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: size.height * 0.06,
                                width: size.width,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        signupclor_light,
                                        signupclor_dark
                                      ]),
                                  border: Border.all(color: Colors.grey),
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                  // margin: EdgeInsets.only(left: size.width*0.04),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Add review',
                                    style: TextStyle(
                                        color: bckgrnd,
                                        fontSize: size.height * 0.018,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Stf'),
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
              );
            },
          );
        });
  }
}