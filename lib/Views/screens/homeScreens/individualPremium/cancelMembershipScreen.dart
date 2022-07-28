import 'package:concard/Constants/colors.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:flutter/material.dart';

class CancelMembershipScreen extends StatefulWidget {
  CancelMembershipScreen({Key? key}) : super(key: key);

  @override
  State<CancelMembershipScreen> createState() => _CancelMembershipScreenState();
}

class _CancelMembershipScreenState extends State<CancelMembershipScreen> {

var dataList=[
  'Technical issues',
  'Cost-related reasons',
  'Technical issues',
  'I found a better app',
  'other',

];
String? isSelect;

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
                  Text(
                    'Manage membership',
                    style: TextStyle(
                        fontFamily: "MBold",
                        fontSize: size.height * 0.018,
                        color: bckgrnd),
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
                padding: EdgeInsets.only(
                    left: size.width * 0.03,
                    right: size.width * 0.03,
                    top: size.height * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "What's making you cancel?",
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "Mbold",
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      'Hello XXX,',
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "Mbold",
                      ),
                    ),
                    Text(
                      "We are sad to see you leave.\nBefore you cancel, can you tell us why\nyou're leaving us?",
                      style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontFamily: "Msemibold",
                          ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    Container(
                      height: size.height*0.5,
                      width:size.width,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: dataList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(dataList[index],style: TextStyle(
                                    fontSize: size.height*0.015,
                                    fontFamily: "MBold",
                                  ),),
                                  Radio(
                              value: index.toString(),
                              groupValue: isSelect,
                              onChanged: (dynamic newValue) =>
                                  setState(() => isSelect= newValue),
                              activeColor: signupclor_dark,
                              // selected: false,
                        ),
                                ],
                              ),
                              Divider(
                                thickness: 1,
                              ),
                            ],
                          );
                        }
                        ),
                    ),
                    SizedBox(
                      height: size.height*0.1
                    ),
                     InkWell(
                       onTap: (){
                         _cancelMembershipModalBottomSheet(context);
                       },
                       child: Center(
                         child: CustomButton(text: "Cancel Membership", color1: signupclor_light, color2: signupclor_dark, textcolor1: bckgrnd, textcolor2: bckgrnd)),
                     )
                  ],
                ),
              )),
             
        ],
      ),
    );
  }
   void _cancelMembershipModalBottomSheet(context) {
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
                  height: size.height*.26,
                  width:size.width,
                child: Padding(
                  padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03,top: size.height*0.02),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cancel Subscription?',
                          style: TextStyle(
                            fontFamily: "MBold",
                            fontSize:size.height*0.018,
                            color: crs_clr
                          ),),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close,size: size.height*0.03,))
                        ],
                      ),
                      SizedBox(height: size.height*0.01,),
                      Text("Your subscription will be cancelled at the end\nof your billing period on 12 May 2022, and you\nwon't be charged anymore.",
                          style: TextStyle(
                            fontFamily: "Stf",
                            fontSize:size.height*0.018,
                            
                          ),),
                          SizedBox(
                            height: size.height*0.03,
                          ),
                           Padding(
                  padding:  EdgeInsets.only(left:size.width*0.03,right: size.width*0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                        },
                        child: Container(
                          height:size.height*0.05,
                          width:size.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: signupclor_dark),
                            borderRadius:BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text('Keep membership',
                            style:TextStyle(
                              fontSize: size.height*0.014,
                              fontFamily: "MBold",
                              color: signupclor_dark
                            )
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          
                        },
                        child: Container(
                          height:size.height*0.05,
                          width:size.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: crs_clr),
                            borderRadius:BorderRadius.circular(20)
                          ),
                          child: Center(
                            child: Text('Cancle membership',
                            style:TextStyle(
                              fontSize: size.height*0.014,
                              fontFamily: "MBold",
                              color: crs_clr
                            )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    ]
                  ),
                ),
              );
            },
          );
        });
  }
}
