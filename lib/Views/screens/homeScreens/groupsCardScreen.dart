import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/groupsDetailCards.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/colors.dart';

class GroupsCardsScreen extends StatefulWidget {
 GroupsCardsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsCardsScreen> createState() => _GroupsCardsScreenState();
}

class _GroupsCardsScreenState extends State<GroupsCardsScreen> {
List<String>? itemList=[
 

];
void addItemToList(){
  setState(() {
    itemList!.add(textFieldController.text);
  });
}
bool?isName=false;
bool?isDate=false;

TextEditingController textFieldController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
            child:  Padding(
              padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, size: 20, color: bckgrnd,)),
                  Row(
                    children: [
                      Image.asset(group,),
                      SizedBox(width: size.width*0.02,),
                      Container(
                        alignment: Alignment.center,
                        child: Text('Groups', style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "Mbold",
                            color: bckgrnd
                        ),),
                      ),
                    ],
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
            // height: size.height*0.8,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('All Groups',
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "MBold",
                          color: signupclor_light,
                        ),),
                       InkWell(
                         onTap: (){
                             showDialog(
                  context: context,
                  builder: (BuildContext context) =>  Container(
                    margin:EdgeInsets.only(bottom: size.height * 0.1),
                    child: Dialog(
                alignment: AlignmentDirectional.bottomCenter,
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                //this right here
                child: Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      color: btnclr,
                  ),
                
                    height: size.height * 0.25,
                    width: size.width*0.9,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04,
                          right: size.width * 0.04,
                          top: size.height * 0.02),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                              
                                Text(
                                  'Create New Group',
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
                           height: size.height*0.1,
                           width: size.width*0.8,
                           child: TextFormField(  
                             controller: textFieldController,                  
                             decoration: InputDecoration(
                               hintText: 'Group Name',
                               contentPadding: EdgeInsets.only(top: 0,left: 22,right: 10,bottom:10),
                               hintStyle: TextStyle(
                                 fontFamily: "MBold",
                                 color: infocolor,
                                 fontSize: size.height*0.015
                               ),
                               fillColor: bckgrnd,
                               filled: true,
                               enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20),
                                 borderSide:BorderSide(color: bckgrnd),
                                 
                               ),
                               focusedBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20),
                                 borderSide:BorderSide(color: bckgrnd),
                                 
                               ),
                             ),
                           ),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             InkWell(
                               onTap:(){
                                 Navigator.pop(context);
                               },
                               child: Container(
                                 height: size.height*0.05,
                                 width: size.width*0.3,
                                 decoration: BoxDecoration(
                                   border: Border.all(color: signupclor_dark),
                                   borderRadius: BorderRadius.circular(20),
                                   color: btnclr
                                 ),
                                 child: Center(
                                   child: Text('Cancel',
                                   style: TextStyle(
                                     fontSize:size.height*0.018,
                                     fontFamily: "MBOld",
                                     color: signupclor_dark
                                   ),
                                   )),
                               ),
                             ),
                             InkWell(
                               onTap: (){
                                
                               addItemToList();
                               Navigator.pop(context);
                              textFieldController.clear();
                               },
                               child: Container(
                                 height: size.height*0.05,
                                 width: size.width*0.3,
                                 decoration: BoxDecoration(
                                   border: Border.all(color: signupclor_dark),
                                   borderRadius: BorderRadius.circular(20),
                                   color: btnclr
                                 ),
                                 child: Center(
                                   child: Text('Ok',
                                   style: TextStyle(
                                     fontSize:size.height*0.018,
                                     fontFamily: "MBOld",
                                     color: signupclor_dark
                                   ),
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
                  ));
                         },
                         child: Container(
                          alignment: Alignment.center,
                          height: size.height * 0.04,
                          width: size.width * 0.4,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    signupclor_light,
                                    signupclor_dark,
                                  ]
                              ),
                              color: bckgrnd,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: size.width*0.02,left: size.width*0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.add,color: bckgrnd,size: 20,),
                                Container(
                                  // margin: EdgeInsets.only(left: size.width*0.04),
                                  child: Text('Create new Group', style: TextStyle(
                                      color: bckgrnd,
                                      fontSize: size.height*0.015,
                                      fontFamily: 'MBold'
                                  ),),
                                ),
                              ],
                            ),
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
                           _sortbygModalBottomSheet(context);
                          },
                          child: SvgPicture.asset(sort_icon,height: 20,)),
                    ],
                  ), 
                    SizedBox(
                    height: size.height*0.02,
                  ),
                   Divider(
                              thickness: 1,
                            ),
                  SizedBox(
                    height: size.height*0.02,
                  ),
                itemList!.isNotEmpty? Expanded(
                    flex: 1,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: itemList!.length,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                           
                            InkWell(
                              onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>GroupsDetailCardsScreen()));

                              },
                              child: Row(
                                children: [
                                  
                                  Text(itemList![index],style: TextStyle(
                                    fontSize: size.height*0.015,
                                    fontFamily: "MBold",
                                    color:Colors.black
                                  ),),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,size: size.height*0.02,)
                                ],
                              ),
                            ),
                              SizedBox(
                    height: size.height*0.02,
                                    ),
                            Divider(
                              thickness: 1,
                            ),
                              SizedBox(
                    height: size.height*0.015,
                                    ),
                          ],
                        );
                      }),
                  ):
                                     
                Center(
                  child: Text('Please create a Group and add Cards to\norgainize your cards',
                  
                  style: TextStyle(
                    fontSize: size.height*0.018,
                    fontFamily: "MBold",
                    color: infocolor
                  ),),
                )
                 
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
   void _sortbygModalBottomSheet(context) {
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
                height: size.height*0.28,
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
                            Text('Sort by',
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
                                  width: size.width*0.02,
                                  ),
                         Row(
                           children: [
                             Checkbox(
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
                                        });
                                      });
                                    },
                                  ),
                                  SizedBox(
                                  width: size.width*0.04,
                                  ),
                                  Text('by Name',
                                  style: TextStyle(
                                    fontSize: size.height*0.015,
                                    fontFamily: "Stf",
                                  ),)
                           ],
                         ),
                         SizedBox(
                           height: size.height*0.01,
                         ),
                         Row(
                           children: [
                             Checkbox(
                                    checkColor: Colors.white,
                                    overlayColor: MaterialStateProperty.all(infocolor),
                                    fillColor: MaterialStateProperty.all(txtcolr),
                                    value: isDate,
                                    shape: CircleBorder(),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        setSte(() {
                                          isDate = value!;
                                          isName=false;
                                        });
                                      });
                                    },
                                  ),
                                  SizedBox(
                                  width: size.width*0.04,
                                  ),
                                  Text('by Date',
                                  style: TextStyle(
                                    fontSize: size.height*0.015,
                                    fontFamily: "Stf",
                                  ),),
                           ],
                         ),
                           SizedBox(
                                  height: size.height*0.03,
                                  ),
                         CustomNextButton(text: "Apply", image: '', color1: signupclor_light, color2: signupclor_dark, onTap: (){})
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
