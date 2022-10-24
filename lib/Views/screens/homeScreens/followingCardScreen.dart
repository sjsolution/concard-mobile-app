import 'package:concard/Views/screens/homeScreens/cardsScrens/allCardsScreen.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/vipCardsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/images.dart';
import '../../widgets/customButton.dart';
import '../../widgets/customContainer.dart';
import 'addContactCardsScreen.dart';
import 'groupsCardScreen.dart';
import 'importCardsScreen.dart';
import 'cardsScrens/mycardsScreen.dart';

class FollowingCardsScreen extends StatefulWidget {
  const FollowingCardsScreen({Key? key}) : super(key: key);

  @override
  State<FollowingCardsScreen> createState() => _FollowingCardsScreenState();
}

class _FollowingCardsScreenState extends State<FollowingCardsScreen> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery
        .of(context)
        .size;
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
                      colors: [
                        signupclor_light,
                        signupclor_dark
                      ]
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios, size: size.height*0.02, color: bckgrnd,)),
                      Container(
                        alignment: Alignment.center,
                        child: Text('Following', style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "MBold",
                            color: bckgrnd
                        ),),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height*0.13),
                // height: size.height*1.0,
                width: size.width,
                decoration: BoxDecoration(
                    color: btnclr,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){

                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>MyCardsScreen()));
                            },
                            child: Text('My Cards (22) ',
                              style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Msemibold",
                                  color: signupclor_dark
                              ),),
                          ),
                          Text('|',
                            style: TextStyle(
                              fontSize: size.height * 0.015,
                              color: Colors.black,
                            ),),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>AllCardsScreen()));
                            },
                            child: Text('All cards (23)',
                              style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  color: infocolor,
                                  fontFamily: "Msemibold"
                              ),),
                          ),
                          Text('|',
                            style: TextStyle(
                              fontSize: size.height * 0.015,
                              color: Colors.black,
                            ),),
                          GestureDetector(
                            onTap: (){

                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>VipCardsScreen()));
                            },
                            child: Text('VIP (12)',
                              style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  color: infocolor,
                                  fontFamily: "Msemibold"
                              ),),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: size.height * 0.035,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      gradientgreen,
                                      primarygreen,
                                    ]
                                ),
                                color: bckgrnd,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: GestureDetector(
                              onTap: (){
                              },
                              child: Container(
                                // margin: EdgeInsets.only(left: size.width*0.04),
                                alignment: Alignment.center,
                                child: Text('Manage', style: TextStyle(
                                    color: bckgrnd,
                                    fontSize: size.height*0.015,
                                    fontFamily: 'Msemibold'
                                ),),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height*0.02,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                           height: size.height * 0.09,
                          width: size.width * 0.85,
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:  BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:  BorderSide(color: Colors.white),
                                ),
                                prefixIcon:  Icon(Icons.search,size: size.height*0.05,color: signupclor_dark,),
                                fillColor: Colors.white,
                                filled:true,
                                hintText: 'Search cards', contentPadding:
                              EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                hintStyle: TextStyle(
                                    fontSize: size.width * 0.04, color: infocolor),
                              ),
                            ),
                          ),
                          GestureDetector(

                              onTap: (){
                                 _sortModalBottomSheet(context);
                              },
                              child: SvgPicture.asset(sort_icon,height: 20,)),
                        ],
                      ),
                      SizedBox(height: size.height*0.01,),
                      Container(
                        height: size.height*0.8,
                        width: size.width,
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return Container(
                              margin: EdgeInsets.only(top: size.height*0.02),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      child: Image.asset(mycard_icon,fit: BoxFit.cover,),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: size.height*0.08,
                                    width: size.width*0.3,
                                  ),
                                  SizedBox(width: size.width*0.04,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Company Name',style: TextStyle(
                                          fontSize: size.height*0.015,
                                          fontFamily:"MBold"
                                      ),),
                                      SizedBox(height: size.height*0.02,),
                                      Text('Lorem ipsum dolor sit amet',style: TextStyle(
                                          fontSize: size.height*0.012,
                                          fontFamily: "Msemibold",
                                          color: infocolor
                                      ),),
                                      SizedBox(height: size.height*0.01,),
                                      Text('Concsectetuer adipiscing elit, sed fiam',style: TextStyle(
                                          fontSize: size.height*0.012,
                                          fontFamily: "Msemibold",
                                          color: infocolor
                                      ),),
                                    ],
                                  ),

                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),]
            ,
          ),
        )
    );
  }

void _sortModalBottomSheet(context) {
    late bool isName = false;
    late bool isDate = false;
    late bool isComp = false;
    var size = MediaQuery.of(context).size;
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),

        )
      ),
        context: context,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: StatefulBuilder(
              builder: (context, setSte) {
                return Container(
                  height: size.height *0.68,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )
                  ),
                  child: Wrap(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: size.width*0.04,right:size.width*0.04,top: size.height*0.02),
                        child: Text(
                          'Sort by',
                          style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontFamily: 'Mbold'
                          ),
                        ),
                      ),
                      new ListTile(
                          minLeadingWidth: 5,
                          leading: Checkbox(
                            checkColor: Colors.white,
                            overlayColor: MaterialStateProperty.all(infocolor),
                            fillColor: MaterialStateProperty.all(txtcolr),
                            value: isName,
                            shape: CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                setSte(() {
                                  isName = value!;
                                  isDate=false;
                                  isComp=false;
                                });
                              });
                            },
                          ),
                          title: new Text('by Name'),
                          onTap: () => {}),
                      new ListTile(
                        leading: Checkbox(
                          checkColor: Colors.white,
                          hoverColor: infocolor,
                          fillColor: MaterialStateProperty.all(txtcolr),
                          value: isDate,
                          shape: CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                             setSte((){

                                isDate = value!;
                              isName=false;
                              isComp=false;
                             });
                            });
                          },
                        ),
                        title: new Text('by Date'),
                        onTap: () => {},
                      ),
                      new ListTile(
                        leading: Checkbox(
                          checkColor: Colors.white,
                          hoverColor: infocolor,
                          fillColor: MaterialStateProperty.all(txtcolr),
                          value: isComp,
                          shape: CircleBorder(),
                          onChanged: (bool? value) {
                            setState(() {
                             setSte((){
                                isComp = value!;
                              isName=false;
                              isDate=false;
                             });
                            });
                          },
                        ),
                        title: new Text('by Company name'),
                        onTap: () => {},
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (BuildContext context) =>()));
                          },
                          child: Column(
                            children: [
                              Center(
                                child: CustomConatiner(txt: 'Supplier', color1: txtcolr, color2: cgreen)),
                              SizedBox(
                                height: size.height*0.02,
                              ),
                              Center(
                                child: CustomConatiner(txt: 'Management', color1: txtcolr, color2: cgreen)),
                               SizedBox(
                                height: size.height*0.02,
                              ),
                            Center(
                              child: CustomConatiner(txt: 'Select Country', color1: infocolor.withOpacity(0.3),color2: infocolor.withOpacity(0.3))),
                               SizedBox(
                                height: size.height*0.02,
                              ),
                                Center(
                              child: CustomConatiner(txt: 'Select Position', color1: infocolor.withOpacity(0.3),color2: infocolor.withOpacity(0.3))),
                                 SizedBox(
                                height: size.height*0.02,
                              ),
                                Center(
                              child: CustomConatiner(txt: 'Select Product & Services', color1: infocolor.withOpacity(0.3),color2: infocolor.withOpacity(0.3))),
                               SizedBox(
                                height: size.height*0.02,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Center(
                                  child: CustomButton(
                                    text: 'Apply',
                                    color1: signupclor_light,
                                    textcolor2: bckgrnd,
                                    color2: signupclor_dark,
                                    textcolor1: bckgrnd,
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}

