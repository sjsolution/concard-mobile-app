import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/Authentication/authentication.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Models/Indiviuals/social_links_model.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:concard/Views/widgets/loader_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';

import '../../../Constants/globals.dart';
import '../../../Controllers/indiviualController/social_links_controller.dart';
import '../homeScreens/individualPremium/individualPremiumScreen.dart';

class WebProfileViewToSaveContact extends StatefulWidget {
  WebProfileViewToSaveContact({Key? key}) : super(key: key);

  @override
  State<WebProfileViewToSaveContact> createState() =>
      _WebProfileViewToSaveContactState();
}

class _WebProfileViewToSaveContactState
    extends State<WebProfileViewToSaveContact> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context, appPro, _) {
      return Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.04,
                        left: size.width * 0.03,
                        right: size.width * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close)),
                        Container(
                          height: size.height * 0.05,
                          width: size.width * 0.6,
                          decoration: BoxDecoration(
                            border: Border.all(color: infocolor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              Text('website.com'),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.lock,
                                  color: infocolor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Icon(Icons.refresh)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Container(
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topCenter,
                            colors: [signupclor_light, signupclor_dark]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //premium or drawer column
                          //profile show Column
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: size.height * 0.035,
                                      backgroundImage: NetworkImage(
                                        appPro!
                                                    .individualProfileModel!
                                                    .individualProfileDetailData!
                                                    .singleProfileUser!
                                                    .profileImage !=
                                                null
                                            ? appPro!
                                                .individualProfileModel!
                                                .individualProfileDetailData!
                                                .singleProfileUser!
                                                .profileImage
                                                .toString()
                                            : "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.firstName ?? ''} ${appPro!.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.lastName ?? ''}',
                                          style: TextStyle(
                                              fontFamily: 'MBold',
                                              fontSize: size.height * 0.02,
                                              color: bckgrnd),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                            verified,
                                            // height: 5,
                                            color: cgreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      // appPro!.individualProfileModel!.data!.user!.email ?? '',
                                      appPro!
                                              .individualProfileModel!
                                              .individualProfileDetailData!
                                              .singleProfileUser!
                                              .jobTitle
                                              .toString() ??
                                          '',
                                      style: TextStyle(
                                          fontFamily: 'Stf',
                                          fontSize: size.height * 0.017,
                                          color: bckgrnd),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      // appPro!.individualProfileModel!.data!.user!.email ?? '',
                                      'Concard Inc',
                                      style: TextStyle(
                                          fontFamily: 'Stf',
                                          fontSize: size.height * 0.017,
                                          color: bckgrnd),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 10,
                          )
                        ],
                      ),
                    ),
            //Premium Account

                     InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => IndividualPremiumScreen()));
              },
              child: Padding(
                padding:  EdgeInsets.only(bottom: size.height*0.12),
                child: Container(
                  // padding: EdgeInsets.only(bottom: 0.03),
                  height: size.height * 0.05,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                      color: bckgrnd.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0, bottom: 09.0),
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
              ),
            ),
           
                  ],
                ),
              ],
            ),
           
            Container(
              margin: EdgeInsets.only(top: size.height * 0.33),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: btnclr),
              child: ListView(
                  padding: EdgeInsets.only(
                      left: size.width * 0.02,
                      right: size.width * 0.02,
                      top: size.height * 0.02),
                  children: [
                    Column(
                      children: [
                        Container(
                          height: size.height * 0.37,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ' Card',
                                      style: TextStyle(
                                          fontSize: size.height * 0.018,
                                          fontFamily: 'MBold'),
                                    ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => EditMyCardScreen()));
                                    //   },
                                    //   child: Row(
                                    //     children: [
                                    //       Text(
                                    //         'Edit Card',
                                    //         style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                    //       ),
                                    //       SizedBox(
                                    //         width: size.width * 0.03,
                                    //       ),
                                    //       SvgPicture.asset(
                                    //         edit_card_icon,
                                    //         color: cgreen,
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.025,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: size.height * 0.01,
                                      right: size.height * 0.01),
                                  child: cardWidget(
                                      context, appPro!.individualProfileModel!),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: size.height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.41,
                              decoration: BoxDecoration(
                                  border: Border.all(color: cgreen),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Company Profile',
                                  style: TextStyle(
                                      fontFamily: 'MBold',
                                      fontSize: size.height * 0.018,
                                      color: cgreen),
                                ),
                              ),
                            ),
                            Container(
                              height: size.height * 0.04,
                              width: size.width * 0.41,
                              decoration: BoxDecoration(
                                  border: Border.all(color: signupclor_dark),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  'Brochure',
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
                          height: size.height*0.02,
                        ),
                          Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Social Media",
                          style: TextStyle(fontSize: size.height * 0.018, color: Colors.black, fontFamily: 'MBold'),
                        ),
                      
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Container(
                        // padding: EdgeInsets.all(8.0),
                        color: Colors.transparent,
                        height: size.height * 0.1,
                        // width: size.width,
                        child: FutureBuilder<SocialLinksModel?>(
                            future: SocialLinksController().getSocialLink(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Text("Something went wrong. Try again later");
                              } else if (snapshot.data!.linksDataList!.isEmpty) {
                                return const Text("There are no links added yet");
                              } else {
                                List<LinksDataList>? linksDataList = snapshot.data!.linksDataList;
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: linksDataList!.length,
                                  itemBuilder: ((context, index) {
                                    return Row(
                                      children: [
                                        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                          CircleAvatar(
                                            radius: size.width * 0.06,
                                            backgroundColor: signupclor_dark,
                                            child: CircleAvatar(
                                                radius: size.width * 0.055,
                                                backgroundColor: Colors.white,
                                                backgroundImage: NetworkImage(linksDataList[index].image!)),
                                          ),
                                          Text("${linksDataList[index].title}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ))
                                        ]),
                                        const SizedBox(width: 15.0),
                                      ],
                                    );
                                  }),
                                );
                              }
                            })),
                            SizedBox(
                              height: size.height*0.05,
                            ),
                            InkWell(
                              onTap: (){
                                _sendInfoBottomSheet(context);
                              },
                              child: CustomButton(text: 'Save contact', color1: signupclor_light, color2: signupclor_dark, textcolor1: bckgrnd, textcolor2: bckgrnd)),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                      ],
                    ),
                  ]),
            )
          ],
        ),
      );
    });
  }

  Widget cardWidget(context, IndividualProfileModel? individualProfileModel) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.29,
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
                              size: size.height * 0.08,
                              data:
                                  '${individualProfileModel!.individualProfileDetailData!.singleProfileUser!.id}',
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
                              "${individualProfileModel.individualProfileDetailData!.singleProfileUser!.firstName != null ? individualProfileModel.individualProfileDetailData!.singleProfileUser!.firstName.toString() : ''} ${individualProfileModel.individualProfileDetailData!.singleProfileUser!.lastName != null ? individualProfileModel.individualProfileDetailData!.singleProfileUser!.lastName.toString() : ''}",
                              style: TextStyle(
                                fontSize: size.height * 0.020,
                                color: signupclor_dark,
                                fontFamily: "Mbold",
                              ),
                            ),
                            Text(
                              "${individualProfileModel.individualProfileDetailData!.singleProfileUser!.jobTitle != null ? individualProfileModel.individualProfileDetailData!.singleProfileUser!.jobTitle : ''}",
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
                                const SizedBox(
                                  width: 4, //size.width * 0.015,
                                ),
                                Container(
                                  width: size.width * .35,
                                  child: Column(children: [
                                    Text(
                                      individualProfileModel
                                                  .individualProfileDetailData!
                                                  .singleProfileUser!
                                                  .address !=
                                              null
                                          ? individualProfileModel
                                              .individualProfileDetailData!
                                              .singleProfileUser!
                                              .address
                                              .toString()
                                          : "",
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
                                  individualProfileModel
                                              .individualProfileDetailData!
                                              .singleProfileUser!
                                              .mobileNumber !=
                                          null
                                      ? individualProfileModel
                                          .individualProfileDetailData!
                                          .singleProfileUser!
                                          .mobileNumber
                                          .toString()
                                      : '',
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
                                  width: size.width * 0.01,
                                ),
                                Container(
                                  // width: size.width * .35,
                                  child: Column(
                                    children: [
                                      Text(
                                        individualProfileModel
                                                .individualProfileDetailData!
                                                .singleProfileUser!
                                                .email
                                                .toString() ??
                                            '',
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
                                        "${individualProfileModel.individualProfileDetailData!.singleProfileUser!.website}",
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

  // Send info bottom sheet
   void _sendInfoBottomSheet(context) {
    var size = MediaQuery.of(context).size;
 final formKey = GlobalKey<FormState>();

  RegExp? regex;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: const Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (BuildContext bc) {
          return Consumer<AppProvider>(
            
            builder: (context, appPro,_) {
              return StatefulBuilder(
                builder: (context, setSte) {
                  return SingleChildScrollView(
                      child: Container(
                        // height: double.infinity,
                        child: Padding(
                          padding:  EdgeInsets.only(top: size.height*0.02,right: size.width*0.03,left: size.width*0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.close),
                                ),
                              ),
                              SizedBox(),
                              Container(
                                alignment: Alignment.center,
                                child: Text('Send your contact information to Issam',style: TextStyle(
                                  fontSize: size.height*0.02,
                                  fontFamily: "Stf",
                                ),),
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              FieldText(
                                  validate: (String? value) {
                                    String pattern = r'^[A-Za-z]*$';
                                    regex = RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return "Enter first name";
                                    } else if (!regex!.hasMatch(value)) {
                                      return 'Enter Valid name containes only letter';
                                    }
                                    return null;
                                  },
                                  hinttxt: "First Name",
                                  controller: appPro.fNameControll,
                                  textInputType: TextInputType.text,
                                  pass: false),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              FieldText(
                                  validate: (String? value) {
                                    String pattern = r'^[A-Za-z]*$';
                                    regex = RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return "Enter last name";
                                    } else if (!regex!.hasMatch(value)) {
                                      return 'Enter Valid name containes only letter';
                                    }
                                    return null;
                                  },
                                  hinttxt: "Last Name",
                                  controller: appPro.lNameControll,
                                  textInputType: TextInputType.text,
                                  pass: false),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              FieldText(
                                  validate: (String? value) {
                                    //  String pattern = r'^[A-Za-z]*$';
                                    //    regex = RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return "Enter email";
                                    } 
                                    // else if (!value.contains('@gmail.com')) {
                                    //   return 'Enter Valid email';
                                    // }
                                    return null;
                                  },
                                  hinttxt: "E-mail",
                                  controller: appPro.emailControll,
                                  textInputType: TextInputType.text,
                                  pass: false),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: CountryCodePicker(
                                          padding: const EdgeInsets.all(0),
                                          onInit: (value) {
                                            // log(value.toString());
                                            // setInitCode(value.toString());
                                            // log("Before"+appPro.countrCode);
                                            appPro.countrCode = value.toString();
                                            // log("Afeter"+appPro.countrCode);
                                            //  context.read<AppProvider>().setCC(value);
                                          },
                                          onChanged: (value) {
                                            // log(value.toString());
                                            appPro.setCC(value.toString());
                                          },
                                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                          // initialSelection: 'IT',
                                          showFlag: false,
                                          favorite: const [
                                            '+961',
                                          ],
                                          textStyle: TextStyle(
                                              fontSize: size.height * 0.018,
                                              color: txtcolr),
                                          // optional. Shows only country name and flag
                                          showCountryOnly: false,
                                          // optional. Shows only country name and flag when popup is closed.
                                          showOnlyCountryWhenClosed: false,
                                          // optional. aligns the flag and the Text left
                                          // alignLeft: true,
                                        ),
                                        height: size.height * 0.05,
                                        width: size.width * 0.2,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            border: Border.all(color: infocolor)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Container(
                                    height: size.height * 0.05,
                                    width: size.width * 0.6,
                                    child: FieldText(
                                        validate: (String? value) {
                                          String pattern = r'^[0-9]*$';
                                          regex = RegExp(pattern);
                                          if (value!.isEmpty) {
                                            return "Enter phone number";
                                          } else if (!regex!.hasMatch(value)) {
                                            return 'Enter Valid number containes only numbers';
                                          }
                                          return null;
                                        },
                                        hinttxt: "Phone Number",
                                        controller: appPro.numberControll,
                                        textInputType: TextInputType.phone,
                                        pass: false),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              FieldText(
                                  validate: (String? value) {
                                    // String pattern = r'^[a-zA-Z0-9]*$';
                                    // regex = RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return "Enter password";
                                    }
                                    // else if (!regex!.hasMatch(value)) {
                                    //   return 'Enter Valid password (AlphaNummaric)';
                                    // }
                                    return null;
                                  },
                                  hinttxt: "Password",
                                  controller: appPro.passwordControll,
                                  textInputType: TextInputType.text,
                                  pass: true),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              FieldText(
                                  validate: (String? value) {
                                    // String pattern = r'^[A-Za-z0-9]*$';
                                    // regex = RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return "Enter Confirm password";
                                    }
                                    // else if (!regex!.hasMatch(value)) {
                                    //   return 'Enter Valid password (AlphaNummaric)';
                                    // }
                                    else if (appPro.cPasswordControll.text !=
                                        appPro.passwordControll.text) {
                                      return 'Password not matched';
                                    }
                                    return null;
                                  },
                                  hinttxt: "Confirm Password",
                                  controller: appPro.cPasswordControll,
                                  textInputType: TextInputType.text,
                                  pass: true),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: CustomNextButton(
                                  text: "Send Contact Information",
                                  image: '',
                                  color1: signupclor_light,
                                  color2: signupclor_dark,
                                  onTap: () async {
                                    if (formKey.currentState!.validate()) {
                                      appPro.setLoadingTrue();
                                      loaderWidget(context, size);
                                      var result = await AuthenticationClass()
                                          .verifyEmailExist(
                                              appPro.emailControll.text.trim());
                                      appPro.setLoadingFalse();
                                      Navigator.pop(context);
                                      if (!result['success']) {
                                        Navigator.pushNamed(context, '/indiCodeSend');
                                      } else {
                                        showToastMethod(msg: result['message']);
                                      }
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>const NumberVerification()));
                                
                                    }
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                            
                         
                            ],
                          ),
                        ),
                      ),
                    );
                  
                },
              );
            }
          );
        });
  }

}
