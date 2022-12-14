import 'package:concard/Controllers/CardsController/card_controller.dart';
import 'package:concard/Controllers/RatingsController/add_rating_controller.dart';
import 'package:concard/Controllers/notes_controller/notes_controller.dart';
import 'package:concard/Views/screens/homeScreens/editMyCardScreen.dart';
import 'package:concard/Models/Cards/single_card_detail_modal.dart';
import 'package:concard/Views/screens/homeScreens/inviteContact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:intl/intl.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import '../../widgets/shimmer_widgets.dart';
import 'individualPremium/individualPremiumScreen.dart';
import 'package:concard/Views/widgets/loader_widget.dart';

class ContactProfileViewScreen extends StatefulWidget {
  ContactProfileViewScreen(
      {Key? key,
      required this.id,
      required this.email,
      required this.phoneNumber})
      : super(key: key);
  String? id;
  String? noteId;
  String? email;
  String? phoneNumber;
  @override
  State<ContactProfileViewScreen> createState() =>_ContactProfileViewScreenState();
}

class _ContactProfileViewScreenState extends State<ContactProfileViewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool? addValue = false;
  bool? inviteValue = true;
  @override
  void initState() {
    super.initState();
    getSingleCardDetail();
    getProductAndServices(context);
    // isUserExist();
    // addMyNotes();
  }

  var userExist;
  isUserExist() async {
    userExist = await CardController()
        .UserExist([widget.email.toString()], [widget.phoneNumber.toString()]);
  }

  String? myNotes;
  getSingleCardDetail() async {
    Globals.singleCardDetailModal = await CardController().singleContatProfile(
      widget.id.toString(),
    );
    if (Globals.singleCardDetailModal != null) {
      if (Globals.singleCardDetailModal!.singleCardData!.notes!.id != null) {
        myNotes = Globals.singleCardDetailModal!.singleCardData!.notes!.text;
        setState(() {});
      } else {
        myNotes = '';
        setState(() {});
      }
    }
// print('id.....'+widget.id.toString());
// print('Singl card.........'+Globals.singleCardDetailModal.toString());'

    setState(() {});
  }

  getProductAndServices(BuildContext context) async {
    appPro = Provider.of<AppProvider>(context, listen: false);
    appPro!.getProductAndServices();
    setState(() {});
  }

  AppProvider? appPro;

  addUserReview() async {
    Globals.addUserRatingModal =
        await RatingController().addUserRating('', '', '');
// print('id.....'+widget.id.toString());
// print('Singl card.........'+Globals.singleCardDetailModal.toString());
    setState(() {});
  }

  var addNotes;
// addMyNotes()async{
//   addNotes= await AddNotesController().addNotes('', '', '');
//   print('----------------'+ addNotes.toString());
//   setState(() {

//   });
// }

  double? rating;

  TextEditingController editNotesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Globals.singleCardDetailModal != null
          ? Stack(
              children: [
                Container(
                  height: size.height * 0.25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topCenter,
                        colors: [signupclor_light, signupclor_dark]),
                  ),
                  child: Stack(
                    children: [
                      //premium code
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => IndividualPremiumScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * 0.1),
                            child: Container(
                              alignment: Alignment.center,
                              // margin: EdgeInsets.only(left: 10.0),
                              // padding: EdgeInsets.only(left: 07.0),
                              height: size.height * 0.05,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: bckgrnd.withOpacity(0.1),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 3.0, bottom: 09.0),
                                  child: Image.asset(
                                    premium_icon,
                                    // height: size.width * 0.07,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    'Premium',
                                    style: TextStyle(
                                        fontSize: size.height * 0.015,
                                        fontFamily: "MBold",
                                        color: bckgrnd),
                                  ),
                                ),
                              ]),
                            ),
                          )),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.04,
                                  right: size.width * 0.04,
                                  top: size.height * 0.06),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
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
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(Globals
                                                        .singleCardDetailModal!
                                                        .singleCardData!
                                                        .singleCardUser!
                                                        .profileImage !=
                                                    null
                                                ? Globals
                                                    .singleCardDetailModal!
                                                    .singleCardData!
                                                    .singleCardUser!
                                                    .profileImage
                                                    .toString()
                                                : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpbz6iSjWmkBiY-Dzq7vWazUn16lI4qiS2Dg&usqp=CAU"),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                Globals
                                                            .singleCardDetailModal!
                                                            .singleCardData!
                                                            .singleCardUser!
                                                            .firstName !=
                                                        null
                                                    ? Globals
                                                            .singleCardDetailModal!
                                                            .singleCardData!
                                                            .singleCardUser!
                                                            .firstName
                                                            .toString() +
                                                        Globals
                                                            .singleCardDetailModal!
                                                            .singleCardData!
                                                            .singleCardUser!
                                                            .firstName
                                                            .toString()
                                                    : '',
                                                style: TextStyle(
                                                    fontFamily: 'MBold',
                                                    fontSize:
                                                        size.height * 0.015,
                                                    color: bckgrnd),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              SvgPicture.asset(safesheld_icon),
                                            ],
                                          ),
                                          Text(
                                            Globals
                                                        .singleCardDetailModal!
                                                        .singleCardData!
                                                        .jobTitle !=
                                                    null
                                                ? Globals.singleCardDetailModal!
                                                    .singleCardData!.jobTitle
                                                    .toString()
                                                : '',
                                            style: TextStyle(
                                                fontFamily: 'Stf',
                                                fontSize: size.height * 0.017,
                                                color: bckgrnd),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          SvgPicture.asset(bellIcon),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: SvgPicture.asset(notifyDot),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: size.width * 0.02),
                                      InkWell(
                                          onTap: () {
                                            _moreModalBottomSheet(context);
                                          },
                                          child: Icon(
                                            Icons.more_vert,
                                            color: bckgrnd,
                                          ))
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.26),
                  // height: size.height*0.8,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            left: size.width * 0.1,
                            right: size.width * 0.14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                _switchaccountModalBottomSheet(context);
                              },
                              child: Image.asset(
                                switch_icon,
                                height: size.height * 0.03,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(right: size.width * 0.03),
                                child: Image.asset(
                                  planner_icon,
                                  height: size.height * 0.03,
                                )),
                            SizedBox(
                              width: size.width * 0.03,
                            ),
                            SvgPicture.asset(
                              stylearrw_icon,
                              height: size.height * 0.03,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.33),
                  // height: size.height*0.8,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: btnclr,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: Globals.singleCardDetailModal != null
                      ? ListView(
                          padding: EdgeInsets.all(0),
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: size.width * 0.04,
                                  right: size.width * 0.04),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.015,
                                    ),
                                    Container(
                                      // height: size.height * 0.365,
                                      // width: size.width,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.015,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.02,
                                                  right: size.width * 0.01),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    ' Card',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.018,
                                                        fontFamily: 'MBold'),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    // => Navigator.push(context, MaterialPageRoute(builder: (context) => EditMyCardScreen())),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Edit Card',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  size.height *
                                                                      0.015,
                                                              fontFamily:
                                                                  'Msemibold'),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.03,
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
                                              height: size.height * 0.025,
                                            ),
                                            cardWidget(
                                                context,
                                                Globals.singleCardDetailModal!
                                                    .singleCardData)
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.41,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: signupclor_dark),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              'Company Profile',
                                              style: TextStyle(
                                                  fontFamily: 'MBold',
                                                  fontSize: size.height * 0.018,
                                                  color: signupclor_dark),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: size.height * 0.04,
                                          width: size.width * 0.43,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: signupclor_dark),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Center(
                                            child: Text(
                                              'Brochure ',
                                              style: TextStyle(
                                                  fontFamily: 'MBold',
                                                  fontSize: size.height * 0.018,
                                                  color: signupclor_dark),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _reviewModalBottomSheet(
                                            context,
                                            Globals
                                                .singleCardDetailModal!
                                                .singleCardData!
                                                .singleCardUser);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                  initialRating: 0,
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
                                                    color: primarygreen,
                                                  ),
                                                  onRatingUpdate: (value) {
                                                    // print(value);
                                                    rating = value;
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.01,
                                              ),
                                              Text(
                                                rating != null
                                                    ? rating.toString()
                                                    : '0',
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: Colors.black,
                                                    fontFamily: 'Mbold'),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
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
                                            //  yaha pr api ka notes sy parmaeter pass krna ha
                                            editNotesController.text =
                                                myNotes.toString();

                                            _showEditNotesPopUp(
                                              context,
                                            );
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
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: bckgrnd),
                                      child: myNotes != null
                                          ? Container(
                                              width: size.width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(myNotes!),
                                              ),
                                            )
                                          : Text('no data'),
                                    ),
                                    // Container(
                                    //   child: TextFormField(
                                    //      controller: textFieldController,
                                    //      enabled: false,
                                    //      decoration: InputDecoration(
                                    //        contentPadding: EdgeInsets.only(top: 0,left: 22,right: 10,bottom:10),
                                    //        fillColor: bckgrnd,
                                    //        filled: true,
                                    //        enabledBorder: OutlineInputBorder(
                                    //          borderRadius: BorderRadius.circular(15),
                                    //          borderSide:BorderSide(color: bckgrnd),

                                    //        ),
                                    //        focusedBorder: OutlineInputBorder(
                                    //          borderRadius: BorderRadius.circular(20),
                                    //          borderSide:BorderSide(color: bckgrnd),

                                    //        ),
                                    //      ),
                                    //    ),
                                    // ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "product & Services",
                                          style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              color: Colors.black,
                                              fontFamily: 'Mbold'),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Text(
                                          appPro?.productAndServicesModel?.data
                                                      ?.length ==
                                                  null
                                              ? "0"
                                              : appPro!.productAndServicesModel!
                                                  .data!.length
                                                  .toString(),
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

                                    appPro?.productAndServicesModel?.data
                                                ?.length ==
                                            null
                                        ? Container(
                                            width: size.width,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              color: bckgrnd,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 5,
                                                vertical: 10,
                                              ),
                                              child: Text(
                                                  "No Current Product and Services"),
                                            ),
                                          )
                                        : Container(
                                            width: size.width,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            decoration: BoxDecoration(
                                              color: bckgrnd,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 5,
                                                vertical: 10,
                                              ),
                                              child: Wrap(
                                                children: List.generate(
                                                  appPro?.productAndServicesModel
                                                              ?.data?.length ==
                                                          null
                                                      ? 0
                                                      : appPro!
                                                          .productAndServicesModel!
                                                          .data!
                                                          .length,
                                                  (index) {
                                                    // if (index == appPro!.productAndServicesModel!.data!.length) {
                                                    //   return Padding(
                                                    //     padding:
                                                    //         EdgeInsets.only(left: size.width * 0.01, right: size.width * 0.01, top: size.height * 0.01),
                                                    //     child: InkWell(
                                                    //       onTap: () {
                                                    //         appPro!.setLoadingTrue();
                                                    //         getProductAndServices(context);
                                                    //         appPro!.setLoadingFalse();
                                                    //       },
                                                    //       child: Container(
                                                    //         height: size.height * 0.03,
                                                    //         width: size.width * 0.15,
                                                    //         decoration: BoxDecoration(
                                                    //             border: Border.all(color: gradientgreen), borderRadius: BorderRadius.circular(15)),
                                                    //         child: Center(
                                                    //           child: Text(
                                                    //             'Add +',
                                                    //             style: TextStyle(fontFamily: 'MBold', fontSize: size.height * 0.015, color: txtcolr),
                                                    //           ),
                                                    //         ),
                                                    //       ),
                                                    //     ),
                                                    //   );
                                                    // }
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: btnclr,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        height:
                                                            size.height * 0.04,
                                                        width: size.width * 0.2,
                                                        child: Center(
                                                          child: Text(
                                                            appPro!
                                                                .productAndServicesModel!
                                                                .data![index]
                                                                .name
                                                                .toString(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Msemibold",
                                                                fontSize:
                                                                    size.height *
                                                                        0.015),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      height: size.height * 0.035,
                                    ),
                                    Text(
                                      "About",
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: Colors.black,
                                          fontFamily: 'Mbold'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.015,
                                    ),
                                    Container(
                                      // height: size.height * 0.13,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        color: bckgrnd,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              Globals
                                                  .singleCardDetailModal!
                                                  .singleCardData!
                                                  .singleCardUser!
                                                  .about
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: size.height * 0.015,
                                                  fontFamily: "Stf"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    Text(
                                      "Social media",
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: Colors.black,
                                          fontFamily: 'MBold'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.025,
                                    ),
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
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    Text(
                                      "Added Time & Location",
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: Colors.black,
                                          fontFamily: 'MBold'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.025,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          timer_icon,
                                          color: signupclor_dark,
                                          height: size.height * 0.03,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                        Text(
                                          Globals
                                                      .singleCardDetailModal!
                                                      .singleCardData!
                                                      .meetingDateTime !=
                                                  null
                                              ? DateFormat('EEE,').format(DateTime.parse(Globals.singleCardDetailModal!.singleCardData!.meetingDateTime.toString())) +
                                                  '' +
                                                  DateFormat(' d').format(
                                                      DateTime.parse(Globals
                                                          .singleCardDetailModal!
                                                          .singleCardData!
                                                          .meetingDateTime
                                                          .toString())) +
                                                  'th ' +
                                                  DateFormat('MMM y').format(
                                                      DateTime.parse(Globals
                                                          .singleCardDetailModal!
                                                          .singleCardData!
                                                          .meetingDateTime
                                                          .toString())) +
                                                  " " +
                                                  DateFormat('KK:mm a')
                                                      .format(DateTime.parse(Globals.singleCardDetailModal!.singleCardData!.meetingDateTime.toString()))
                                              : '',
                                          style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              color: Colors.black,
                                              fontFamily: 'Stf'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.025,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          locationarrow,
                                        ),
                                        SizedBox(
                                          width: size.width * 0.04,
                                        ),
                                        Text(
                                          Globals
                                                      .singleCardDetailModal!
                                                      .singleCardData!
                                                      .location !=
                                                  null
                                              ? Globals.singleCardDetailModal!
                                                  .singleCardData!.location
                                                  .toString()
                                              : '',
                                          style: TextStyle(
                                              fontSize: size.height * 0.018,
                                              color: Colors.black,
                                              fontFamily: 'Stf'),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    Text(
                                      "Groups",
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: Colors.black,
                                          fontFamily: 'MBold'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        //  Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCardsToGroupScreen()));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            grptwo_icon,
                                            height: size.height * 0.025,
                                          ),
                                          SizedBox(
                                            width: size.width * 0.04,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Managers,",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: Colors.black,
                                                    fontFamily: 'Stf'),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Text(
                                                "Favorites",
                                                style: TextStyle(
                                                    fontSize:
                                                        size.height * 0.018,
                                                    color: Colors.black,
                                                    fontFamily: 'Stf'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    Text(
                                      "Company/ Team members",
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          color: Colors.black,
                                          fontFamily: 'MBold'),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.04,
                                    ),
                                    Container(
                                      child: ListView.builder(
                                          padding: EdgeInsets.all(0),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: Globals
                                              .singleCardDetailModal!
                                              .singleCardData!
                                              .companyMembers!
                                              .length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.only(
                                                  left: size.width * 0.04),
                                              child: Column(
                                                children: [
                                                  CircleAvatar(
                                                    radius: size.height * 0.03,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      Globals
                                                              .singleCardDetailModal!
                                                              .singleCardData!
                                                              .companyMembers![
                                                                  index]
                                                              .profileImage
                                                              .toString() ??
                                                          "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                                    ),
                                                  ),
                                                  Text(
                                                    "${Globals.singleCardDetailModal!.singleCardData!.companyMembers![index].firstName.toString()}" +
                                                        "${Globals.singleCardDetailModal!.singleCardData!.companyMembers![index].lastName.toString()}",
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.015,
                                                        fontFamily: 'MBold'),
                                                  ),
                                                  Text(
                                                    Globals
                                                                .singleCardDetailModal!
                                                                .singleCardData!
                                                                .companyMembers![
                                                                    index]
                                                                .companyName !=
                                                            null
                                                        ? Globals
                                                            .singleCardDetailModal!
                                                            .singleCardData!
                                                            .companyMembers![
                                                                index]
                                                            .companyName
                                                            .toString()
                                                        : '',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.015,
                                                        fontFamily: 'Msemibold',
                                                        color: infocolor),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                      height: size.height * 0.15,
                                      width: size.width * 0.9,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Center(child: CircularProgressIndicator()),
                ),
              ],
            )
          : Center(
              child: Loader(size: size),
            ),
    );
  }

  void _showEditNotesPopUp(
    context,
  ) {
    var size = MediaQuery.of(context).size;

    showDialog(
        context: context,
        builder: (BuildContext context) =>
            StatefulBuilder(builder: (context, setSte) {
              return Container(
                margin: EdgeInsets.only(bottom: size.height * 0.1),
                child: Dialog(
                  alignment: AlignmentDirectional.bottomCenter,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  //this right here
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: btnclr,
                    ),
                    height: size.height * 0.25,
                    width: size.width * 0.9,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Edit Your Notes',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.height * 0.018,
                                    fontFamily: 'MBold',
                                  ),
                                ),
                                // Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.1,
                            width: size.width * 0.8,
                            child: TextFormField(
                              controller: editNotesController,
                              maxLines: 8,
                              minLines: 6,
                              decoration: InputDecoration(
                                hintText: 'Write your notes',
                                contentPadding: EdgeInsets.only(
                                    top: 0, left: 22, right: 10, bottom: 10),
                                hintStyle: TextStyle(
                                    fontFamily: "MBold",
                                    color: infocolor,
                                    fontSize: size.height * 0.015),
                                fillColor: bckgrnd,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: bckgrnd),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: bckgrnd),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: signupclor_dark),
                                      borderRadius: BorderRadius.circular(20),
                                      color: btnclr),
                                  child: Center(
                                      child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: "MBOld",
                                        color: signupclor_dark),
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (Globals.singleCardDetailModal!
                                          .singleCardData!.notes!.id ==
                                      null) {
                                    await AddNotesController().addNotes(
                                        editNotesController.text.trim(),
                                        Globals.singleCardDetailModal!
                                            .singleCardData!.singleCardUser!.id
                                            .toString(),
                                        '');
                                    print(editNotesController.text.trim());
                                    Navigator.pop(context);

                                    setSte(() {
                                      setState(() {});
                                    });
                                  } else {
                                    print(Globals.singleCardDetailModal!
                                        .singleCardData!.singleCardUser!.id
                                        .toString());
                                    print(editNotesController.text.trim());
                                    print(Globals.singleCardDetailModal!
                                        .singleCardData!.notes!.id);

                                    await AddNotesController().addNotes(
                                        editNotesController.text
                                            .toString()
                                            .trim(),
                                        Globals.singleCardDetailModal!
                                            .singleCardData!.singleCardUser!.id
                                            .toString(),
                                        Globals.singleCardDetailModal!
                                            .singleCardData!.notes!.id
                                            .toString());

                                    Navigator.pop(context);
                                    setSte(() {
                                      setState(() {
                                        myNotes = editNotesController.text;
                                      });
                                    });
                                  }
                                  editNotesController.clear();
                                },
                                child: Container(
                                  height: size.height * 0.05,
                                  width: size.width * 0.3,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: signupclor_dark),
                                      borderRadius: BorderRadius.circular(20),
                                      color: btnclr),
                                  child: Center(
                                      child: Text(
                                    'Ok',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: "MBOld",
                                        color: signupclor_dark),
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  void _moreModalBottomSheet(context) {
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
                height: size.height * 0.4,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Row(
                        children: [
                          Text(
                            'More options',
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontFamily: 'Mbold'),
                          ),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close)),
                        ],
                      ),
                    ),
                    new ListTile(
                        leading: Image.asset(
                          group,
                          color: signupclor_dark,
                        ),
                        title: new Text(
                          'Groups',
                          style: TextStyle(
                              fontFamily: 'Msemibold',
                              fontSize: size.height * 0.015),
                        ),
                        onTap: () => {}),
                    new ListTile(
                      leading: SvgPicture.asset(emailtwo_icon),
                      title: new Text(
                        'Turn off notification',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: SvgPicture.asset(newcntct_icon),
                      title: new Text(
                        'Add to Contacts',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: SvgPicture.asset(notfications_icon),
                      title: new Text(
                        'Reminder',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
                    ),
                    new ListTile(
                      leading: SvgPicture.asset(favourite_icon),
                      title: new Text(
                        'Add to Favorite',
                        style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height * 0.015),
                      ),
                      onTap: () => {},
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

  void _reviewModalBottomSheet(context, SingleCardUser? user) {
    var addCommentController = TextEditingController();
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
                              controller: addCommentController,
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
                                Globals.addUserRatingModal =
                                    await RatingController().addUserRating(
                                        addCommentController.text.trim(),
                                        myRating.toString(),
                                        user!.id.toString());
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

  void _switchaccountModalBottomSheet(context) {
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
                decoration: BoxDecoration(
                    color: bckgrnd,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                height: size.height * 0.37,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Switch Card',
                                style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "MBold",
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.close,
                                          size: size.height * 0.025)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            height: size.height * 0.12,
                            child: ListView.builder(
                                itemCount: 1,
                                padding: EdgeInsets.all(0),
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: size.height * 0.12,
                                    width: size.width * 0.9,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: gradientgreen),
                                        color: txtcolr.withOpacity(0.2)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.04,
                                          right: size.width * 0.04,
                                          top: size.height * 0.02),
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: size.height * 0.03,
                                                backgroundImage: NetworkImage(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIyHJPjCfH88x39naBmI-xAytAcmffu_4lNg&usqp=CAU'),
                                              ),
                                              SizedBox(
                                                  width: size.width * 0.03),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Assem Yamak',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.018,
                                                      fontFamily: "MBold",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.01),
                                                  Text(
                                                    'Operations Manager',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: "Stf",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          size.height * 0.01),
                                                  Text(
                                                    'Dynamic Oil Tools',
                                                    style: TextStyle(
                                                      fontSize:
                                                          size.height * 0.015,
                                                      fontFamily: "Stf",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: size.height * 0.04,
                                                  width: size.width * 0.2,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: signupclor_dark),
                                                    color: txtcolr
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    'Currently in use',
                                                    style: TextStyle(
                                                        fontSize:
                                                            size.height * 0.01,
                                                        fontFamily: "MBOld",
                                                        color: signupclor_dark),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: size.height * 0.015,
                          ),
                          Container(
                            height: size.height * 0.12,
                            width: size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: gradientgreen),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    'No other cards available',
                                    style: TextStyle(
                                        fontSize: size.height * 0.018,
                                        fontFamily: "Stf"),
                                  ),
                                )
                              ],
                            ),
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

  Widget cardWidget(context, SingleCardData? singleCardData) {
    List<String>? emailToShow = [];
    List<String>? phoneNumberToShow = [];
    for (int i = 0; i < singleCardData!.numbers!.length; i++) {
      phoneNumberToShow.add(singleCardData.numbers![i].phoneNumber.toString());
      print(phoneNumberToShow.toString());
    }

    for (int i = 0; i < singleCardData.emails!.length; i++) {
      emailToShow.add(singleCardData.emails![i].email.toString());
      print(emailToShow.toString());
    }

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
                height: size.height * 0.30,
                fit: BoxFit.cover,
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              data: '${singleCardData.id.toString() ?? ""}',
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
                              "${singleCardData.username != null ? singleCardData.username.toString() : ''}",
                              style: TextStyle(
                                fontSize: size.height * 0.013,
                                color: signupclor_dark,
                                fontFamily: "Mbold",
                              ),
                            ),
                            Text(
                              "${singleCardData.jobTitle != null ? singleCardData.jobTitle.toString() : ''}",
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
                                  // width: size.width * .35,
                                  child: Column(children: [
                                    Text(
                                      "${singleCardData.address.toString()}",
                                      style: TextStyle(
                                        fontSize: size.height * 0.015,
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
                                  phoneNumberToShow.reduce((value, element) {
                                    return phoneNumberToShow.isNotEmpty
                                        ? phoneNumberToShow.toString()
                                        : '';
                                  }),
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
                                        emailToShow.reduce((value, element) {
                                          return emailToShow.isNotEmpty
                                              ? emailToShow.toString()
                                              : '';
                                        }),
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
                                        "${singleCardData.website}",
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

}
