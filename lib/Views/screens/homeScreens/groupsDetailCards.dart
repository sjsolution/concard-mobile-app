import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/GropsController/addGroup_controller.dart';
import 'package:concard/Models/Cards/specific_card_model.dart';
import 'package:concard/Models/Groups/added_group_cards_list.dart';
import 'package:concard/Models/Groups/group_card_list.dart';
import 'package:concard/Views/screens/homeScreens/TeamsScreens/show_cards_screen.dart';
import 'package:concard/Views/screens/homeScreens/addCardsToGroupScreen.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:concard/Views/widgets/customContainer.dart';
import 'package:concard/Views/widgets/custom_alert_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:pretty_qr_code/pretty_qr_code.dart';


class GroupsDetailCardsScreen extends StatefulWidget {
  GroupsDetailCardsScreen({Key? key,required this.groupName,required this.groupId}) : super(key: key);
String? groupName;
int? groupId;
  @override
  State<GroupsDetailCardsScreen> createState() =>
      _GroupsDetailCardsScreenState();
}

class _GroupsDetailCardsScreenState extends State<GroupsDetailCardsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // addCardsToGroup();
    addedGroupCardsToGroup('');
    super.initState();
  }
List<AddedGroupCardsListData>? addedCardsData;
String? searchValue;
  addedGroupCardsToGroup(String? searchCard )async{
   Globals.addedCardsToGroupListModal= await GroupsController().addedGroupCardsList(widget.groupId.toString(),searchCard.toString());   
    setState(() {
      addedCardsData = Globals.addedCardsToGroupListModal!.addedGroupCardsListData;
    });
  }

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
                        widget.groupName.toString(),
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "MBold",
                          color: signupclor_light,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          _manageModalBottomSheet(context,widget.groupId);
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
                     height: size.height * 0.09,
                          width: size.width * 0.8,
                        child: TextFormField(
                          onChanged: (value)async{
                            if(value.isNotEmpty){
                              searchValue=null;
                             addedGroupCardsToGroup(value);
                             setState((){});
                            }else{
                              searchValue=value;
                              addedGroupCardsToGroup(value);
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
                      Navigator.push(context, MaterialPageRoute(builder:(_) =>ViewCardsScreen(teamId: '', groupId: widget.groupId.toString())));
                      print(Globals.groupsCardsList);                    },
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
                  addedCardsData!=null?
                    Expanded(
                      flex: 1,
                      child: Container(
                        
                        decoration: BoxDecoration(
                          color: btnclr,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          itemCount: addedCardsData!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context,index){
                              return addedCardsData!.isNotEmpty? Container(
                                margin: EdgeInsets.only(top: size.height*0.03),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                            children: [
                                              Container(
                                                height: size.height * 0.1,
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                        borderRadius: BorderRadius.circular(20),
                                                        child: Image.asset(
                                                          deccard,
                                                          height: size.height * 0.08,
                                                          fit: BoxFit.cover,
                                                        )),
                                                    Padding(
                                                        padding: EdgeInsets.only(
                                                            right: size.width * 0.01, left: size.width * 0.02, top: size.height * 0.015),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    SvgPicture.asset(
                                                                      con_icon,
                                                                      height: size.height * 0.02,
                                                                    ),
                                                                    const SizedBox(height: 5 //size.height * 0.015,
                                                                        ),
                                                                    Text(
                                                                      "CONCARD",
                                                                      style: TextStyle(
                                                                        fontSize: size.height * 0.003,
                                                                        color: signupclor_dark,
                                                                        fontFamily: "Mbold",
                                                                        letterSpacing: 2,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: size.height * 0.004,
                                                                    ),
                                                                    PrettyQr(
                                                                      typeNumber: 4,
                                                                      size: size.height * 0.01,
                                                                      data:
                                                                          '${addedCardsData![index].user!.id.toString()}',
                                                                      errorCorrectLevel: QrErrorCorrectLevel.M,
                                                                      roundEdges: true,
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(width: size.width * 0.01),
                                                                Container(
                                                                  height: size.height * 0.06,
                                                                  width: 1,
                                                                  color: cgreen,
                                                                ),
                                                                SizedBox(width: size.width * 0.02),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      "${addedCardsData![index].username.toString() ?? ''}",
                                                                      style: TextStyle(
                                                                        fontSize: size.height * 0.007,
                                                                        color: signupclor_dark,
                                                                        fontFamily: "Mbold",
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "${addedCardsData![index].jobTitle.toString() ?? ''}",
                                                                      style: TextStyle(
                                                                        fontSize: size.height * 0.007,
                                                                        color: signupclor_dark,
                                                                        fontFamily: "Stf",
                                                                      ),
                                                                    ),
                                                                    const SizedBox(height: 1 //size.height * 0.01,
                                                                        ),
                                                                    Row(
                                                                      children: [
                                                                        Column(children: [
                                                                          SvgPicture.asset(
                                                                            location_icon,
                                                                            height: size.height * 0.006,
                                                                          ),
                                                                        ]),
                                                                        const SizedBox(
                                                                          width: 1, //size.width * 0.015,
                                                                        ),
                                                                        Column(children: [
                                                                          SizedBox(
                                                                            width: size.width * 0.15,
                                                                            child: Text(
                                                                              "${addedCardsData![index].address.toString()}",
                                                                              style: TextStyle(
                                                                                fontSize: size.height * 0.006,
                                                                                color: signupclor_dark,
                                                                                fontFamily: "Mbold",
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ]),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: size.height * 0.001,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                          phonecall_icon,
                                                                          height: size.height * 0.006,
                                                                        ),
                                                                        SizedBox(
                                                                          width: size.width * 0.01,
                                                                        ),
                                                                        SizedBox(
                                                                          width: size.width * 0.15,
                                                                          child: Text(
                                                                          addedCardsData![index].numbers!.isNotEmpty?   addedCardsData![index].numbers![0].phoneNumber.toString() : '',
                                                                            style: TextStyle(
                                                                              fontSize: size.height * 0.006,
                                                                              color: signupclor_dark,
                                                                              fontFamily: "Mbold",
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: size.height * 0.001,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Image.asset(
                                                                          email_icon,
                                                                          height: size.height * 0.005,
                                                                          color: signupclor_dark,
                                                                        ),
                                                                        SizedBox(
                                                                          width: size.width * 0.01,
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: size.width * 0.15,
                                                                              child: Text(
                                                                              addedCardsData![index].emails![0].email!=null?  addedCardsData![index].emails![0].email.toString():
                                                                                    '',
                                                                                style: TextStyle(
                                                                                  fontSize: size.height * 0.004,
                                                                                  color: signupclor_dark,
                                                                                  fontFamily: "Mbold",
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: size.height * 0.001,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        SvgPicture.asset(
                                                                          internet_icon,
                                                                          height: size.height * 0.005,
                                                                        ),
                                                                        SizedBox(
                                                                          width: size.width * 0.01,
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              width: size.width * 0.15,
                                                                              child: Text(

                                                                                "${addedCardsData![index].website}",
                                                                                style: TextStyle(
                                                                                  fontSize: size.height * 0.006,
                                                                                  color: signupclor_dark,
                                                                                  fontFamily: "Mbold",
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          
                                    SizedBox(width: size.width*0.04,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          addedCardsData![index].companyName!=null?
                                          addedCardsData![index].companyName.toString():'',style: TextStyle(
                                            fontSize: size.height*0.015,
                                            fontFamily:"MBold"
                                        ),),
                                        SizedBox(height: size.height*0.02,),
                                        Text(  addedCardsData![index].jobTitle!=null?
                                          addedCardsData![index].jobTitle.toString():"",style: TextStyle(
                                            fontSize: size.height*0.012,
                                            fontFamily: "Msemibold",
                                            color: infocolor
                                        ),),
                                        SizedBox(height: size.height*0.01,),
                                        Text(  addedCardsData![index].username!=null?
                                          addedCardsData![index].username.toString():''
                                        ,style: TextStyle(
                                            fontSize: size.height*0.012,
                                            fontFamily: "Msemibold",
                                            color: infocolor
                                        ),),
                                      ],
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: (){
                                        _moreModalBottomSheet(context,AddedGroupCardsListData(),index);
                                      },
                                      child: Icon(Icons.more_vert,color: signupclor_dark,))
                                  ],
                                ),
                              ):Center(child: Text('No Record Found'));
                            }
                        ),
                      ),
                    ):Center(child: Text(' No cards Added ')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //   Widget cardWidget(context, GroupCardsList? groupCardsList ){
  //   var size = MediaQuery.of(context).size;
  //   return Container(
  //     height: size.height * 0.29,
  //     // margin:const EdgeInsets.all(0.4),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       color: Colors.transparent,
  //     ),
  //     child:groupCardsList!.groupCardsListData!=null? ListView.builder(
  //       itemCount: groupCardsList.groupCardsListData!.length,
  //       itemBuilder: (context,index){
  //       return  
  //     }):Text(''),
  //     // child:
  //   );
  // }


    void _manageModalBottomSheet(context,int? groupId){
    var size = MediaQuery.of(context).size;
TextEditingController reNameController= TextEditingController();
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
                             InkWell(
                              onTap: (){
                                  showDialog(
                                    
                    context: context,
                    builder: (BuildContext context,) => Container(
                          margin: EdgeInsets.only(bottom: size.height * 0.1),
                          child: Dialog(
                            alignment: AlignmentDirectional.bottomCenter,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            //this right here
                            child: Container(
                              height: size.height * 0.3,
                              width: size.width * 0.9,
                              child: Padding(
                                padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.02),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Rename Group',
                                            style: TextStyle(color: Colors.black, fontSize: size.height * 0.018, fontFamily: 'MBold'),
                                          ),
                                          Container(
                                            height: size.height * 0.01,
                                            width: size.width * 0.02,
                                          ),
                                          
                                          // Spacer(),
                                          InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                size: 20,
                                              ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.06,
                                    ),
                                    Container(
                         height: size.height * 0.09,
                            // width: size.width * 0.8,
                          child: TextFormField(
                            controller: reNameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              filled:true,
                              hintText: 'Group name', contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                              hintStyle: TextStyle(
                                  fontSize: size.width * 0.04, color: infocolor),
                            ),
                          ),
                        ),
                
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                     Container(
                        height: size.height*0.04,
                        width: size.width*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color:primaryblue )
                        ),
                        child: Center(
                          child: Text('Cancel',style: TextStyle(
                          fontFamily: 'Msemibold',
                          fontSize: size.height*0.018,
                          color: primaryblue
                      ),),
                        ),
                      ),
                    InkWell(
                      onTap: ()async{
                     var result=   await GroupsController().updateGroup(reNameController.text, int.parse(widget.groupId.toString()));
                        if(result['code']==200){
                          Globals.showToastMethod(msg: "Record Updated Successfully");
                        }else{
                          Globals.showToastMethod(msg: 'There is something went wrong');
                        }
                        setSte((){
                          setState(() {
                            
                          });
                        });
                      },
                      child: Container(
                          height: size.height*0.04,
                          width: size.width*0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color:primaryblue )
                          ),
                          child: Center(
                            child: Text('save',style: TextStyle(
                            fontFamily: 'Msemibold',
                            fontSize: size.height*0.018,
                            color: primaryblue
                        ),),
                          ),
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
                               child: Text('Rename Group',
                               style: TextStyle(
                                 fontFamily: "Stf",
                                 fontSize: size.height*0.015,
                               ),),
                             )
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
                             InkWell(
                              onTap: ()async{
                                  customeAlertDialogue(
                                  context:context ,title:'Delete Group From List',content: 'Are you sure you want to delete this Group',btn1text: 'Delete?',btn2Text: 'Cancel', onTap1Btn: () async {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                // setState(() {
                                                //   context
                                                //       .read<AppProvider>()
                                                //       .setLoadingTrue();
                                                // });
                                                // loaderWidget(context, size);
                                                await GroupsController()
                                                    .deleteGroupFromList(
                                                        widget.groupId!
                                                            .toString());
                                                // Navigator.pop(context);
                                                setState(() {
                                                Globals.groupListModal!.groupListData
                                                      !.removeAt(groupId!);
                                                  // context
                                                  //     .read<AppProvider>()
                                                  //     .setLoadingFalse();
                                                });
                                                
                                              },   onTap2Btn: () async {
                                                Navigator.pop(context);
                                              }, );
                                // await GroupsController().deleteGroupFromList(widget.groupId.toString());
                                // setState(() {
                                  
                                // });

                              },
                               child: Text('Delete',
                               style: TextStyle(
                                 fontFamily: "Stf",
                                 fontSize: size.height*0.015,
                               ),),
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

   void _moreModalBottomSheet(context, AddedGroupCardsListData? addedGroupCardsListData,int? index,) {
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
                            Text(Globals.addedCardsToGroupListModal!.addedGroupCardsListData![0].username!=null? Globals.addedCardsToGroupListModal!.addedGroupCardsListData![0].username.toString():'',
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
                             InkWell(
                              onTap: ()async{
                                customeAlertDialogue(
                                  context:context ,title:'Delete Card From Group',content: 'Are you sure you want to delete this card',btn1text: 'Delete?',btn2Text: 'Cancel', onTap1Btn: () async {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                // setState(() {
                                                //   context
                                                //       .read<AppProvider>()
                                                //       .setLoadingTrue();
                                                // });
                                                // loaderWidget(context, size);
                                                await GroupsController()
                                                    .deleteCardFromGroupList(
                                                       Globals.addedCardsToGroupListModal!.addedGroupCardsListData![0].id.toString(),
                                                        widget.groupId!
                                                            .toString());
                                                // Navigator.pop(context);
                                                setState(() {
                                                  Globals.addedCardsToGroupListModal!.addedGroupCardsListData
                                                      !.removeAt(index!);
                                                  // context
                                                  //     .read<AppProvider>()
                                                  //     .setLoadingFalse();
                                                });
                                                
                                              },   onTap2Btn: () async {
                                                Navigator.pop(context);
                                              }, );
                              },
                               child: Column(
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
