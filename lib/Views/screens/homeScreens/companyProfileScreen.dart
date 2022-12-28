import 'dart:io';
import 'package:concard/Constants/globals.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/OthersController/general_method.dart';
import 'package:concard/Controllers/OthersController/image_picker_controller.dart';
import 'package:concard/Controllers/compnayControllers/postController.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/authScreens/individual/Social/new_social_link.dart';
import 'package:concard/Views/screens/homeScreens/analyticsScreen.dart';
import 'package:concard/Controllers/storyController/story_controller.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:concard/Views/screens/text_status_add.dart';
import 'package:concard/Views/screens/homeScreens/manageCompanyCards.dart';
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:concard/Views/screens/homeScreens/ratingReviewScreen.dart';
import 'package:concard/Views/screens/homeScreens/upgradeCompanyPremium/upgradeCompanyPremium.dart';
import 'package:concard/Views/widgets/imagePickerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../Constants/colors.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import '../../../Controllers/providers/story_provider.dart';
import '../story_view.dart';
import 'editMyCardScreen.dart';
import 'package:concard/Controllers/compnayControllers/product_and_services_controller.dart';
import 'package:concard/Views/widgets/add_product_and_services.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  File? postImage;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var textController = TextEditingController();
  // ProductAndServicesModel? productAndServices;

  @override
  void initState() {
    getProductsAndServices();
    getStories();
    print("this is user ID......." + Globals.userId.toString());
    print("this is Profile Pic......." + Globals.profilePic.toString());
    super.initState();
  }

  getStories() async {
    Globals.storyModel = await StoryController().getStories();
    setState(() {});
  }

  getProductsAndServices() async {
    var app = Provider.of<AppProvider>(context, listen: false);
    app.getProductAndServices();
    setState(() {});
  }

  File? uploadProfile;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, app, _) {
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
                      Consumer<StoryProvider>(
                        builder: (context, storyProvider, child) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  getImageType(
                                    context,
                                    () async {
                                      Navigator.pop(context);
                                      uploadProfile = await ImagePickerMethods().getImage(ImageSource.gallery);
                                      if (uploadProfile != null) {
                                        print(uploadProfile);
                                        await StoryController().addStory(file: uploadProfile);
                                      }
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                    () async {
                                      Navigator.pop(context);
                                      uploadProfile = await ImagePickerMethods().getImage(ImageSource.camera);
                                      if (uploadProfile != null) {
                                        print(uploadProfile);
                                        await StoryController().addStory(file: uploadProfile);
                                        StoryProvider().getStories();
                                      }
                                      if (mounted) {
                                        setState(() {});
                                      }
                                    },
                                    true,
                                    () {
                                      print("1");
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => TextStatusAdd()));
                                    },
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: size.height * 0.01,
                                  ),
                                  height: size.height * 0.07,
                                  width: size.height * 0.07,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(Globals.profilePic.toString()),
                                        radius: 28,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.white,
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Globals.storyModel != null
                                  ? Container(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(0),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: Globals.storyModel!.data!.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => StoryViewClass(
                                                    profilePicture: Globals.storyModel!.data![index].profileImage.toString(),
                                                    name:
                                                        "${Globals.storyModel!.data![index].firstName.toString()} ${Globals.storyModel!.data![index].lastName.toString()}",
                                                    // createdAt: Globals
                                                    //     .storyModel!
                                                    //     .data![index]
                                                    //     .stories![index]
                                                    //     .createdAt
                                                    //     .toString(),
                                                    stories: Globals.storyModel!.data![index].stories!,
                                                    // numOfStories: Globals.followingListModal!.data!.,
                                                  ),
                                                ),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  right: size.height * 0.01,
                                                ),
                                                child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                    Globals.storyModel != null
                                                        ? Globals.storyModel!.data![index].profileImage.toString()
                                                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA_RhLhMFQptcSkzBWhnq13UqR12y7mXuSVw&usqp=CAU',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      margin: EdgeInsets.only(
                                        top: size.height * 0.01,
                                      ),
                                      height: size.height * 0.1,
                                      // width: size.width * 0.9,
                                    )
                                  : Text('No data Found'),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                       GestureDetector(
                        onTap: ()async {
                          // _settingModalBottomSheet(context);
                          await GeneralMethodsDart().shareDataMethod(Globals.teamDetailModel!.teamInviteLink, "Click on link and join Company.");
                          
                        },
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient:
                                  LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [gradientgreen, primarygreen])),
                          child: Padding(
                            padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02),
                            child: Center(child: Text('Invite a user to join company', style: TextStyle(fontSize: size.height * 0.02, fontFamily: "Msemibold", color: bckgrnd))),
                          ),
                        ),
                      ),
                    
                        SizedBox(
                        height: size.height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          _settingModalBottomSheet(context);
                        },
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient:
                                  LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [gradientgreen, primarygreen])),
                          child: Padding(
                            padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: bckgrnd,
                                  size: 25,
                                ),
                                Text('Start a Post', style: TextStyle(fontSize: size.height * 0.02, fontFamily: "Msemibold", color: bckgrnd)),
                                Container(
                                  width: size.width * 0.03,
                                  height: size.height * 0.02,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        height: size.height * 0.3,
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
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    mycard_icon,
                                    height: size.height * 0.2,
                                    width: size.width * 0.8,
                                    fit: BoxFit.cover,
                                  )),
                              SizedBox(
                                height: size.height * 0.025,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                _comprofileModalBottomSheet(context);
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
                                _brochfileModalBottomSheet(context);
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
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RatingReviewScreen(userId: '',)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Rating & Reviews',
                                  style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  size: 25,
                                ),
                              ],
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AnalyticsScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Dashboard',
                              style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  'View',
                                  style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: gradientgreen),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Container(
                        height: size.height * 0.15,
                        width: size.width,
                        decoration: BoxDecoration(color: bckgrnd, borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: size.height * 0.11,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [prmryblue, darkblue])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '35',
                                          style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.03),
                                        ),
                                        SvgPicture.asset(
                                          groupreach_icon,
                                          color: bckgrnd,
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: size.height * 0.01, right: size.width * 0.02, left: size.width * 0.03),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: size.width * 0.017),
                                    child: Text(
                                      'Reached\nConcards',
                                      style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.017),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.11,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                    gradientgreen,
                                    primarygreen,
                                  ])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '24',
                                          style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.03),
                                        ),
                                        SvgPicture.asset(
                                          downloading_icon,
                                          color: bckgrnd,
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: size.height * 0.01, right: size.width * 0.02, left: size.width * 0.03),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: size.width * 0.017),
                                    child: Text(
                                      'Saved\nConcards',
                                      style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.017),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.11,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [signupclor_light, signupclor_dark])),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '12',
                                          style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.03),
                                        ),
                                        SvgPicture.asset(
                                          favoutline_icon,
                                          color: bckgrnd,
                                          height: size.height * 0.04,
                                        )
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: size.height * 0.01, right: size.width * 0.02, left: size.width * 0.03),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: size.width * 0.03),
                                    child: Text(
                                      'Favorites',
                                      style: TextStyle(fontFamily: "Msemibold", color: bckgrnd, fontSize: size.height * 0.017),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
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
                                'Contrary to popular belief, Lorem Ipsum is not\nsimply random text. It has roots in a piece of\nclassical Latin literature from 45 BC, making it over\n2000 years old.',
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
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CreateNewSocialLink()));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) =>
                          //             SocialLinksScreen()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Social media",
                              style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'Msemibold'),
                            ),
                            Container(
                              height: size.height * 0.035,
                              width: size.width * 0.2,
                              decoration: BoxDecoration(border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  'Add +',
                                  style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.018, color: txtcolr),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.001,
                          ),
                          GestureDetector(
                            child: Image.asset(circllinkedin_icon),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Image.asset(twitterone_icon),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Image.asset(circlefb_icon),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Image.asset(instaicon_icon),
                        ],
                      ),
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
                            itemExtent: 75,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                      "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                    ),
                                  ),
                                  Text(
                                    'Tomy jones',
                                    style: TextStyle(fontSize: size.height * 0.017, fontFamily: 'Msemibold'),
                                  ),
                                  Text(
                                    'Lorem ipsum',
                                    style: TextStyle(fontSize: size.height * 0.012, fontFamily: 'Stf'),
                                  ),
                                ],
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
                      backgroundColor: bckgrnd,
                      //Profile Pic internal Icon
                      backgroundImage: NetworkImage(Globals.profilePic.toString()),
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
    
    });
  }

  void _settingModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                // height: size.height * 0.6,
                padding: const EdgeInsets.only(bottom: 30),
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.03,
                                color: Colors.black,
                              ),
                              Text(
                                'Start a Post',
                                style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'Mbold'),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.close)),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.15,
                            width: size.width,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.grey[200]!), color: bckgrnd),
                            child: TextFormField(
                              validator: (String? value) {
                                // if (value!.isEmpty) {
                                //   return "Enter company name";
                                // }
                                return null;
                              },
                              maxLines: 10,
                              minLines: 8,
                              controller: textController,
                              decoration: InputDecoration(
                                  hintText: 'text',
                                  contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                  hintStyle: TextStyle(fontSize: size.height * 0.017, color: infocolor, fontFamily: "Stf"),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          postImage != null
                              ? Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: size.height * 0.08,
                                    width: size.width * .17,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: Colors.grey[200]!),
                                        color: Colors.grey[200]),
                                    child: Image.file(
                                      postImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: size.height * 0.08,
                                    width: size.width * .17,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(color: Colors.grey[200]!),
                                        color: Colors.grey[200]),
                                    // child: Image.file(postImage!),
                                  ),
                                ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () async {
                                  getImageType(
                                    context,
                                    () async {
                                      postImage = await ImagePickerMethods().getImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                      setSte(() {
                                        setState(() {});
                                      });
                                    },
                                    () async {
                                      postImage = await ImagePickerMethods().getImage(ImageSource.camera);
                                      Navigator.pop(context);
                                      setSte(() {
                                        setState(() {});
                                      });
                                    },
                                    false,
                                    () {
                                      print("1");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TextStatusAdd(),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    Image.asset(uploadimage_icon),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Text(
                                      'Photo',
                                      style: TextStyle(fontSize: size.height * 0.02, fontFamily: "Stf"),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Image.asset(uploadvideo_icon),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(
                                    'Video',
                                    style: TextStyle(fontSize: size.height * 0.02, fontFamily: "Stf"),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(uploadaudio_icon),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(
                                    'poll',
                                    style: TextStyle(fontSize: size.height * 0.02, fontFamily: "Stf"),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Image.asset(writepost_icon),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Text(
                                    'Article',
                                    style: TextStyle(fontSize: size.height * 0.02, fontFamily: "Stf"),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                setSte(() {
                                  context.read<AppProvider>().setLoadingTrue();
                                });
                              });

                              var response;
                              if (textController.text.isNotEmpty && postImage != null) {
                                response = await PostController().addPost(text: textController.text.trim(), postImage: postImage!.path);
                              } else if (postImage == null) {
                                response = await PostController().addPost(text: textController.text.trim());
                              } else if (textController.text.isEmpty) {
                                response = await PostController().addPost(postImage: postImage!.path);
                              } else {
                                showToastMethod(msg: "write text or pick image to contineue");
                              }
                              setState(() {
                                setSte(() {
                                  context.read<AppProvider>().setLoadingFalse();
                                });
                              });

                              if (response['code'] == 200) {
                                showToastMethod(msg: response['message']);
                              } else {
                                showToastMethod(msg: "Something went wrong. Try again later");
                              }
                              postImage = null;
                              textController.clear();
                              Navigator.pop(context);

                              setState(() {
                                setSte(() {});
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: size.height * 0.05,
                              width: size.width * 0.9,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                    context.read<AppProvider>().isLoading! ? Colors.green : signupclor_light,
                                    context.read<AppProvider>().isLoading! ? Colors.green : signupclor_dark
                                  ]),
                                  border: Border.all(color: Colors.grey),
                                  color: bckgrnd,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                // margin: EdgeInsets.only(left: size.width*0.04),
                                alignment: Alignment.center,
                                child: Text(
                                  context.read<AppProvider>().isLoading! ? 'Uploading post....' : 'Post',
                                  style: TextStyle(color: bckgrnd, fontSize: size.height * 0.025, fontFamily: "Msemibold"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void _comprofileModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: const BorderRadius.only(topLeft: const Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd, borderRadius: const BorderRadius.only(topLeft: const Radius.circular(10), topRight: Radius.circular(10))),
                height: size.height * 0.28,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Company Profile',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close, size: size.height * 0.025)),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compupload),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Upload New Profile',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compdelete),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Delete Current Profile',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  void _brochfileModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                decoration: BoxDecoration(
                    color: bckgrnd, borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: const Radius.circular(10))),
                height: size.height * 0.28,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Brochure',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close, size: size.height * 0.025)),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compupload),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Upload New Brochure',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.06,
                          ),
                          Row(
                            children: [
                              Image.asset(compdelete),
                              SizedBox(
                                width: size.width * 0.06,
                              ),
                              Text(
                                'Delete  Brochure',
                                style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                              )
                            ],
                          ),
                        ],
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
