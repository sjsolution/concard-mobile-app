import 'dart:io';

import 'package:concard/Controllers/OthersController/image_picker_controller.dart';
import 'package:concard/Controllers/indiviualController/profile_controller.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Models/Indiviuals/profile_model.dart';
import 'package:concard/Views/screens/homeScreens/companyProfileScreen.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:concard/Views/widgets/imagePickerWidget.dart';
import 'package:concard/Views/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import '../../widgets/customCardInputField.dart';

class EditMyCardScreen extends StatefulWidget {
  EditMyCardScreen({Key? key}) : super(key: key);

  @override
  State<EditMyCardScreen> createState() => _EditMyCardScreenState();
}

class _EditMyCardScreenState extends State<EditMyCardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  File? uploadCard;

  File? uploadPhoto;

  File? uploadLogo;
  File? uploadProfile;
  //company controllers
  var companyNameControl = TextEditingController();
  var companyWebsiteControl = TextEditingController();
  var companyFieldControl = TextEditingController();
  //tel controllers
  var telWokeControl = TextEditingController();
  var telMobileControl = TextEditingController();
  //email controllers
  var emailControl = TextEditingController();
  //address controllers
  var cityControl = TextEditingController();
  var provinceControl = TextEditingController();
  var countryControl = TextEditingController();
  var postalCodeControl = TextEditingController();
  var addressControl = TextEditingController();
  var aboutControl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setEditValue();
    super.initState();
  }

  setEditValue() async {
    var app = Provider.of<AppProvider>(context, listen: false);
    emailControl.text = app.indiviualProfileModel!.profileData!.email != null ? app.indiviualProfileModel!.profileData!.email! : '';
    telMobileControl.text = app.indiviualProfileModel!.profileData!.mobileNumber != null ? app.indiviualProfileModel!.profileData!.mobileNumber! : '';
    companyNameControl.text = app.indiviualProfileModel!.profileData!.companyName != null ? app.indiviualProfileModel!.profileData!.companyName! : "";
    companyWebsiteControl.text = app.indiviualProfileModel!.profileData!.website != null ? app.indiviualProfileModel!.profileData!.website! : '';
    companyFieldControl.text =
        app.indiviualProfileModel!.profileData!.companyField != null ? app.indiviualProfileModel!.profileData!.companyField! : '';
    telWokeControl.text = app.indiviualProfileModel!.profileData!.workTel != null ? app.indiviualProfileModel!.profileData!.workTel! : '';
    provinceControl.text = app.indiviualProfileModel!.profileData!.state != null ? app.indiviualProfileModel!.profileData!.state! : '';
    cityControl.text = app.indiviualProfileModel!.profileData!.city != null ? app.indiviualProfileModel!.profileData!.city! : '';
    countryControl.text = app.indiviualProfileModel!.profileData!.country != null ? app.indiviualProfileModel!.profileData!.country! : '';
    postalCodeControl.text = app.indiviualProfileModel!.profileData!.postalCode != null ? app.indiviualProfileModel!.profileData!.postalCode! : '';
    addressControl.text = app.indiviualProfileModel!.profileData!.address != null ? app.indiviualProfileModel!.profileData!.address! : '';
    aboutControl.text = app.indiviualProfileModel!.profileData!.about != null ? app.indiviualProfileModel!.profileData!.about! : '';

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                      gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [signupclor_light, signupclor_dark]),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.08),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // InkWell(
                            //   onTap: () => Navigator.pop(context),
                            //   child: Icon(
                            //     Icons.arrow_back_ios,
                            //     size: 20,
                            //     color: bckgrnd,
                            //   ),
                            // ),
                            InkWell(
                              onTap: () async {
                                // if(formKey.currentState!.validate()){
                                app.setLoadingTrue();
                                loaderWidget(context, size);
                                IndiviualProfileModel? indiviualProfileModel = await ProfileController().updateProfile(
                                  fName: app.indiviualProfileModel!.profileData!.firstName,
                                  lName: app.indiviualProfileModel!.profileData!.lastName,
                                  email: emailControl.text.isNotEmpty ? emailControl.text.trim() : app.indiviualProfileModel!.profileData!.email,
                                  jobTitle: app.indiviualProfileModel!.profileData!.jobTitle,
                                  mobileNumber: telMobileControl.text.isNotEmpty
                                      ? telMobileControl.text.trim()
                                      : app.indiviualProfileModel!.profileData!.mobileNumber,
                                  compName: companyNameControl.text.isNotEmpty ? companyNameControl.text.trim() : '',
                                  comWebsite: companyWebsiteControl.text.isNotEmpty ? companyWebsiteControl.text.trim() : '',
                                  comField: companyFieldControl.text.isNotEmpty ? companyFieldControl.text.trim() : '',
                                  workTel: telWokeControl.text.isNotEmpty ? telWokeControl.text.trim() : '',
                                  city: cityControl.text.isNotEmpty ? cityControl.text.trim() : '',
                                  state: provinceControl.text.isNotEmpty ? provinceControl.text.trim() : '',
                                  country: countryControl.text.isNotEmpty ? countryControl.text.trim() : '',
                                  postalCode: postalCodeControl.text.isNotEmpty ? postalCodeControl.text.trim() : '',
                                  address: addressControl.text.isNotEmpty ? addressControl.text.trim() : '',
                                  about: aboutControl.text.isNotEmpty ? aboutControl.text.trim() : '',
                                  userType: "1",
                                );
                                if (indiviualProfileModel != null) {
                                  app.setIndvProfileObj(indiviualProfileModel);
                                }
                                app.setLoadingFalse();
                                Navigator.pop(context);
                                setState(() {});
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const CompanyProfileScreen()));
                              },
                              child: SizedBox(
                                height: size.height * 0.06,
                                width: size.width * .13,
                                // color: Colors.red,
                                child: Icon(
                                  Icons.check,
                                  size: 25,
                                  color: bckgrnd,
                                ),
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
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.03, left: size.width * 0.04, right: size.width * 0.04),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Edit Card',
                                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                  )),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Card Info',
                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                  )),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              SizedBox(
                                //  margin: EdgeInsets.only(
                                //         left: size.width * 0.04,
                                //         right: size.width * 0.04),
                                // height: size.height * 0.2,
                                width: size.width,
                                child: Card(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: size.width / 2.5,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${app.indiviualProfileModel!.profileData!.firstName} ${app.indiviualProfileModel!.profileData!.lastName}',
                                                    style: TextStyle(fontSize: size.height * 0.016, fontFamily: "Stf"),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Text(
                                                    '${app.indiviualProfileModel!.profileData!.jobTitle}',
                                                    style: TextStyle(fontSize: size.height * 0.016, fontFamily: "Stf"),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Text(
                                                    'Company',
                                                    style: TextStyle(fontSize: size.height * 0.016, fontFamily: "Stf"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 3,
                                            // ),
                                            Container(
                                              height: size.height * 0.08,
                                              width: 1,
                                              color: cgreen,
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            SizedBox(
                                              width: size.width / 2.5,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${app.indiviualProfileModel!.profileData!.email}',
                                                    style: TextStyle(fontSize: size.height * 0.016, fontFamily: "Stf"),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Text(
                                                    '${app.indiviualProfileModel!.profileData!.website}',
                                                    style: TextStyle(fontSize: size.height * 0.016, fontFamily: "Stf"),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.01,
                                                  ),
                                                  Text(
                                                    '${app.indiviualProfileModel!.profileData!.mobileNumber}',
                                                    style: TextStyle(fontSize: size.height * 0.016, fontFamily: "Stf"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            SvgPicture.asset(editpen_icon),
                                            SvgPicture.asset(txt_icon),
                                            SvgPicture.asset(paint_icon),
                                            SvgPicture.asset(smallcard_icon),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
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
                                  // height: size.height * 0.05,
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: bckgrnd,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: cardUploadView(size: size, app: app)),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: size.width * 0.01, right: size.width * 0.01),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        getImageType(
                                          context,
                                          () async {
                                            Navigator.pop(context);
                                            uploadPhoto = await ImagePickerMethods().getImage(ImageSource.gallery);

                                            if (uploadPhoto != null) {
                                              await ProfileController().uplaodImage(image: uploadPhoto!.path, imageType: "0");
                                            }
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          },
                                          () async {
                                            Navigator.pop(context);
                                            uploadPhoto = await ImagePickerMethods().getImage(ImageSource.camera);
                                            if (uploadPhoto != null) {
                                              await ProfileController().uplaodImage(image: uploadPhoto!.path, imageType: "0");
                                            }
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          },
                                          false,
                                          () {},
                                        );
                                      },
                                      child: uploadPhoto == null && app.indiviualProfileModel!.profileData!.image == null
                                          ? Container(
                                              height: size.height * 0.15,
                                              width: size.width * 0.3,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                    signupclor_light,
                                                    signupclor_dark,
                                                  ])),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                        margin: EdgeInsets.only(top: size.height * 0.015),
                                                      ),
                                                      SizedBox(
                                                        height: size.height * 0.02,
                                                      ),
                                                      Container(
                                                        height: size.height * 0.025,
                                                        width: size.width * 0.15,
                                                        decoration:
                                                            BoxDecoration(borderRadius: BorderRadius.circular(20), color: bckgrnd.withOpacity(0.5)),
                                                        child: Center(
                                                          child: Text(
                                                            'Photo',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: size.height * 0.020,
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
                                          : uploadPhoto != null
                                              ? Container(
                                                  height: size.height * 0.15,
                                                  width: size.width * 0.3,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(image: FileImage(uploadPhoto!), fit: BoxFit.cover),
                                                      borderRadius: BorderRadius.circular(15),
                                                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
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
                                                          margin: EdgeInsets.only(right: size.width * 0.03, top: size.height * 0.015),
                                                        ),
                                                      ),
                                                    ],
                                                  ))
                                              : Container(
                                                  height: size.height * 0.15,
                                                  width: size.width * 0.3,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            app.indiviualProfileModel!.profileData!.image ??
                                                                "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                                          ),
                                                          fit: BoxFit.cover),
                                                      borderRadius: BorderRadius.circular(15),
                                                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
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
                                                          margin: EdgeInsets.only(right: size.width * 0.03, top: size.height * 0.015),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                    ),
                                    SvgPicture.asset(crop_icon),
                                    InkWell(
                                      onTap: () async {
                                        getImageType(
                                          context,
                                          () async {
                                            Navigator.pop(context);
                                            uploadLogo = await ImagePickerMethods().getImage(ImageSource.gallery);

                                            if (uploadLogo != null) {
                                              await ProfileController().uplaodImage(image: uploadLogo!.path, imageType: "2");
                                            }
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          },
                                          () async {
                                            Navigator.pop(context);
                                            uploadLogo = await ImagePickerMethods().getImage(ImageSource.camera);
                                            if (uploadLogo != null) {
                                              await ProfileController().uplaodImage(image: uploadLogo!.path, imageType: "2");
                                            }
                                            if (mounted) {
                                              setState(() {});
                                            }
                                          },
                                          false,
                                          () {},
                                        );
                                      },
                                      child: uploadLogo == null && app.indiviualProfileModel!.profileData!.logo == null
                                          ? Container(
                                              height: size.height * 0.15,
                                              width: size.width * 0.3,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                    signupclor_light,
                                                    signupclor_dark,
                                                  ])),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
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
                                                        margin: EdgeInsets.only(top: size.height * 0.015),
                                                      ),
                                                      SizedBox(
                                                        height: size.height * 0.02,
                                                      ),
                                                      Container(
                                                        height: size.height * 0.025,
                                                        width: size.width * 0.15,
                                                        decoration:
                                                            BoxDecoration(borderRadius: BorderRadius.circular(20), color: bckgrnd.withOpacity(0.5)),
                                                        child: Center(
                                                          child: Text(
                                                            'Logo',
                                                            style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: size.height * 0.020,
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
                                          : uploadLogo != null
                                              ? Container(
                                                  height: size.height * 0.15,
                                                  width: size.width * 0.3,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(image: FileImage(uploadLogo!), fit: BoxFit.cover),
                                                      borderRadius: BorderRadius.circular(15),
                                                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
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
                                                          margin: EdgeInsets.only(right: size.width * 0.03, top: size.height * 0.015),
                                                        ),
                                                      ),
                                                    ],
                                                  ))
                                              : Container(
                                                  height: size.height * 0.15,
                                                  width: size.width * 0.3,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                            app.indiviualProfileModel!.profileData!.logo ??
                                                                "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                                          ),
                                                          fit: BoxFit.cover),
                                                      borderRadius: BorderRadius.circular(15),
                                                      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
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
                                                          margin: EdgeInsets.only(right: size.width * 0.03, top: size.height * 0.015),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              //Form start
                              Form(
                                key: formKey,
                                child: Column(children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Company',
                                        style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
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
                                      controller: companyNameControl),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  CustomCardInputField(
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Enter company website";
                                        }
                                        return null;
                                      },
                                      hinttxt: 'Website',
                                      textInputType: TextInputType.text,
                                      controller: companyWebsiteControl),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  CustomCardInputField(
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Enter company field";
                                        }
                                        return null;
                                      },
                                      hinttxt: 'Field',
                                      textInputType: TextInputType.text,
                                      controller: companyFieldControl),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Tel',
                                        style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                                      )),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          height: size.height * 0.06,
                                          width: size.width * 0.3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.grey), color: Colors.white),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Work',
                                                  style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.018, color: infocolor),
                                                ),
                                                // Image.asset(downarrow_icon)
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        // height: size.height * 0.06,
                                        width: size.width * 0.6,
                                        child: TextFormField(
                                          controller: telWokeControl,
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return "Enter  work number";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              hintText: 'Number',
                                              contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                              hintStyle: TextStyle(fontSize: size.height * 0.018, color: infocolor, fontFamily: "Msemibold"),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          height: size.height * 0.06,
                                          width: size.width * 0.3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey), color: Colors.white),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Mobile',
                                                  style: TextStyle(fontFamily: "Msemibold", fontSize: size.height * 0.02, color: infocolor),
                                                ),
                                                // Image.asset(downarrow_icon)
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        // height: size.height * 0.06,
                                        width: size.width * 0.6,
                                        child: TextFormField(
                                          controller: telMobileControl,
                                          validator: (String? value) {
                                            if (value!.isEmpty) {
                                              return "Enter  mobile number";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              hintText: 'Number',
                                              contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                              hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(25),
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
                                        style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                                      )),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  SizedBox(
                                    // height: size.height * 0.055,
                                    width: size.width,
                                    child: TextFormField(
                                      controller: emailControl,
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Enter email";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          hintText: 'Email',
                                          contentPadding: EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                          hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
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
                                        style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                                      )),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Container(
                                      //       height: size.height * 0.05,
                                      //       // width: size.width * 0.25,
                                      //       decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(30),
                                      //           border:
                                      //               Border.all(color: Colors.grey),
                                      //           color: Colors.white),
                                      //       child: Padding(
                                      //         padding: EdgeInsets.only(
                                      //             left: size.width * 0.04,
                                      //             right: size.width * 0.04),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.spaceBetween,
                                      //           children: [
                                      //             Text(
                                      //               'City',
                                      //               style: TextStyle(
                                      //                   fontFamily: "Msemibold",
                                      //                   fontSize:
                                      //                       size.height * 0.018,
                                      //                   color: infocolor),
                                      //             ),
                                      //             // Image.asset(downarrow_icon)
                                      //           ],
                                      //         ),
                                      //       )),
                                      // ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          // height: size.height * 0.06,
                                          // width: size.width * 0.58,
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Enter city";
                                              }
                                              return null;
                                            },
                                            controller: cityControl,
                                            decoration: InputDecoration(
                                                hintText: 'City',
                                                contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                                hintStyle: TextStyle(
                                                  fontSize: size.height * 0.02,
                                                  color: infocolor,
                                                  fontFamily: "Msemibold",
                                                ),
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                )),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 10,
                                      ),
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Container(
                                      //       height: size.height * 0.05,
                                      //       // width: size.width * 0.3,
                                      //       decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(20),
                                      //           border:
                                      //               Border.all(color: Colors.grey),
                                      //           color: Colors.white),
                                      //       child: Padding(
                                      //         padding: EdgeInsets.only(
                                      //             left: size.width * 0.04,
                                      //             right: size.width * 0.03),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.spaceBetween,
                                      //           children: [
                                      //             Text(
                                      //               'Province',
                                      //               style: TextStyle(
                                      //                   fontFamily: "Msemibold",
                                      //                   fontSize:
                                      //                       size.height * 0.018,
                                      //                   color: infocolor),
                                      //             ),
                                      //             Image.asset(downarrow_icon)
                                      //           ],
                                      //         ),
                                      //       )),
                                      // ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          // height: size.height * 0.06,
                                          // width: size.width * 0.58,
                                          child: TextFormField(
                                            controller: provinceControl,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Enter province";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Province',
                                                contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                                hintStyle: TextStyle(
                                                  fontSize: size.height * 0.02,
                                                  color: infocolor,
                                                  fontFamily: "Msemibold",
                                                ),
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                )),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          // height: size.height * 0.06,
                                          // width: size.width * 0.58,
                                          child: TextFormField(
                                            controller: countryControl,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Enter country";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Country',
                                                contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                                hintStyle: TextStyle(
                                                  fontSize: size.height * 0.02,
                                                  color: infocolor,
                                                  fontFamily: "Msemibold",
                                                ),
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                )),
                                          ),
                                        ),
                                      ),

                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Container(
                                      //       height: size.height * 0.05,
                                      //       // width: size.width * 0.3,
                                      //       decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(20),
                                      //           border:
                                      //               Border.all(color: Colors.grey),
                                      //           color: Colors.white),
                                      //       child: Padding(
                                      //         padding: EdgeInsets.only(
                                      //             left: size.width * 0.04,
                                      //             right: size.width * 0.04),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.spaceBetween,
                                      //           children: [
                                      //             Text(
                                      //               'Country',
                                      //               style: TextStyle(
                                      //                   fontFamily: "Msemibold",
                                      //                   fontSize:
                                      //                       size.height * 0.018,
                                      //                   color: infocolor),
                                      //             ),
                                      //             Image.asset(downarrow_icon)
                                      //           ],
                                      //         ),
                                      //       )),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Expanded(
                                      //   flex: 1,
                                      //   child: Container(
                                      //       height: size.height * 0.055,
                                      //       // width: size.width * 0.31,
                                      //       decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(20),
                                      //           border:
                                      //               Border.all(color: Colors.grey),
                                      //           color: Colors.white),
                                      //       child: Padding(
                                      //         padding: EdgeInsets.only(
                                      //             left: size.width * 0.02,
                                      //             right: size.width * 0.02),
                                      //         child: Row(
                                      //           mainAxisAlignment:
                                      //               MainAxisAlignment.spaceBetween,
                                      //           children: [
                                      //             Text(
                                      //               'Postal code',
                                      //               style: TextStyle(
                                      //                   fontFamily: "Msemibold",
                                      //                   fontSize:
                                      //                       size.height * 0.014,
                                      //                   color: infocolor),
                                      //             ),
                                      //             Image.asset(downarrow_icon)
                                      //           ],
                                      //         ),
                                      //       )),
                                      // ),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          // height: size.height * 0.06,
                                          // width: size.width * 0.58,
                                          child: TextFormField(
                                            controller: postalCodeControl,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Enter postal code";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Postal Code',
                                                contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                                hintStyle: TextStyle(
                                                  fontSize: size.height * 0.02,
                                                  color: infocolor,
                                                  fontFamily: "Msemibold",
                                                ),
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                )),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: SizedBox(
                                          // height: size.height * 0.06,
                                          // width: size.width * 0.58,
                                          child: TextFormField(
                                            controller: addressControl,
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Enter address";
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Address',
                                                contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                                hintStyle: TextStyle(
                                                  fontSize: size.height * 0.02,
                                                  color: infocolor,
                                                  fontFamily: "Msemibold",
                                                ),
                                                fillColor: Colors.white,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                )),
                                          ),
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
                                        'About',
                                        style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                                      )),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  TextFormField(
                                    controller: aboutControl,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Enter about";
                                      }
                                      return null;
                                    },
                                    maxLines: 8,
                                    minLines: 6,
                                    // textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: 'About......',
                                        contentPadding: EdgeInsets.only(top: 10.0, left: 22.0, bottom: 2.0),
                                        hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        )),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                ]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '+ Add Another',
                                    style: TextStyle(fontSize: size.height * 0.02, color: cgreen, fontFamily: 'Stf'),
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
                  InkWell(
                    onTap: () async {
                      getImageType(
                        context,
                        () async {
                          Navigator.pop(context);
                          uploadProfile = await ImagePickerMethods().getImage(ImageSource.gallery);
                          if (uploadProfile != null) {
                            await ProfileController().uplaodImage(image: uploadProfile!.path, imageType: "3");
                          }
                          if (mounted) {
                            setState(() {});
                          }
                        },
                        () async {
                          Navigator.pop(context);
                          uploadProfile = await ImagePickerMethods().getImage(ImageSource.camera);
                          if (uploadProfile != null) {
                            await ProfileController().uplaodImage(image: uploadProfile!.path, imageType: "3");
                          }
                          if (mounted) {
                            setState(() {});
                          }
                        },
                        false,
                        () {},
                      );
                    },
                    child: uploadProfile == null && app.indiviualProfileModel!.profileData!.profileImage == null
                        ? Container(
                            height: size.height * 0.10,
                            width: size.width * 0.2,
                            decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                            margin: EdgeInsets.only(top: size.height * 0.15, left: size.width * 0.04),
                            child: Image.network(
                              "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                            )
                            // SvgPicture.asset(con_icon),
                            )
                        : uploadProfile != null
                            ? Container(
                                height: size.height * 0.10,
                                width: size.width * 0.2,
                                decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                                margin: EdgeInsets.only(top: size.height * 0.15, left: size.width * 0.04),
                                child: Image.file(uploadProfile!, fit: BoxFit.cover))
                            : Container(
                                height: size.height * 0.10,
                                width: size.width * 0.2,
                                decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                                margin: EdgeInsets.only(top: size.height * 0.15, left: size.width * 0.04),
                                child: Image.network(
                                  app.indiviualProfileModel!.profileData!.profileImage ??
                                      "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                )
                                // SvgPicture.asset(con_icon),
                                ),
                  ),
                  uploadProfile == null
                      ? Container(margin: EdgeInsets.only(top: size.height * 0.21, left: size.width * 0.17), child: Image.asset(compcamera_icon))
                      : const SizedBox(),
                ],
              ),
            ],
          ));
    });
  }

  Widget cardUploadView({Size? size, AppProvider? app}) {
    return Column(
      children: [
        uploadCard == null && app!.indiviualProfileModel!.profileData!.card == null
            ? Padding(
                padding: EdgeInsets.only(left: size!.width * 0.04, right: size.width * 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Insert Card',
                      style: TextStyle(fontSize: size.height * 0.02, fontFamily: "Msemibold", color: uploadCard != null ? Colors.green : infocolor),
                    ),
                    InkWell(
                      onTap: () async {
                        cardUploadFunction();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.05,
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [signupclor_light, signupclor_dark]),
                            border: Border.all(color: signupclor_dark),
                            color: bckgrnd,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Upload',
                          style: TextStyle(fontFamily: "Mbold", fontSize: size.height * 0.02, color: bckgrnd),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : uploadCard != null
                ? cardUpload(size: size, image: FileImage(uploadCard!))
                : cardUpload(
                    size: size,
                    image: NetworkImage(
                      app!.indiviualProfileModel!.profileData!.card ??
                          "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                    ))
      ],
    );
  }

  Widget cardUpload({Size? size, ImageProvider? image}) {
    return Container(
        margin: const EdgeInsets.only(top: 0),
        alignment: Alignment.topRight,
        height: size!.height * 0.3,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: image!, fit: BoxFit.cover),
        ),
        child: Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 12.0),
            child: InkWell(
              onTap: () {
                cardUploadFunction();
              },
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            )));
  }

  void cardUploadFunction() {
    getImageType(
      context,
      () async {
        Navigator.pop(context);
        uploadCard = await ImagePickerMethods().getImage(ImageSource.gallery);
        if (uploadCard != null) {
          await ProfileController().uplaodImage(image: uploadCard!.path, imageType: "1");
        }
        if (mounted) {
          setState(() {});
        }
      },
      () async {
        Navigator.pop(context);
        uploadCard = await ImagePickerMethods().getImage(ImageSource.camera);
        if (uploadCard != null) {
          await ProfileController().uplaodImage(image: uploadCard!.path, imageType: "1");
        }
        if (mounted) {
          setState(() {});
        }
      },
      false,
      () {},
    );
  }
}
