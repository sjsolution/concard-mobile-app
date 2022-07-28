import 'package:concard/Views/widgets/customCardInputField.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';

class AddContactCardsScreen extends StatelessWidget {
  const AddContactCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
var controller=TextEditingController();
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body:   SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height*0.15,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topCenter,
                        colors: [
                          signupclor_light,
                          signupclor_dark
                        ]
                    ),
                  ),
                child: Padding(
                  padding:  EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
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
                            width: size.width*0.02,
                          ),
                          Text(
                            'Edit Card',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                               fontFamily: "MBold",
                                color: bckgrnd),
                          ),
                        ],
                      ),
                     

                      Icon(
                        Icons.check,
                        size: 25,
                        color: bckgrnd,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.001),
                  alignment: Alignment.topLeft,
                  child: Text('Card Info',
                    style: TextStyle(
                        fontSize: size.height*0.018,
                        fontFamily: 'MBold'
                    ),)),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.3),
              // height: size.height*0.8,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child:Padding(
                padding: EdgeInsets.only(top: size.height*0.12,left:size.width*0.04,right: size.width*0.04),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: size.height*0.05,
                          width: size.width*0.4,
                          decoration:BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                  btnclr,
                                    btnclr
                                  ]
                              ),
                              border: Border.all(color: signupclor_dark),
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: (
                              Text('Scan',style: TextStyle(
                                  color: signupclor_dark,

                                  fontSize: size.height*0.018,
                                fontFamily: "MBold"

                              ),)
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: size.height*0.05,
                          width: size.width*0.4,
                          decoration:BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                   btnclr,
                                    btnclr
                                  ]
                              ),
                              border: Border.all(color: signupclor_dark),
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: (
                              Text('Upload',style: TextStyle(
                                  color: signupclor_dark,

                                  fontSize: size.height*0.018,
                                fontFamily: "MBold"
                              ),)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Personal',
                          style: TextStyle(
                              fontSize: size.height*0.018,
                              fontFamily: 'MBold'
                          ),)),
                    SizedBox(height: size.height*0.03,),
                    CustomCardInputField(hinttxt: 'Name', textInputType: TextInputType.text, controller: controller),
                    SizedBox(height: size.height*0.03,),
                    CustomCardInputField(hinttxt: 'Job Title', textInputType: TextInputType.text, controller: controller),
                    SizedBox(height: size.height*0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: size.height*0.05,
                            width: size.width*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.04,right:size.width*0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Day',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                        Container(
                            height: size.height*0.05,
                            width: size.width*0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.04,right:size
                                  .width*0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Month',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                        Container(
                            height: size.height*0.05,
                            width: size.width*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.04,right:size
                                  .width*0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Year',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Tel',
                          style: TextStyle(
                              fontSize: size.height*0.018,
                              fontFamily: 'MBold'
                          ),)),
                    SizedBox(height: size.height*0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height*0.06,
                            width: size.width*0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.04,right:size
                                  .width*0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Work',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width*0.6,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Number',
                                contentPadding:
                                EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                hintStyle:
                                TextStyle(fontSize: size.height * 0.018, color: infocolor,
                                fontFamily: "Msemibold"),
                                fillColor: Colors.white,
                                filled: true,
                                border:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: size.height*0.06,
                            width: size.width*0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.04,right:size
                                  .width*0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Mobile',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width*0.6,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Number',
                                contentPadding:
                                EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                hintStyle:
                                TextStyle(fontSize: size.height* 0.018, color: infocolor,
                                fontFamily: "Msemibold"),
                                fillColor: Colors.white,
                                filled: true,
                                border:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Email',
                          style: TextStyle(
                              fontSize: size.height*0.02,
                              fontFamily: 'MBold'
                          ),)),
                    SizedBox(height: size.height*0.03,),
                    Container(
                      height: size.height * 0.055,
                      width: size.width,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Email',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.width * 0.04, color: infocolor),
                            fillColor: Colors.white,
                            filled: true,
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                            )),
                      ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Company',
                          style: TextStyle(
                              fontSize: size.height*0.02,
                              fontFamily: 'MBold'
                          ),)),
                    SizedBox(height: size.height*0.03,),
                    Container(
                      height: size.height * 0.055,
                      width: size.width,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Company Name',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.width * 0.04, color: infocolor),
                            fillColor: Colors.white,
                            filled: true,
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                            )),
                      ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                      height: size.height * 0.055,
                      width: size.width,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Website',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.width * 0.04, color: infocolor),
                            fillColor: Colors.white,
                            filled: true,
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                            )),
                      ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                      height: size.height * 0.055,
                      width: size.width,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Field',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.width * 0.04, color: infocolor),
                            fillColor: Colors.white,
                            filled: true,
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                            )),
                      ),
                    ),
                    SizedBox(height: size.height*0.03,),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text('Address',
                          style: TextStyle(
                              fontSize: size.height*0.02,
                              fontFamily: 'MBold'
                          ),)),
                    SizedBox(height: size.height*0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: size.height*0.05,
                            width: size.width*0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.04,right:size.width*0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('City',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                        Container(
                            height: size.height*0.05,
                            width: size.width*0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.04,right:size.width*0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Province',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                        Container(
                            height: size.height*0.05,
                            width: size.width*0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.04,right:size.width*0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Country',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.03,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: size.height*0.055,
                            width: size.width*0.31,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                                color: Colors.white
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(left: size.width*0.02,right:size
                                  .width*0.02),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Postal code',style: TextStyle(
                                      fontFamily: "Msemibold",
                                      fontSize: size.height*0.018,
                                      color: infocolor
                                  ),),
                                  Image.asset(downarrow_icon)
                                ],
                              ),
                            )
                        ),
                        Container(
                          height: size.height * 0.06,
                          width: size.width*0.58,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Address',
                                contentPadding:
                                EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                hintStyle:
                                TextStyle(fontSize: size.height*0.02, color: infocolor,
                                  fontFamily: "Msemibold",
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                border:
                                OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.03,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('+ Add Another',style: TextStyle(
                            fontSize: size.height*0.02,
                            color: cgreen,
                            fontFamily: 'Stf'
                        ),),
                        SizedBox(width: 10,),
                        Icon(Icons.lock,size: 20,color: infocolor,)
                      ],
                    ),
                     SizedBox(height: size.height*0.02,),
                    Container(
                          alignment: Alignment.topLeft,
                          child: Text('Time & Location',
                            style: TextStyle(
                                fontSize: size.height*0.02,
                                fontFamily: 'MBold'
                            ),)),
                            SizedBox(
                              height: size.height*0.02,
                            ),
                            Row(
                              children: [
                                Container(
                      height: size.height * 0.055,
                      width: size.width*0.7,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Date & Time',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.width * 0.04, color: infocolor),
                            fillColor: Colors.white,
                            filled: true,
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                            )),
                      ),
                    ),
                    Spacer(),
                    Image.asset(edit_icon,color: gradientgreen,)
                              ],
                            ),
                             SizedBox(
                              height: size.height*0.02,
                            ),
                            Row(
                              children: [
                                Container(
                      height: size.height * 0.055,
                      width: size.width*0.7,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Location',
                            contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                            hintStyle:
                            TextStyle(fontSize: size.width * 0.04, color: infocolor),
                            fillColor: Colors.white,
                            filled: true,
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                            )),
                      ),
                    ),
                    Spacer(),
                    Image.asset(locationarrow,color: gradientgreen,)
                              ],
                            ),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                             Container(
                          alignment: Alignment.topLeft,
                          child: Text('Group',
                            style: TextStyle(
                                fontSize: size.height*0.02,
                                fontFamily: 'MBold'
                            ),)),
                            SizedBox(
                              height: size.height*0.03,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(grptwo_icon,color: gradientgreen,),
                                SizedBox(
                              width: size.width*0.03,
                            ),
                                Text('Ungrouped',style: TextStyle(
                                  fontSize: size.height*0.018,
                                  fontFamily: "Stf"
                                ),),
                              ],),
                    SizedBox(height:size.height*0.04,),

                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.2,left: size.width*0.04,right: size.width*0.04),
              height: size.height*0.2,
              width: size.width,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
