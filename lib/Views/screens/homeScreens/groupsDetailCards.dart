import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/addCardsToGroupScreen.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:concard/Views/widgets/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupsDetailCardsScreen extends StatefulWidget {
  GroupsDetailCardsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsDetailCardsScreen> createState() =>
      _GroupsDetailCardsScreenState();
}

class _GroupsDetailCardsScreenState extends State<GroupsDetailCardsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: size.height * 0.02,
                        color: bckgrnd,
                      )),
                  Row(
                    children: [
                      Image.asset(group),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        'Groups',
                        style: TextStyle(
                            fontFamily: "MBold",
                            fontSize: size.height * 0.018,
                            color: bckgrnd),
                      ),
                    ],
                  ),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.08,
                  )
                ],
              ),
            ),
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
            child: Padding(
             padding:  EdgeInsets.only(left: size.width*0.04,right:size.width*0.04,top:size.height*0.03),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Groups 1',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "MBold",
                          color: signupclor_light,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          _manageModalBottomSheet(context);
                        },
                        child: Container(
                                    height: size.height*0.04,
                                    width: size.width*0.27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: gradientgreen),
                                      color: btnclr
                                    ),
                                    child: Center(
                                      child: Text('Manage',style: TextStyle(
                                        fontFamily: "MBold",
                                        fontSize: size.height*0.018,
                                        color: gradientgreen
                                      ),),
                                    ),
                                  ),
                      ),
                    ],
                  ),
                   SizedBox(height: size.height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: size.height*0.05,
                        width: size.width*0.8,
                        child: TextFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Image.asset(srch_icon,color: signupclor_dark,),
                            fillColor: Colors.white,
                            filled:true,
                            hintText: 'Search Groups', contentPadding:
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
                  SizedBox(
                    height: size.height*0.03,
                  ), 
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(_) =>AddCardsToGroupScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Added cards',
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "MBold",
                          ),
                        ),
                        Container(
                                    height: size.height*0.04,
                                    width: size.width*0.27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: gradientgreen),
                                      color: btnclr
                                    ),
                                    child: Center(
                                      child: Text('Add Cards',style: TextStyle(
                                        fontFamily: "MBold",
                                        fontSize: size.height*0.016,
                                        color: gradientgreen
                                      ),),
                                    ),
                                  ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: btnclr,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: 4,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              return  Container(
                                margin: EdgeInsets.only(top: size.height*0.03),
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
                                    Spacer(),
                                    InkWell(
                                      onTap: (){
                                        _moreModalBottomSheet(context);
                                      },
                                      child: Icon(Icons.more_vert,color: signupclor_dark,))
                                  ],
                                ),
                              );
                            }
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
    void _manageModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
        ),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height*0.3,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.04, right: size.width*0.04,top: size.height*0.02),
                      child: Column(
                        children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Manage',
                            style: TextStyle(
                              fontSize: size.height*0.018,
                              fontFamily: "MBold",
                            ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close,size: size.height*0.025,))
                          ],
                        ),
                          SizedBox(
                                  height: size.height*0.02,
                                  ),
                         Row(
                           children: [
                             Container(
                               height: size.height*0.03,
                               width: size.width*0.1,
                               child: SvgPicture.asset(grptwo_icon)),
                             SizedBox(
                               width: size.width*0.07
                             ),
                             Text('Rename Group',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
                           ],
                         ),
                          SizedBox(
                                  height: size.height*0.03,
                                  ),
                            Row(
                           children: [
                             Container(
                                height: size.height*0.03,
                               width: size.width*0.1,
                               child: SvgPicture.asset(emailtwo_icon)),
                             SizedBox(
                               width: size.width*0.07
                             ),
                             Text('Email',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
                           ],
                         ), SizedBox(
                                  height: size.height*0.03,
                                  ),
                             Row(
                           children: [
                             Container(
                                height: size.height*0.03,
                               width: size.width*0.1,
                               child: SvgPicture.asset(share_icon)),
                             SizedBox(
                               width: size.width*0.07
                             ),
                             Text('Share',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
                           ],
                         ),
                          SizedBox(
                                  height: size.height*0.03,
                                  ),
                             Row(
                           children: [
                             Container(
                                height: size.height*0.03,
                               width: size.width*0.1,
                               child: SvgPicture.asset(recyclebin_icon)),
                             SizedBox(
                               width: size.width*0.07
                             ),
                             Text('Delete',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
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

   void _moreModalBottomSheet(context) {
    var size = MediaQuery.of(context).size;

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
        ),
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (context, setSte) {
              return Container(
                height: size.height*0.22,
                width: size.width,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.04, right: size.width*0.04,top: size.height*0.02),
                      child: Column(
                        children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:size.width*0.07
                            ),
                            Text('John XXX',
                            style: TextStyle(
                              fontSize: size.height*0.018,
                              fontFamily: "MBold",
                            ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.close,size: size.height*0.025,))
                          ],
                        ),
                          SizedBox(
                                  height: size.height*0.04,
                                  ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Column(
                               children: [
                                 Image.asset(msgs_icon,color: signupclor_dark,),
                                 SizedBox(
                               height: size.height*0.02
                             ),
                             Text('Message',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
                               ],
                             ),
                             Column(
                               children: [
                                 SvgPicture.asset(emailtwo_icon),
                             SizedBox(
                               height: size.height*0.023
                             ),
                             Text('Email',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
                               ],
                             ),
                             Column(
                               children: [
                                   SvgPicture.asset(share_icon),
                             SizedBox(
                               height: size.height*0.02
                             ),
                             Text('Share',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
                               ],
                             ),
                             Column(
                               children: [
                                  SvgPicture.asset(recyclebin_icon),
                             SizedBox(
                               height: size.height*0.02
                             ),
                             Text('Delete',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
                               ],
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
                  height: size.height *0.7,
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
