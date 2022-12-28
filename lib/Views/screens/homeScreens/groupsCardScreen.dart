import 'dart:async';

import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/GropsController/addGroup_controller.dart';
import 'package:concard/Models/Groups/group_list_modal.dart';
import 'package:concard/Views/screens/homeScreens/addnewGroup.dart';
import 'package:concard/Views/screens/homeScreens/groupsDetailCards.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;

import '../../../Constants/colors.dart';

class GroupsCardsScreen extends StatefulWidget {
 GroupsCardsScreen({Key? key}) : super(key: key);

  @override
  State<GroupsCardsScreen> createState() => _GroupsCardsScreenState();
}


class _GroupsCardsScreenState extends State<GroupsCardsScreen> {


Timer? apiTimer;
  @override
  void initState() {
    // AddMyCard();
    // // TODO: implement initStat
    super.initState();
    Timer.periodic(Duration(seconds: 1),(timer)async{
      setState(() {
    getGroupsList('','');
        
      });
    });

  }

 
List<GroupListData>? groupsData;
  String? searchValue;

getGroupsList(String sortBy ,String searchGroup)async{
Globals.groupListModal = await GroupsController().GroupsList(sortBy,searchGroup.trim());
setState(() {
  groupsData = Globals.groupListModal!.groupListData;
});
// print( 'My group list'+Globals.groupListModal.toString());
}

bool?isName=false;
bool?isDate=false;

TextEditingController searchGroupController = TextEditingController();
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
                             Navigator.push(context, MaterialPageRoute(builder: (_)=>AddNewGroupScreen()));
                         
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                       height: size.height * 0.09,
                          width: size.width * 0.8,
                        child: TextFormField(
                          onChanged: (value)async{
                            if(value.isEmpty){
                              searchValue=null;
                                getGroupsList('', value);

                              setState(() {
                              });
                            }else{
                              searchValue=value;
                                getGroupsList('', value);

                              setState(() {
                                
                              });
                            }
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Icon(Icons.search,size: size.height*0.05,color: signupclor_dark,),
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
                          child: Padding(
                            padding:  EdgeInsets.only(bottom: size.height*0.03),
                            child: SvgPicture.asset(sort_icon,height: 20,),
                          )),
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
                groupsData!=null? Expanded(
                    flex: 1,
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: groupsData!.length,
                      itemBuilder: (context,index){
                        return groupsData!=null?Column(
                          children: [
                           
                            InkWell(
                              onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>GroupsDetailCardsScreen(groupName: groupsData![index].name.toString(),
                        groupId:groupsData![index].id ,
                        )));

                              },
                              child: Row(
                                children: [
                                  
                                  Text(groupsData![index].name.toString(),style: TextStyle(
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
                        ):Text('No groups found');
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
    var sortType='';
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
                              Radio(
                                  activeColor: primarygreen,
                                  value: '2',
                                  groupValue: sortType,
                                  onChanged: (dynamic value) {
                                    setSte(() {
                                      setState(() {
                                        sortType = value;
                                        print(value);
                                      });
                                    });
                                  }),
                                 
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
                              Radio(
                                  activeColor: primarygreen,
                                  value: '1',
                                  groupValue: sortType,
                                  onChanged: (dynamic value) {
                                    setSte(() {
                                      setState(() {
                                        sortType = value;
                                        print(value);
                                      });
                                    });
                                  }),
                                 
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
                         CustomNextButton(text: "Apply", image: '', color1: signupclor_light, color2: signupclor_dark, onTap: ()async{
                           getGroupsList(sortType, '' );
                            Navigator.pop(context);
                            setSte((){
                              setState(() {
                                
                              });
                            });
                         })
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
