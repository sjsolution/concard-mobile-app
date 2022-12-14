import 'package:concard/Controllers/CardsController/card_controller.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/homeScreens/addCardsToGroupScreen.dart';
import 'package:concard/Views/screens/homeScreens/groupsCardScreen.dart';
import 'package:concard/Views/widgets/caledar_widget.dart';
import 'package:concard/Views/widgets/customCardInputField.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:concard/google_map.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';

class AddContactCardsScreen extends StatefulWidget {
  const AddContactCardsScreen({Key? key}) : super(key: key);
  @override
  State<AddContactCardsScreen> createState() => _AddContactCardsScreenState();
}

class _AddContactCardsScreenState extends State<AddContactCardsScreen> {
  @override
  void initState() {
    // AddMyCard();
    // // TODO: implement initState
    super.initState();
  }

  TextEditingController selectedDayController = TextEditingController();
  TextEditingController selectedMonthController = TextEditingController();
  TextEditingController selectedYearController = TextEditingController();

  TextEditingController meetingDatetimeController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked =
        await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  DateTime meetingDatetime = DateTime.now();
  Future<void> selectedMeetinDate(BuildContext context) async {
    final DateTime? picked =
        await showDatePicker(context: context, initialDate: meetingDatetime, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != meetingDatetime) {
      setState(() {
        meetingDatetime = picked;
      });
    }
  }

  var userNameControl = TextEditingController();
  var jobTitleControl = TextEditingController();
  var compNameControl = TextEditingController();
  var websiteControll = TextEditingController();
  var postionNameControl = TextEditingController();
  List<TextEditingController> mobileNumberController = [];
  List<TextEditingController> emailsController = [];
  var cityControl = TextEditingController();
  var provinceControl = TextEditingController();
  var countryControl = TextEditingController();
  var postalCodeControl = TextEditingController();
  var addressControl = TextEditingController();
  var locationControllor = TextEditingController();
  var meetingDateTimeControllor = TextEditingController();
  List<int> listOfEmails = [];
  List<int> listOfMobiles = [];
  List<String> emailToSend=[];
  List<String> mobileNumberToSend=[];
  List<String> mTypesToSend=[];

  void clearAllController() {
    userNameControl.clear();
    jobTitleControl.clear();
    compNameControl.clear();
    websiteControll.clear();
    postionNameControl.clear();
    mobileNumberController.clear();
    emailsController.clear();
    cityControl.clear();
    provinceControl.clear();
    countryControl.clear();
    postalCodeControl.clear();
    addressControl.clear();
    locationControllor.clear();
    meetingDateTimeControllor.clear();
  }

  AddMyCard() async {
    Globals.addCardModal =
        await CardController().addCard(userName: '',jobTitle: '',companyName: '',day: '',month: '',year: '',mobileNumbers: mobileNumberToSend,emails:emailToSend ,city: '',province: '',country: '',address: '',positionName: '',postalCode: '',meetingDatetime: '',location: '',website: '');
    print('aadd card' + Globals.addCardModal.toString());
    setState(() {});
  }

  // Map<String, dynamic> cardsData = {};
  var formKey = GlobalKey<FormState>();
  int email = 1;
  int numberField = 1;
  // int addAnotherPage = 1;
  String? item = 'Work';
  final items = [
    'Work',
    'Home',
    'Personal',
  ];

  // int? index;
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
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [signupclor_light, signupclor_dark]),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.04),
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
                      Row(
                        children: [
                          Image.asset(edit_icon),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text(
                            'Edit Card',
                            style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBold", color: bckgrnd),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                            mobileNumberToSend.clear();
                            emailToSend.clear();
                            

                          for(int i=0; i < numberField; i++){
                            mobileNumberToSend.add( mTypesToSend[i]+':'+mobileNumberController[i].text);
                          }
                           for(int i=0; i < email; i++){

                            emailToSend.add(emailsController[i].text);
                          }
                            print(emailToSend.toString());
                            print(mobileNumberToSend.toString());


                          // for (int i = 0; i < 16; i++) {
                          //   // listOfMobiles[i] = mobileNumberController[i].text;
                          //   mobileNumberToSend.add(mobileNumberController[i].text.trim());
                          // }
                          // for (int i = 0; i < emailsController.length; i++) {
                          //   emailToSend.add(emailsController[i].text.trim());
                          // }
                          // print(listOfMobiles);
                          // print(listOfEmails);
                          // cardsData.addEntries({'phone_numbers': mobileControllers}.entries);
                          // if (formKey.currentState!.validate()) {
                          //   emailsControl.forEach((element) {
                          //     emailControllers.add(element.text);
                          //   });
                          //   mobileNumberControl.forEach((element) {
                          //     mobileControllers.add(element.text);
                          //   });
                            Globals.addCardModal = await CardController().addCard(
                              userName: 
                                userNameControl.text.trim(),
                                jobTitle: 
                                jobTitleControl.text.trim(),
                                companyName: 
                                compNameControl.text.trim(),
                                website: 
                                websiteControll.text.trim(),
                                positionName: 
                                postionNameControl.text.trim(),
                                mobileNumbers: 
                               mobileNumberToSend,
                                emails: 
                                emailToSend,
                                city: 
                                cityControl.text.trim(),
                                province: 
                                provinceControl.text.trim(),
                                country: 
                                countryControl.text.trim(),
                                day: 
                                selectedDate.day.toString(),
                                month: 
                                selectedDate.month.toString(),
                                year: 
                                selectedDate.year.toString(),
                                postalCode: 
                                postalCodeControl.text.trim(),
                                address: 
                                addressControl.text.trim(),
                                location: 
                                locationControllor.text.trim(),
                                meetingDatetime: 
                                meetingDatetime.toString()
                              );
                            clearAllController();
                          
                            selectedDayController.clear();
                            selectedMonthController.clear();
                            selectedYearController.clear();
                            meetingDatetimeController.clear();
                          
                            if (Globals.addCardModal!.code == 200) {
                              Globals.showToastMethod(msg: 'Record Added Successfully');
                              Navigator.pop(context);
                            } else {
                              Globals.showToastMethod(msg: 'There is something wrong');
                            }
                          },
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color: bckgrnd,
                        ),
                      )
                   
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.001),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Card Info',
                    style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'MBold'),
                  )),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: size.height * 0.3),
              height: size.height * 0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: ListView(
                padding: EdgeInsets.only(top: size.height * 0.1, right: size.width * 0.02, left: size.width * 0.02),
                children: [
                  Form(
                    key: formKey,
                    child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.05,
                                      width: size.width * 0.4,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [btnclr, btnclr]),
                                          border: Border.all(color: signupclor_dark),
                                          color: bckgrnd,
                                          borderRadius: BorderRadius.circular(30)),
                                      child: (Text(
                                        'Scan',
                                        style: TextStyle(color: signupclor_dark, fontSize: size.height * 0.018, fontFamily: "MBold"),
                                      )),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: size.height * 0.05,
                                      width: size.width * 0.4,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [btnclr, btnclr]),
                                          border: Border.all(color: signupclor_dark),
                                          color: bckgrnd,
                                          borderRadius: BorderRadius.circular(30)),
                                      child: (Text(
                                        'Upload',
                                        style: TextStyle(color: signupclor_dark, fontSize: size.height * 0.018, fontFamily: "MBold"),
                                      )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Personal',
                                      style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                    )),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                CustomCardInputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Enter Your name";
                                    }
                                    return null;
                                  },
                                  hinttxt: 'Name',
                                  textInputType: TextInputType.text,
                                  controller: userNameControl,
                                  icon: null,
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                CustomCardInputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Enter Your Job Title";
                                    }
                                    return null;
                                  },
                                  hinttxt: 'Job Title',
                                  textInputType: TextInputType.text,
                                  controller: jobTitleControl,
                                  icon: null,
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                CustomCardInputField(
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Enter Your Job itle";
                                    }
                                    return null;
                                  },
                                  hinttxt: 'Supplier/Client/both',
                                  textInputType: TextInputType.text,
                                  controller: jobTitleControl,
                                  icon: Image.asset(downarrow_icon),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                InkWell(
                                  onTap: () {
                                    //            CalendarWidget();
                                    _selectDate(context);
                                    setState(() {
                                      selectedDayController.clear();
                                      selectedMonthController.clear();
                                      selectedYearController.clear();
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          height: size.height * 0.05,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey), color: Colors.white),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  height: size.height * 0.02,
                                                  width: size.width * 0.04,
                                                ),
                                                Center(
                                                  child: Text(
                                                    selectedDate.day != null ? '${selectedDate.day}' : 'Day',
                                                    style: TextStyle(fontFamily: "MBold", fontSize: size.height * 0.018, color: infocolor),
                                                  ),
                                                ),
                                                Image.asset(downarrow_icon)
                                              ],
                                            ),
                                          )),
                                      Container(
                                          height: size.height * 0.05,
                                          width: size.width * 0.3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey), color: Colors.white),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  height: size.height * 0.02,
                                                  width: size.width * 0.04,
                                                ),
                                                Center(
                                                  child: Text(
                                                    selectedDate.month != null ? '${selectedDate.month}' : 'Month',
                                                    style: TextStyle(fontFamily: "MBold", fontSize: size.height * 0.018, color: infocolor),
                                                  ),
                                                ),
                                                Image.asset(downarrow_icon)
                                              ],
                                            ),
                                          )),
                                      Container(
                                          height: size.height * 0.05,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey), color: Colors.white),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  selectedDate.year != null ? '${selectedDate.year}' : 'Year',
                                                  style: TextStyle(fontFamily: "MBold", fontSize: size.height * 0.018, color: infocolor),
                                                ),
                                                Image.asset(downarrow_icon)
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Tel',
                                          style: TextStyle(fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                        )),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          numberField++;
                                        });
                                      },
                                      child: Container(
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
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                ListView.builder(
                                    padding: EdgeInsets.all(0),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: numberField,
                                    itemBuilder: (context, mobileIndex) {
                                      mobileNumberController.add(TextEditingController());
                                      for(int  i = 0; i < item!.length; i++){
                                        mTypesToSend.add(item!);
                                      }
                                      return Column(
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: size.height * 0.06,
                                                width: size.width * 0.3,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey),
                                                  borderRadius: BorderRadius.circular(20),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child: DropdownButton(
                                                      underline: SizedBox.shrink(),
                                                      isDense: true,
                                                      hint: Text('Select'),
                                                      value: mTypesToSend[mobileIndex],
                                                      icon: Image.asset(downarrow_icon),
                                                      items: items.map((String? items) {
                                                        return DropdownMenuItem(value: items, child: Text(items!));
                                                      }).toList(),
                                                      onChanged: ( newValue) {
                                                          mTypesToSend[mobileIndex] = newValue.toString();

                                                        setState(() {
                                                        });
                                                      }),
                                                ),
                                              ),
                                              // Container(
                                              //       height: size.height * 0.06,
                                              //       width: size.width * 0.3,
                                              //       decoration: BoxDecoration(
                                              //           borderRadius: BorderRadius.circular(30),
                                              //           border: Border.all(color: Colors.grey),
                                              //           color: Colors.white),
                                              //       child: Padding(
                                              //         padding: EdgeInsets.only(
                                              //             left: size.width * 0.04,
                                              //             right: size.width * 0.04),
                                              //         child: Row(
                                              //           mainAxisAlignment:
                                              //               MainAxisAlignment.spaceBetween,
                                              //           children: [
                                              //           //  Text(
                                              //           //     'Work',
                                              //           //     s tyle: TextStyle(
                                              //           //         fontFamily: "Msemibold",
                                              //           //         fontSize: size.height * 0.018,
                                              //           //         color: infocolor),
                                              //           //   ),
                                              //           //   Image.asset(downarrow_icon),
                                              //           ],
                                              //         ),
                                              //       )),
                                              Container(
                                                width: size.width * 0.6,
                                                child: TextFormField(
                                                  controller: mobileNumberController[mobileIndex],
                                                  validator: (String? value) {
                                                    if (value!.length < 9 || value.length > 9) {
                                                      return "Number is not valid";
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
                                                        borderRadius: BorderRadius.circular(25),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }),

                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Email',
                                        style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          email ++;
                                          // print(email);
                                        });
                                      },
                                      child: Container(
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
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Container(
                                  child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: email,
                                      itemBuilder: (context, emailIndex) {
                                        emailsController.add(TextEditingController());
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.02,
                                            ),
                                            TextFormField(
                                              controller:emailsController[emailIndex],
                                              validator: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "Email is not valid";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  hintText: 'Email',
                                                  contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                                  hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(25),
                                                  )),
                                                  
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Company',
                                      style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                                    )),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                SizedBox(
                                  width: size.width,
                                  child: TextFormField(
                                    controller: compNameControl,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Can't be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Company Name',
                                        contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
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
                                SizedBox(
                                  width: size.width,
                                  child: TextFormField(
                                    controller: websiteControll,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Can't be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Website',
                                        contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
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
                                SizedBox(
                                  width: size.width,
                                  child: TextFormField(
                                    controller: postionNameControl,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Can't be empty";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Field',
                                        contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
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
                                CountryStateCityPicker(
                                  country: countryControl,
                                  state: provinceControl,
                                  city: cityControl,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                //   children: [
                                //     Container(
                                //         height: size.height * 0.05,
                                //         width: size.width * 0.25,
                                //         decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(30),
                                //             border: Border.all(color: Colors.grey),
                                //             color: Colors.white),
                                //         child: Padding(
                                //           padding: EdgeInsets.only(
                                //               left: size.width * 0.04,
                                //               right: size.width * 0.04),
                                //           child: Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Text(
                                //                 appPro.cityControl.text.trim(),
                                //                 style: TextStyle(
                                //                     fontFamily: "Msemibold",
                                //                     fontSize: size.height * 0.018,
                                //                     color: infocolor),
                                //               ),
                                //               Image.asset(downarrow_icon)
                                //             ],
                                //           ),
                                //         )),
                                //     // Expanded(
                                //     //   flex: 1,
                                //     //   child: SizedBox(
                                //     //     // height: size.height * 0.06,
                                //     //     // width: size.width * 0.58,
                                //     //     child: TextFormField(
                                //     //       validator: (String? value) {
                                //     //         if (value!.isEmpty) {
                                //     //           return "Enter city";
                                //     //         }
                                //     //         return null;
                                //     //       },
                                //     //       controller: appPro.cityControl,
                                //     //       decoration: InputDecoration(
                                //     //           hintText: 'City',
                                //     //           contentPadding: const EdgeInsets.only(
                                //     //               top: 0.0, left: 22.0, bottom: 2.0),
                                //     //           hintStyle: TextStyle(
                                //     //             fontSize: size.height * 0.02,
                                //     //             color: infocolor,
                                //     //             fontFamily: "Msemibold",
                                //     //           ),
                                //     //           fillColor: Colors.white,
                                //     //           filled: true,
                                //     //           border: OutlineInputBorder(
                                //     //             borderRadius: BorderRadius.circular(25),
                                //     //           )),
                                //     //     ),
                                //     //   ),
                                //     // ),
                                //      const SizedBox(
                                //       width: 10,
                                //     ),
                                //     Container(
                                //         height: size.height * 0.05,
                                //         width: size.width * 0.3,
                                //         decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(20),
                                //             border: Border.all(color: Colors.grey),
                                //             color: Colors.white),
                                //         child: Padding(
                                //           padding: EdgeInsets.only(
                                //               left: size.width * 0.04,
                                //               right: size.width * 0.03),
                                //           child: Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Text(
                                //                 appPro.provinceControl.text.trim(),
                                //                 style: TextStyle(
                                //                     fontFamily: "Msemibold",
                                //                     fontSize: size.height * 0.018,
                                //                     color: infocolor),
                                //               ),
                                //               Image.asset(downarrow_icon)
                                //             ],
                                //           ),
                                //         )),
                                //     const SizedBox(
                                //       width: 10,
                                //     ),
                                //     // Expanded(
                                //     //   flex: 1,
                                //     //   child: SizedBox(
                                //     //     // height: size.height * 0.06,
                                //     //     // width: size.width * 0.58,
                                //     //     child: TextFormField(
                                //     //       controller: appPro.provinceControl,
                                //     //       validator: (String? value) {
                                //     //         if (value!.isEmpty) {
                                //     //           return "Enter province";
                                //     //         }
                                //     //         return null;
                                //     //       },
                                //     //       decoration: InputDecoration(
                                //     //           hintText: 'Province',
                                //     //           contentPadding: const EdgeInsets.only(
                                //     //               top: 0.0, left: 22.0, bottom: 2.0),
                                //     //           hintStyle: TextStyle(
                                //     //             fontSize: size.height * 0.02,
                                //     //             color: infocolor,
                                //     //             fontFamily: "Msemibold",
                                //     //           ),
                                //     //           fillColor: Colors.white,
                                //     //           filled: true,
                                //     //           border: OutlineInputBorder(
                                //     //             borderRadius: BorderRadius.circular(25),
                                //     //           )),
                                //     //     ),
                                //     //   ),
                                //     // ),

                                //     const SizedBox(
                                //       width: 3,
                                //     ),
                                //     // Expanded(
                                //     //   flex: 1,
                                //     //   child: SizedBox(
                                //     //     // height: size.height * 0.06,
                                //     //     // width: size.width * 0.58,
                                //     //     child: TextFormField(
                                //     //       controller: appPro.countryControl,
                                //     //       validator: (String? value) {
                                //     //         if (value!.isEmpty) {
                                //     //           return "Enter country";
                                //     //         }
                                //     //         return null;
                                //     //       },
                                //     //       decoration: InputDecoration(
                                //     //           hintText: 'Country',
                                //     //           contentPadding: const EdgeInsets.only(
                                //     //               top: 0.0, left: 22.0, bottom: 2.0),
                                //     //           hintStyle: TextStyle(
                                //     //             fontSize: size.height * 0.02,
                                //     //             color: infocolor,
                                //     //             fontFamily: "Msemibold",
                                //     //           ),
                                //     //           fillColor: Colors.white,
                                //     //           filled: true,
                                //     //           border: OutlineInputBorder(
                                //     //             borderRadius: BorderRadius.circular(25),
                                //     //           )),
                                //     //     ),
                                //     //   ),
                                //     // ),
                                //     Container(
                                //         height: size.height * 0.05,
                                //         width: size.width * 0.27,
                                //         decoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(20),
                                //             border: Border.all(color: Colors.grey),
                                //             color: Colors.white),
                                //         child: Padding(
                                //           padding: const EdgeInsets.all(8.0),
                                //           child: Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Text(
                                //                 appPro.countryControl.text.trim(),
                                //                 style: TextStyle(
                                //                     fontFamily: "Msemibold",
                                //                     fontSize: size.height * 0.018,
                                //                     color: infocolor),
                                //               ),
                                //               Image.asset(downarrow_icon)
                                //             ],
                                //           ),
                                //         )),
                                //   ],
                                // ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Container(
                                    //     height: size.height * 0.055,
                                    //     width: size.width * 0.31,
                                    //     decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.circular(20),
                                    //         border: Border.all(color: Colors.grey),
                                    //         color: Colors.white),
                                    //     child: Padding(
                                    //       padding: EdgeInsets.only(
                                    //           left: size.width * 0.02,
                                    //           right: size.width * 0.02),
                                    //       child: Row(
                                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //         children: [
                                    //           Text(
                                    //             'Postal code',
                                    //             style: TextStyle(
                                    //                 fontFamily: "Msemibold",
                                    //                 fontSize: size.height * 0.018,
                                    //                 color: infocolor),
                                    //           ),
                                    //           Image.asset(downarrow_icon)
                                    //         ],
                                    //       ),
                                    //     )),
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
                                              contentPadding: const EdgeInsets.only(top: 0.0, left: 15.0, bottom: 2.0),
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
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.58,
                                      child: TextFormField(
                                        controller: addressControl,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return "Enter your address";
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
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                ),
                                InkWell(
                                  onTap: () {
                                    // setState(() {
                                    //   addAnotherPage++;
                                    // });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '+ Add Another',
                                        style: TextStyle(fontSize: size.height * 0.02, color: cgreen, fontFamily: 'Stf'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.lock,
                                        size: 20,
                                        color: infocolor,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                SizedBox(
                                  height: size.height * 0.04,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.02),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Time & Location',
                          style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      selectedMeetinDate(context);
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: size.height * 0.055,
                            width: size.width * 0.7,
                            child: TextFormField(
                              enabled: false,
                              controller: meetingDateTimeControllor,
                              decoration: InputDecoration(
                                  hintText: meetingDatetime != null
                                      ? DateFormat('EEEE').format(DateTime.parse(meetingDatetime.toString())) +
                                          ", " +
                                          DateFormat.yMMMd().format(DateTime.parse(meetingDatetime.toString())).toString()
                                      : 'Date & Time',
                                  contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                  hintStyle: TextStyle(fontSize: size.width * 0.04, color: Colors.black),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            edit_icon,
                            color: gradientgreen,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>MyMap()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.7,
                            child: TextFormField(
                              controller: locationControllor,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "Enter Your Location";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Location',
                                  contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                  hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  )),
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            locationarrow,
                            color: gradientgreen,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.02),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Group',
                          style: TextStyle(fontSize: size.height * 0.02, fontFamily: 'MBold'),
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => GroupsCardsScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.02),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            grptwo_icon,
                            color: gradientgreen,
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Text(
                            'Ungrouped',
                            style: TextStyle(fontSize: size.height * 0.018, fontFamily: "Stf"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2, left: size.width * 0.04, right: size.width * 0.04),
            height: size.height * 0.2,
            width: size.width,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ));
    });
  }
}
