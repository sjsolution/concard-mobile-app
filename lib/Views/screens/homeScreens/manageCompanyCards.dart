import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/globals.dart';
import 'package:concard/Views/screens/homeScreens/addCompanyCards.dart';
import 'package:concard/Views/screens/homeScreens/companyMembersPermissions.dart';
import 'package:concard/Views/screens/homeScreens/contactsProfileViewScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:concard/Views/screens/globals.dart' as globals;
class ManageCompanyCardsScreen extends StatefulWidget {
  ManageCompanyCardsScreen({Key? key}) : super(key: key);

  @override
  State<ManageCompanyCardsScreen> createState() => _ManageCompanyCardsScreenState();
}
String? isSelect;
class _ManageCompanyCardsScreenState extends State<ManageCompanyCardsScreen> {
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
                    Text('Company Members', style: TextStyle(
                        fontSize: size.height * 0.018,
                       fontFamily: "MBold",
                        color: bckgrnd
                    ),),
                   Container(
                    height: 5,
                    width: 10,
                   )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height*0.13),
              height: size.height*1.0,
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
                children: [
                GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>FollowingCardsScreen()));
                  },
                  child: Text('Premimum Members (22) ',
                    style: TextStyle(
                        fontSize: size.height * 0.015,
                        fontFamily: "Msemibold",
                        color: signupclor_dark
                    ),),
                ),
                  SizedBox(width: size.width*0.01,),

                Text('|',
                  style: TextStyle(
                    fontSize: size.height * 0.015,
                    color: Colors.black,
                  ),),
                  SizedBox(width: size.width*0.01,),
                Text('All Members (23)',
                  style: TextStyle(
                      fontSize: size.height * 0.015,
                      color: infocolor,
                      fontFamily: "Msemibold"
                  ),),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>CompanyMembersPermissions()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.035,
                    width: size.width * 0.21,
                    decoration: BoxDecoration(
                        border: Border.all(color:gradientgreen),
                        color: btnclr,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Permissions', style: TextStyle(
                          color: txtcolr,
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
                          height: size.height*0.05,
                          width: size.width*0.8,
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
                              prefixIcon: Image.asset(srch_icon,color: signupclor_dark,),
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
                            },
                            child: SvgPicture.asset(sort_icon,height: 20,)),
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
            Row(
              children: [
                SizedBox(width: size.width*0.02,),
                Text('Added Cards (4/10)',style: 
                TextStyle(
                  fontSize: size.height*0.018,
                  fontFamily: "MBOld"
                ),),
                Spacer(),
                InkWell(
                  onTap: (){
                     setState(() {
                            globals.isReplace=false;
                              
                            });
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCompanyCards()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.035,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(color: gradientgreen),
                        color: btnclr,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Add Cards', style: TextStyle(
                          color: txtcolr,
                          fontSize: size.height*0.015,
                          fontFamily: 'Msemibold'
                      ),),
                    ),
                  ),
                )
              ],
            ),
                    SizedBox(height: size.height*0.02,),
                    GestureDetector(
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ContactProfileViewScreen()));
                      },
                      child: Container(
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
                                     width: size.width*0.25,
                                   ),
                                    SizedBox(width: size.width*0.03,),
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
                            },
                        ),
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
                height: size.height*0.2,
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
                                Image.asset(edit_icon,color: signupclor_dark,),
                                 SizedBox(
                               height: size.height*0.02
                             ),
                             Text('Edit',
                             style: TextStyle(
                               fontFamily: "Stf",
                               fontSize: size.height*0.015,
                             ),)
                               ],
                             ),
                             InkWell(
                              onTap: (){
                                 showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          Container(
                                            margin: EdgeInsets.only(
                                                bottom: size.height * 0.1),
                                            child: Dialog(
                                              alignment: AlignmentDirectional
                                                  .bottomCenter,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              //this right here
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: btnclr,
                                                ),
                                                height: size.height * 0.2,
                                                width: size.width * 0.9,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width * 0.04,
                                                      right: size.width * 0.04,
                                                      top: size.height * 0.02),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text('Is jhon leaving?',style: TextStyle(
                                                              fontSize: size.height*0.018,
                                                              fontFamily: "MBold"
                                                            
                                                            ),),
                                                            GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Icon(
                                                                  Icons.close,
                                                                  size: 20,
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.03,
                                                      ),
                                                      Text(
                                                        'We are sorry to hear that',
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.015,
                                                          fontFamily: "Stf",
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          print(globals.isReplace);
                                                        setState(() {
                                                          setSte((){
                                                           globals.isReplace=true;
                                                          });
                                                          print(globals.isReplace);
                                                         Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCompanyCards()));

                                                        });
                                                        },
                                                        child: Center(
                                                          child: Container(
                                                            height: size.height *
                                                                0.05,
                                                            width:
                                                                size.width * 0.3,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        signupclor_dark),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                color: btnclr),
                                                            child: Center(
                                                                child: Text(
                                                              'Replace',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      size.height *
                                                                          0.018,
                                                                  fontFamily:
                                                                      "MBOld",
                                                                  color:
                                                                      signupclor_dark),
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ));
                              },
                               child: Column(
                                 children: [
                                   Image.asset(exhngcard_icon),
                               SizedBox(
                                 height: size.height*0.023
                               ),
                               Text('Replace',
                               style: TextStyle(
                                 fontFamily: "Stf",
                                 fontSize: size.height*0.015,
                               ),)
                                 ],
                               ),
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
                             ),
                             Column(
                               children: [
                                  Image.asset(remove),
                             SizedBox(
                               height: size.height*0.02
                             ),
                             Text('Remove',
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
  }